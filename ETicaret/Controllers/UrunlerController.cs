using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaret.BLL;
using ETicaret.DLL;


namespace ETicaret.Controllers
{
    public class UrunlerController : Controller
    {
        UrunlerManager urunman = new UrunlerManager();
        UrunYorumlariManager yorMan = new UrunYorumlariManager();
        // GET: Urunler
        public ActionResult UrunlerIndex()
        {
            return View();
        }
        public ActionResult UrunDetay()
        {
            //ürünler sayfaında üründetay tıklandığında ürün ıd değerini tutacak Route data kodlaması yapacağız
            var dataId = RouteData.Values["id"];
            var detay = urunman.urunDetay(Convert.ToInt32(dataId));
            return View(detay);

        }

        public ActionResult UrunYorumIndex()
        {
            return View();
        }

        [HttpPost]
        public void UrunYorumIndex(string YorumBaslik,string YorumMetni, int? nameurunlerID, int? uyeId)
        {
            //Ekleme işlemi JavaScript ile yapılacak
            yorMan.InsertYorum(1, (int)nameurunlerID, YorumBaslik, YorumMetni, 0, Convert.ToDateTime(DateTime.Now.ToShortDateString()), 1, 1);
        }
    }
}