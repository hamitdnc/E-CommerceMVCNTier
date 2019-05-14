using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaret.BLL;
using ETicaret.DLL;

namespace ETicaretHSabahAdmin.Controllers
{
    public class PersonellerController : Controller

    {
        PersonelRolManager perRol = new PersonelRolManager();
        PersonelManager perman = new PersonelManager();
        // GET: Personeller
        public ActionResult PersonelIndex()
        {
            ViewBag.Rol = perRol.PersonelRolGetir();
            return View();
        }

        [HttpPost]
        public ActionResult PersonelIndex(string tc, string ad, string soyad, string email, string tel, DateTime dogumTarihi, string cinsiyet, string medenihali, string unvan, DateTime kayitTarih, string adres, string kul_adi, string kul_sif, int RolID)
        {
            ViewBag.Rol = perRol.PersonelRolGetir();
            perman.InsertPersonel(tc,ad,soyad,email,tel,dogumTarihi,cinsiyet,medenihali,unvan,kayitTarih,adres,kul_adi,kul_sif, RolID);
            return View();
        }

        public ActionResult PersonelListeIndex()
        {
            return View(perman.PersonelGetir());
        }

        public ActionResult PersonelGuncelleIndex(int? PersonellerID)
        {
            ViewBag.Personel = perman.PersonelGetir();
            ViewBag.Rol = perRol.PersonelRolGetir();

            return View(perman.PersonelBul((int)PersonellerID));
        }

        [HttpPost]
        public ActionResult PersonelGuncelleIndex(Personeller tabloPersoneller)
        {
            int gnc = perman.PersonelGuncelle(tabloPersoneller);
            if (gnc > 0)
            {
                ViewBag.mesaj = "<h5> Güncelleme Başarılı </h5>";
            }
            else
            {
                ViewBag.mesaj = "<h5> Güncelleme Olmadı. Kontrol ediniz</h5>";
            }
            ViewBag.Personel = perman.PersonelGetir();
            ViewBag.Rol = perRol.PersonelRolGetir();

            return View(perman.PersonelBul(tabloPersoneller.PersonellerID));
        }

        [HttpPost]
        public void PersonelSil(int personel_id)
        {
            perman.PersonelSil(personel_id);
        }
       
    }
}