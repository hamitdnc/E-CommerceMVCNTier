using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ETicaret.Controllers
{
    public class YorumController : Controller
    {
        // GET: Yorum
        public ActionResult YorumIndex()
        {
            return View();
        }
    }
}