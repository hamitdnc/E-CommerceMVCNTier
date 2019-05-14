using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETicaret.DLL;

namespace ETicaret.BLL
{
    public class DuyurularManager
    {
        EticaretDBEntities db = new EticaretDBEntities();
        Repository<Duyurular> repduy = new Repository<Duyurular>();

        public DuyurularManager()
        {
           repduy.Liste();
        }
        public void InsertDuyuru(DateTime bas_tar, DateTime bit_tar, string duyurubasligi,string duyuru, string aciklama)
        {
            int Ekle = repduy.insert(new Duyurular()
            {
                BaslangicTarihi=bas_tar,
                BitisTarihi=bit_tar,
                DuyuruBasligi=duyurubasligi,
                Duyuru=duyuru,
                Aciklama=aciklama
            });
        }
        public List<Duyurular> DuyuruGetir()
        {
            return repduy.Liste();
        }
    }
}
