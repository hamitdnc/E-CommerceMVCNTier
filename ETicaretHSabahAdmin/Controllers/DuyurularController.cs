using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaret.BLL;

namespace ETicaretHSabahAdmin.Controllers
{
    public class DuyurularController : Controller
    {
        DuyurularManager duyman = new DuyurularManager();

        // GET: Duyurular
        public ActionResult DuyurularIndex()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DuyurularIndex(DateTime bas_tar, DateTime bit_tar, string duyurubasligi, string duyuru, string aciklama)
        {
            duyman.InsertDuyuru(bas_tar, bit_tar, duyurubasligi, duyuru, aciklama);
            return View();
        }
    }
}