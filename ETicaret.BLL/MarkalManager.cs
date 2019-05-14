using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETicaret.DLL;

namespace ETicaret.BLL
{
    public class MarkalManager
    {
        EticaretDBEntities db = new EticaretDBEntities();

        Repository<Markalar> rep = new Repository<Markalar>();

        public MarkalManager()
        {
            rep.Liste();
        }
        public void InsertMarka(string adi, int personelID)
        {
            int Ekle = rep.insert(new Markalar() {
                MarkaAdi = adi,
                PersonelID=personelID
            });
        }
        public List<Markalar> MarkaListele()
        {
            return rep.Liste();
        }
     
        public Markalar MarkaBul(int marka_Id)
        {
            return rep.VeriBul(v => v.MarkalarID == marka_Id);
        }

        //public int MarkaGuncelle(string Marka_Adi,int Personel_ID)
        //{
        //    return rep.Update();
        //}

        public int Guncelle(Markalar tabloGuncelle)
        {
            //Repository yapısı ile güncelleme olmuyor
            db.Entry(tabloGuncelle).State = System.Data.Entity.EntityState.Modified;
            if (db.SaveChanges()>0)
            {
                return 1;
            }
            return 0;
            //db.SaveChanges();
        }
    }
}
