using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETicaret.DLL;

namespace ETicaret.BLL
{
    public class UrunOzellikleriManager
    {
        EticaretDBEntities db = new EticaretDBEntities();
        Repository<UrunOzellikleri> rep = new Repository<UrunOzellikleri>();
        
        public UrunOzellikleriManager()
        {
            rep.Liste();
        }

        public int InsertUrunOzellikleri(int urun_Id, string ozellikTanimi, string olcuBirimi, decimal birimStok, decimal kalanStok)
        {
            int Ekle = rep.insert(new UrunOzellikleri()
            {
                UrunID = urun_Id,
                OzellikTanimi = ozellikTanimi,
                OlcuBirimi = olcuBirimi,
                BirimStok = birimStok,
                KalanStok = kalanStok

            });
            return Ekle;
        }
        public List<UrunOzellikleri> UrunOzellikGetir()
        {
            return rep.Liste();
        }

        public UrunOzellikleri UrunOzellikleriBul(int? urunOzellikleri_Id)
        {
            return rep.ListeFiltre(u => u.UrunOzellikleriID == urunOzellikleri_Id).FirstOrDefault();
        }

        public int UrunOzellikleriGuncelle(UrunOzellikleri tabloUrunOz)
        {
            UrunOzellikleri guncel = rep.VeriBul(u => u.UrunOzellikleriID == tabloUrunOz.UrunOzellikleriID);
            if (guncel!=null)
            {
                guncel.UrunOzellikleriID = tabloUrunOz.UrunOzellikleriID;
                guncel.UrunID = tabloUrunOz.UrunID;
                guncel.OzellikTanimi = tabloUrunOz.OzellikTanimi;
                guncel.OlcuBirimi = tabloUrunOz.OlcuBirimi;
                guncel.BirimStok = tabloUrunOz.BirimStok;
                guncel.KalanStok = tabloUrunOz.KalanStok;
                if (rep.Update(tabloUrunOz)>0)
                {
                    return 1;
                }
              
            }
            return 0;
        }
    }
}
