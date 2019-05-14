using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETicaret.DLL;
namespace ETicaret.BLL
{
    public class KargoFirmalariManager
    {
        EticaretDBEntities db = new EticaretDBEntities();
        Repository<KargoFirmalari> repkarfir = new Repository<KargoFirmalari>();

        public KargoFirmalariManager()
        {
            repkarfir.Liste();
        }
        public void InsertKargoFirma(string kargoadi, DateTime anlasma_bas, DateTime anlasma_bit, string aciklama)
        {
            int Ekle = repkarfir.insert(new KargoFirmalari()
            {
                KargoAdi=kargoadi,
                AnlasmaTarihi=anlasma_bas,
                AnlasmaBitisTarihi=anlasma_bit,
                Aciklama=aciklama
            });
        }
        public List<KargoFirmalari> KargoFirmaGetir()
        {
            return repkarfir.Liste();
        }

        public KargoFirmalari KargoFirmaBul(int Karfirma_Id)
        {
            return repkarfir.VeriBul(k=>k.KargoFirmalariID==Karfirma_Id);
        }

        public int KargoFirmalariGuncelle(KargoFirmalari tabloKarFir)
        {
            db.Entry(tabloKarFir).State = System.Data.Entity.EntityState.Modified;
            if (db.SaveChanges() > 0)
            {
                return 1;
            }
            return 0;
        }
    }
}
