using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaret.BLL;
using ETicaret.DLL;

namespace ETicaretHSabahAdmin.Controllers
{
    public class MarkalarController : Controller
    {
        MarkalManager markman = new MarkalManager();
        // GET: Markalar
        public ActionResult MarkalarIndex()
        {
            
            //Form Load
            return View();
        }
        [HttpPost]

        public ActionResult MarkalarIndex(string textmarkaAdi,string personelId)
        {
            string mesaj = null;
            if (textmarkaAdi!=null)
            {
                personelId = "1";
                markman.InsertMarka(textmarkaAdi, Convert.ToInt32(personelId)); 
           
            }
            return View();
        }
        public ActionResult MarkalarGuncelle(int? Marka_ID)
        {
            return View(markman.MarkaBul((int)Marka_ID));
        }


      
        [HttpPost]
        public ActionResult MarkalarGuncelle(Markalar markTablo)
        {
            int gnc=markman.Guncelle(markTablo);
            if (gnc>0)
            {
                TempData["GuncelleMesaj"] = "<h3 style='color:red;'>Marka Güncelleme Başarılı";
            }
            else
            {
                TempData["GuncelleMesaj"] = "<hr style='border:1px;color:red'>Marka Güncelleme Olmadı. Kontrol ediniz";

            }
            return View();

        }
    }
}