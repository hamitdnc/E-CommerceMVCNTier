using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaret.BLL;
using ETicaret.DLL;
namespace ETicaretHSabahAdmin.Controllers
{
    public class LoginController : Controller
    {
        PersonelManager persMan = new PersonelManager();
        PersonelRolleri perRol = new PersonelRolleri();
        // GET: Login
        public ActionResult LoginIndex()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginIndex(string kullaniciAdi,string sifre)
        {
            var loginGiris = persMan.Giris(kullaniciAdi, sifre);
            if (loginGiris!=null)
            {
                Session["per_isim"] = loginGiris.Adi + " " + loginGiris.Soyadi;
                Session["yetki"] = perRol.RolAdi;

                //Admin sayfasına Yöndendirme yapılacak
                ViewBag.personelID = loginGiris.PersonellerID;
                //PersonellerID değerini bütün Sayfalarda
                return RedirectToAction("DefaultIndex", "Default");
            }
            ViewBag.mesaj = "<hr/><h5 style='color:red'>Kullanici adı veya şifre hatalı </h5>";
            return View();
        }
    }
}