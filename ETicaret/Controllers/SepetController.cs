using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaret.BLL;
using ETicaret.DLL;


namespace ETicaret.Controllers
{
    public class SepetController : Controller
    {
        // GET: Sepet
        public ActionResult SepetIndex()
        {
            /*https://bootsnipp.com/snippets/ZXKKD form kısmı*/
            return View(SepetiGetir());
        }

        public ActionResult SepeteEkle(int UrunlerID)//HiddenFor ile gönderilen DI değeri veritabanındaki ID kolonlu isim ile gönderiliyır Bu Parametre de Veritabanındaki isim ,le aynı olmalıdır.
        {
            //ilk önce sepet getirişecek ve getirilen sepete ürüne eklemesi yapılcak
            SepetiGetir().SepeteUrunEkle(UrunlerID, 1);
            return RedirectToAction("SepetIndex");
        }

        public ActionResult SepettenAzalt(int UrunlerID)
        {
            SepetiGetir().SepetUrunAzalt(UrunlerID);
            return RedirectToAction("SepetIndex");
        }
        public ActionResult SepettenSil(int UrunlerID)
        {
            SepetiGetir().UrunuSepettenSil(UrunlerID);
            return RedirectToAction("SepetIndex");
        }



        public SepetManager SepetiGetir()
        {
            var SepetOlustur = (SepetManager)Session["SepetManager"];// varsayılan olarak ilk oluşturduğumuz değişken bu olduğunda şu an içi boştur
            if (SepetOlustur== null)
            {
                //Session["SepetManager"] ilk boş geldiğinden SepetManager() class'ından örnek alarak oluşturuyorum
                SepetOlustur = new SepetManager();
                Session["SepetManager"] = SepetOlustur;
            }
            return SepetOlustur;
        }
    }
}