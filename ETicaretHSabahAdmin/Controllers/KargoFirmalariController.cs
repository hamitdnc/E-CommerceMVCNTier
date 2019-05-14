using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaret.BLL;
using ETicaret.DLL;

namespace ETicaretHSabahAdmin.Controllers
{
    public class KargoFirmalariController : Controller
    {
        KargoFirmalariManager karfirman = new KargoFirmalariManager();
        
        // GET: KargoFirmalari
        public ActionResult KargoFirmalariIndex()
        {
            return View();
        }
        [HttpPost]
        public ActionResult KargoFirmalariIndex(string kargoadi, DateTime anlasma_bas, DateTime anlasma_bit, string aciklama)
        {
            karfirman.InsertKargoFirma(kargoadi, anlasma_bas, anlasma_bit, aciklama);
            return View();
        }

        public ActionResult KargoFirmalariGuncelle(int? kargofirma_Id)
        {
            return View(karfirman.KargoFirmaBul((int)kargofirma_Id));
        }

        [HttpPost]
        public ActionResult KargoFirmalariGuncelle(KargoFirmalari tabloKargoFirma)
        {
            int gnc = karfirman.KargoFirmalariGuncelle(tabloKargoFirma);
            if (gnc > 0)
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