using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETicaret.DLL;

namespace ETicaret.BLL
{
    public class PersonelManager
    {
        EticaretDBEntities db = new EticaretDBEntities();
        Repository<Personeller> per = new Repository<Personeller>();

        public Personeller Giris(string kullanici_Adi, string sifre)
        {
            //var giris1 = per.ListeFiltre(k => (k.KAdi == kullanici_Adi || k.Email == kullanici_Adi) && k.KSifre == sifre);
            //int p_ID = giris1.FirstOrDefault().PerseonellerID;

            var giris2 = per.VeriBul(k => (k.KAdi == kullanici_Adi || k.Email == kullanici_Adi) && k.KSifre == sifre);
            //aşağıdaki Id yapısı ile VeriBul metodunun  içinde FirstOrDefault() olmasından dolayı alabildik.Aynı işlemi ListeFiltre() metodu ile almak için giris1.FirstOrDefault() dedikten sonra almamız lazım. Hangisi kolayınıza gelirse yapınız.
            //int PersId = giris2.PerseonellerID;
            return giris2;
        }



        public PersonelManager()
        {
            per.Liste();
        }
        public void InsertPersonel(string tc , string ad, string soyad, string email, string tel, DateTime dogumTarihi,string cinsiyet, string medenihali, string unvan , DateTime kayitTarih, string adres, string kul_adi,string kul_sif, int RolID)
        {
            int Ekle = per.insert(new Personeller()
            {
                TC=tc,
                Adi=ad,
                Soyadi=soyad,
                Email=email,
                Telefon=tel,
                DogumTarihi=dogumTarihi,
                Cinsiyet=cinsiyet,
                MedeniHali=medenihali,
                Unvan=unvan,
                KayitTarihi=kayitTarih,
                Adres=adres,
                KAdi=kul_adi,
                KSifre=kul_sif,
                RolID= RolID
            });
        }
        public List<Personeller> PersonelGetir()
        {
            return per.Liste();
        }


        public Personeller PersonelBul(int? personeller_Id)
        {

            return per.ListeFiltre(p => p.PersonellerID == personeller_Id).FirstOrDefault();

        }

        public int PersonelGuncelle(Personeller tabloPersonel)
        {
            Personeller guncel = per.VeriBul(p => p.PersonellerID == tabloPersonel.PersonellerID);
            if (guncel != null)
            {
                guncel.PersonellerID = tabloPersonel.PersonellerID;
                guncel.TC = tabloPersonel.TC;
                guncel.Adi = tabloPersonel.Adi;
                guncel.Soyadi = tabloPersonel.Soyadi;
                guncel.Email = tabloPersonel.Email;
                guncel.Telefon = tabloPersonel.Telefon;
                guncel.DogumTarihi = tabloPersonel.DogumTarihi;
                guncel.Cinsiyet = tabloPersonel.Cinsiyet;
                guncel.MedeniHali = tabloPersonel.MedeniHali;
                guncel.Unvan = tabloPersonel.Unvan;
                guncel.KayitTarihi = tabloPersonel.KayitTarihi;
                guncel.Adres = tabloPersonel.Adres;
                guncel.KAdi = tabloPersonel.KAdi;
                guncel.KSifre = tabloPersonel.KSifre;
                guncel.RolID = tabloPersonel.RolID;


                if (per.Update(tabloPersonel) > 0)
                {
                    return 1;
                }

            }
            return 0;
        }

        public int PersonelSil(int IdPersonel)
        {
            Personeller silPersonel = per.VeriBul(p => p.PersonellerID == IdPersonel);
            if (silPersonel!=null)
            {
                if (per.Delete(silPersonel)>0)
                {
                    return 1;
                }
            }
            return 0;
        }
    }
}
