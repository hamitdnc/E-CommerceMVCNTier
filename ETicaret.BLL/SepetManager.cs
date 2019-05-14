using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETicaret.DLL;

namespace ETicaret.BLL
{

    public class SepetManager
    {
        Repository<Urunler> rep = new Repository<Urunler>();
        private List<SepetSinifi> _liste = new List<SepetSinifi>();

        public List<SepetSinifi> SepetSinifi
        {
            get { return _liste; }
        }
        public decimal SepetToplamFiyat()
        {
            return _liste.Sum(k => (decimal)k.SepetttekiUrun.UrunFiyat * k.SepettekiMiktar);
        }

        public void SepeteUrunEkle(int urun_Id, decimal sep_Miktar)
        {
            Urunler varMiUrun = rep.VeriBul(k => k.UrunlerID == urun_Id);//veritabanında gelen Id değerine sahip ürün var mı, yok mu???
            if (varMiUrun!=null)
            {
                // bu alan sepete ekleme işlemidir
                var eklenecekUrun= _liste.FirstOrDefault(h => h.SepetttekiUrun.UrunlerID == varMiUrun.UrunlerID);
                if (eklenecekUrun==null)
                {
                    // sepette bu eklenecek üründen hiç yok ise yeni ürün eklnecek
                    _liste.Add(new SepetSinifi() { SepetttekiUrun = varMiUrun, SepettekiMiktar = sep_Miktar });
                }
                else
                {
                    //sepette varsa miktarı kadar eklemesi sağla
                    eklenecekUrun.SepettekiMiktar = eklenecekUrun.SepettekiMiktar + sep_Miktar;
                }
            }

        }
        public void SepetUrunAzalt(int urun_Id)
        {
            Urunler varMi = rep.VeriBul(k => k.UrunlerID == urun_Id);
            if (varMi!=null)
            {
                var sil = _liste.FirstOrDefault(k => k.SepetttekiUrun.UrunlerID == varMi.UrunlerID);//RemoveAll ile yukarda iki satırla yapılan işlemi, RemoveAll Lamda Expetion Sorgusu alarak yapmaktadır
                if (sil.SepettekiMiktar>1)
                {
                    sil.SepettekiMiktar = sil.SepettekiMiktar - 1;
                }
                else
                {
                    _liste.Remove(sil);
                }

                //_liste.Remove(sil);
                //_liste.RemoveAll(k => k.SepetttekiUrun.UrunlerID == varMi.UrunlerID);
            }
        }

        public void UrunuSepettenSil(int urunler_ID)
        {

            _liste.RemoveAll(k => k.SepetttekiUrun.UrunlerID == urunler_ID);
        }
    }

    public class SepetSinifi
    {
        //Sepet sanal tablosu
        public Urunler SepetttekiUrun { get; set; }
        public decimal SepettekiMiktar { get; set; }//burdaki miktarı almamızın sebebi ürünlertablosunda siparişe gidecek miktar belli değildir. Kullanıcı için miktar kısmını belirtmemiz grekli. SepettekiMiktar o nedenle öenmlidir
    }
}
