using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaret.BLL;
using ETicaret.DLL;

namespace ETicaret.Controllers
{
    public class UyelerController : Controller
    {
        UyeManager uyeMan = new UyeManager();

        // GET: Uyeler
        public ActionResult UyerlerIndex()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UyerlerIndex(string UyeAdi, string Email,string Sifre,string Sifre_Tekrar)
        {
            if (Sifre!=Sifre_Tekrar)
            {
                ViewBag.SifreAynimi = "Şifreler Uyuşmuyor";
                return View();
            }
            else
            {
                DateTime tarih = DateTime.Now;
                uyeMan.UyeKaydet(UyeAdi,null,Convert.ToDateTime(tarih.ToShortDateString()),Email,null,null,null,null,"",Email,Sifre);
                //return RedirectToAction("YorumIndex","Yorum");
                return RedirectToAction("HomeIndex", "Home");
                //RedirectToAction ile ındex adı ve klasör adı vererek, klasör altındaki Index i çalıştırmasını sağlıyoruz.
                //Bu RedirectToAction aldığı parametre ile Controller altındaki ActionName parametre alır, ikinci parametresi ise Controller adını alarak aynı Klasör mantığında olduğu gibi Index sayfası çalıştırır.
            }
           
        }

        public ActionResult UyeGirisIndex()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UyeGirisIndex(string KullaniciAdi,string KullaniciSifre)
        {
            var login = uyeMan.UyeGiris(KullaniciAdi, KullaniciSifre);
            if (login!=null)
            {
                Session["İsim"] = login.UyeAdi+""+login.UyeSoyadi;
                return RedirectToAction("HomeIndex","Home");
            }
            ViewBag.LoginMesaj = "Kullanıcı Adı ve Şifresi hatalı";

            return View();
        }
    }

}