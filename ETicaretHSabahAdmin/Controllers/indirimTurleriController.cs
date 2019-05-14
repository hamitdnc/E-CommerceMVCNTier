using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaret.BLL;

namespace ETicaretHSabahAdmin.Controllers
{
    public class indirimTurleriController : Controller
    {
        indirimTurleriManager indturman = new indirimTurleriManager();
        // GET: indirimTurleri
        public ActionResult indirimTurleriIndex()
        {
            return View();
        }
        [HttpPost]
        public ActionResult indirimTurleriIndex(string indirimturuadi, string aciklama)
        {
            indturman.InsertindirimTurleri(indirimturuadi,aciklama);
            return View();
        }

        public ActionResult indirimTurleriGuncelle(int? ID)
        {
            
            return View(indturman.IndirimTuruBul((int)ID));
        }
    }
}