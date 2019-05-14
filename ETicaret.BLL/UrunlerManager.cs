using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETicaret.DLL;

namespace ETicaret.BLL
{
    public class UrunlerManager
    {
        EticaretDBEntities db = new EticaretDBEntities();
        Repository<Urunler> rep = new Repository<Urunler>();

        public UrunlerManager()
        {
           rep.Liste();
        }
        public void InsertUrunler(int kategoriId, int markaId, string urunadi, decimal urunfiyat, string urunolcutanimi ,decimal urunstok, string urunaciklama, int personelId)
        {
            int Ekle = rep.insert(new Urunler()
            {
                KategoriID=kategoriId,
                MarkaID=markaId,
                UrunAdi=urunadi,
                UrunFiyat=urunfiyat,
                UrunOlcuTanimi=urunolcutanimi,
                UrunStok=urunstok,
                UrunAciklama=urunaciklama,
                PersonelID=personelId

            });

        }
        public List<Urunler> UrunGetir()
        {
           return rep.Liste();
        }
        public Urunler urunDetay(int urunId)
        {
            return rep.ListeFiltre(k => k.UrunlerID == urunId).FirstOrDefault();
            // FirstOrDefault() ==> varsa veri>0
            // FirstOrDefault() ==> yoksa veri 0 olacak==> false
        }

        public Urunler UrunlerBul(int? urunler_Id)
        {
            //where içinde bir sorguya ihtiyacımız olduğundan
            return rep.ListeFiltre(u => u.UrunlerID == urunler_Id).FirstOrDefault();
   
        }

        public int UrunGuncelle(Urunler tabloUrun)
        {
            Urunler guncelle = rep.VeriBul(k => k.UrunlerID == tabloUrun.UrunlerID);
           
            if (guncelle!=null)
            {
                guncelle.UrunAdi = tabloUrun.UrunAdi;
                guncelle.KategoriID = tabloUrun.KategoriID;
                guncelle.MarkaID = tabloUrun.MarkaID;
                guncelle.UrunFiyat = tabloUrun.UrunFiyat;
                guncelle.UrunOlcuTanimi = tabloUrun.UrunOlcuTanimi;
                guncelle.UrunStok = tabloUrun.UrunStok;
                guncelle.UrunAciklama = tabloUrun.UrunAciklama;
                guncelle.PersonelID = tabloUrun.PersonelID;
                if (rep.Update(tabloUrun)>0)
                {
                    return 1;
                }
                //return 0;
            }
            //db.Entry(tabloUrun).State = System.Data.Entity.EntityState.Modified;
            //if (db.SaveChanges() > 0)
            //{
            //    return 1;
            //}
            return 0;
        }

        public int UrunSil(int IdUrun)
        {
            Urunler silUrun = rep.VeriBul(u => u.UrunlerID == IdUrun);
            if (silUrun!=null)
            {
                if (rep.Delete(silUrun)>0)
                {
                    return 1;
                }
            }
            return 0;
        }
    }
}
