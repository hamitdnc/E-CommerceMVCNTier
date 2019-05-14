using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETicaret.DLL;

namespace ETicaret.BLL
{
    public class UyeManager
    {
        Repository<Uyeler> repUye = new Repository<Uyeler>();

        public void UyeKaydet(string uyeadi, string uyesoyadi, DateTime kayitTarihi, string email, string telefon, DateTime? dogumTarihi, string cinsiyet, string medenihali, string meslek, string kul_adi, string kul_sifre)
        {
            int Ekle = repUye.insert(new Uyeler()
            {
                UyeAdi=uyeadi,
                UyeSoyadi=uyesoyadi,
                KayitTarihi=kayitTarihi,
                Email=email,
                Telefon=telefon,
                DogumTarihi=dogumTarihi,
                Cinsiyet=cinsiyet,
                MedeniHali=medenihali,
                Meslek=meslek,
                KullaniciAdi=kul_adi,
                KullaniciSifre=kul_sifre
            });
        }

        public void UyeGuncel(int uyelerId,string uyeadi, string uyesoyadi, DateTime kayitTarihi, string email, string telefon, DateTime dogumTarihi, string cinsiyet, string medenihali, string meslek, string kul_adi, string kul_sifre)
        {
            Uyeler upt = repUye.VeriBul(g => g.UyelerID == uyelerId);
            //var upt1 = repUye.ListeFiltre(k => k.UyelerID == uyelerId).FirstOrDefault();
            if (upt!=null)
            {
        
            }
        }

        public void UyeSil(int uyelerId )
        {
            int Sil = repUye.Delete(new Uyeler()
            {
                UyelerID=uyelerId
            });
        }

        public List<Uyeler> UyeGetir()
        {
            return repUye.Liste();
        }



        public Uyeler UyeGiris(string k_Adi,string k_Sifre)
        {
            Uyeler giris = repUye.VeriBul(k => (k.KullaniciAdi == k_Adi || k.Email == k_Adi) && k.KullaniciSifre == k_Sifre);
            if (giris!=null)
            {
                return giris;
            }
            return giris;
        }
    }
}
