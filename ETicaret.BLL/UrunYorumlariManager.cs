using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using ETicaret.DLL;

namespace ETicaret.BLL
{
    public class UrunYorumlariManager
    {
        Repository<Yorumlar> repYorum = new Repository<Yorumlar>();
        EticaretDBEntities db = new EticaretDBEntities();


        public void InsertYorum(int uyeId,int urunId, string yorumBasligi, string yorumMetni, int star, DateTime tarih, int begenmeSayisi, int begenmemeSayisi)
        {
            int Ekle = repYorum.insert(new Yorumlar()
            {
                UyeID = uyeId,
                UrunID = urunId,
                YorumBasligi = yorumBasligi,
                YorumMetni = yorumMetni,
                Star = star,
                Tarihi = tarih,
                BegenmeSayisi = begenmeSayisi,
                BegenmemeSayisi = begenmemeSayisi,
                OnayDurumu = false
            });
        }

        public void UpdateYorum(int yorumlarId,int uyeId, int urunId, string yorumBasligi, string yorumMetni, int star, DateTime tarih, int begenmeSayisi, int begenmemeSayisi)
        {
            int Guncel = repYorum.Update(new Yorumlar()
            {

                UyeID = uyeId,
                UrunID = urunId,
                YorumBasligi = yorumBasligi,
                YorumMetni = yorumMetni,
                Star = star,
                Tarihi = tarih,
                BegenmeSayisi = begenmeSayisi,
                BegenmemeSayisi = begenmemeSayisi
            });

        }

        public List<Yorumlar> YorumGetir(int urunlerID)
        {
            return repYorum.ListeFiltre(k => k.UrunID == urunlerID).ToList();
        }

        public Yorumlar urunYorumlar(int yorumlarId)
        {
            return repYorum.ListeFiltre(k => k.YorumlarID == yorumlarId &&k.OnayDurumu==true).FirstOrDefault();
        }

      
    }
}
