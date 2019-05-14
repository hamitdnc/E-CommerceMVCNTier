using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETicaret.DLL;

namespace ETicaret.BLL
{
    public class OlcuBirimleriManager
    {
        EticaretDBEntities db = new EticaretDBEntities();
        Repository<OlcuBirimleri> rep = new Repository<OlcuBirimleri>();

        public OlcuBirimleriManager()
        {
            rep.Liste();
        }
        public void InsertOlcuBirim(string olcubirimadi, string olcubirimaciklama)
        {
            int Ekle = rep.insert(new OlcuBirimleri()
            {
                OlcuBirimiAdi= olcubirimadi,
                Aciklama= olcubirimaciklama,
               
            });
        }
        public List<OlcuBirimleri> OlcuBirimGetir()
        {
            return rep.Liste();
        }

        public OlcuBirimleri OlcuBirimBul(int OlcuBirimleri_Id)
        {
            return rep.VeriBul(r => r.OlcuBirimleriID == OlcuBirimleri_Id);
        }

        public OlcuBirimleri OlcuBirimBul(string OlcuBirimleri_Id)
        {
            return rep.VeriBul(r => r.OlcuBirimiAdi == OlcuBirimleri_Id);
        }

        public int Guncelle(OlcuBirimleri tabOlcuGuncelleme)
        {
            db.Entry(tabOlcuGuncelleme).State = System.Data.Entity.EntityState.Modified;
            if (db.SaveChanges() > 0)
            {
                return 1;
            }
            return 0;
        }
    }
}
