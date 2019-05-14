using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETicaret.DLL;

namespace ETicaret.BLL
{
    public class indirimTurleriManager
    {
        EticaretDBEntities db = new EticaretDBEntities();
        Repository<indirimTurleri> rep = new Repository<indirimTurleri>();

        public indirimTurleriManager()
        {
            rep.Liste();
        }
        public void InsertindirimTurleri(string indirimturuadi, string aciklama)
        {
            int Ekle = rep.insert(new indirimTurleri()
            {
                indirimTuruAdi= indirimturuadi,
                Aciklama=aciklama,
            });

        }
        public List<indirimTurleri> indirimTuruGetir()
        {
            return rep.Liste();
        }

        public int IndirimTurleriGuncelle(int? Indirimturleri_Id,indirimTurleri tabloIndirim)
        {
            indirimTurleri guncelle = rep.VeriBul(k=>k.indirimTurleriID==Indirimturleri_Id);
            if (guncelle!=null)
            {
                if (rep.Update(tabloIndirim)>0)
                {
                    return 1;
                }
            }
            return 0;
        }
        public indirimTurleri IndirimTuruBul(int? IndirimTurleri_Id)
        {
            return rep.VeriBul(l => l.indirimTurleriID == IndirimTurleri_Id);
        }
    }


}