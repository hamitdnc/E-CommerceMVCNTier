using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaret.BLL;
using ETicaret.DLL;

namespace ETicaretHSabahAdmin.Controllers
{
    public class OlcuBirimleriController : Controller
    {
        OlcuBirimleriManager olbirman = new OlcuBirimleriManager();
       
        // GET: OlcuBirimleri
        public ActionResult OlcuBirimleriIndex()
        {
            return View();
        }
        [HttpPost]
        public ActionResult OlcuBirimleriIndex(string textolcubirimadi, string textaciklama)
        {
            olbirman.InsertOlcuBirim(textolcubirimadi, textaciklama);
            return View();
        }
        public ActionResult OlcuBirimiGuncelle(int? Id)
        {
            return View(olbirman.OlcuBirimBul((int)Id));
        }


        [HttpPost]
        public ActionResult OlcuBirimiGuncelle(OlcuBirimleri olcuTablo)
        {
            int gnc = olbirman.Guncelle(olcuTablo);
            if (gnc>0)
            {
                TempData["Mesaj"] = "<h3 style='color:red;'>OlcuBirim Güncelleme Başarılı";
            }
            else
            {
                TempData["Mesaj"] = "<hr style='border:1px;color:red'>Marka Güncelleme Olmadı. Kontrol ediniz";
            }
            return View();
        }

    }
}