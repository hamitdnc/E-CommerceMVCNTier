using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETicaret.DLL;

namespace ETicaret.BLL
{
    public class KategorilerManager
    {
        EticaretDBEntities db = new EticaretDBEntities();

        Repository<Kategoriler> rep = new Repository<Kategoriler>();

        public KategorilerManager()
        {
            //db.Kategoriler.ToList();
            //db.Set<T>().ToList();
            rep.Liste();
        }

        public void InsertKaydet(string adi,int parentID,int personelId)
        {
            int ekle = rep.insert(new Kategoriler()
            {
                //KategoriAdi="Elektronik",
                //ParentKategoriID=0
                KategoriAdi=adi,
                ParentKategoriID=parentID,
                PersonelID=personelId
            });
        }
        public List<Kategoriler> KategoriGetir()
        {
            return rep.Liste();
        }

        public Kategoriler KategorilerBul(int KatId)
        {
            return rep.VeriBul(k => k.KategorilerID == KatId);
        }

        public int ParentKategorilerGetir(int Kategori_Id)
        {
            //ParentKategoriId almak için bu metodu yazdık
            try
            {
                var Parent_Id = rep.VeriBul(k => k.KategorilerID == Kategori_Id).ParentKategoriID;
                return (int)Parent_Id;
            }
            catch (Exception)
            {

                return 0;
            }
        }

        //public void KategoriGuncelle(int Kategori_Id,string Kategori_Adi,int ParentKat_Id,int Personel_Id)
        public int KategoriGuncelle(int Kategori_Id, Kategoriler tabloKategori)
        {
            var guncelleSorgu = rep.VeriBul(k => k.KategorilerID == Kategori_Id);
            if (guncelleSorgu==null)
            {
                guncelleSorgu.KategoriAdi = tabloKategori.KategoriAdi;
                guncelleSorgu.ParentKategoriID = tabloKategori.ParentKategoriID;
                guncelleSorgu.PersonelID = tabloKategori.PersonelID;
                //Kategoriler tabloKategori = new Kategoriler();
                int GncSonuc=rep.Update(tabloKategori);
                if (GncSonuc>0)
                {
                    return 1;
                }
                //return 0;
            }
            return 0;
        }
        public int KategoriSil(int IdKategori)
        {
            Kategoriler sil = rep.VeriBul(k => (k.KategorilerID == IdKategori && k.ParentKategoriID != IdKategori));
            //var parentIDvarmi = db.Kategoriler.Where(k => k.ParentKategoriID == IdKategori).Select(z => z.ParentKategoriID).ToList();
            var ParentIDvarmi = rep.ListeFiltre(k => k.ParentKategoriID == IdKategori).ToList();
            if (ParentIDvarmi.Count()==0)
            {
                if (rep.Delete(sil)>0)
                {
                    return 1;
                }
            }
            return 0;
        }
     
    }
}
