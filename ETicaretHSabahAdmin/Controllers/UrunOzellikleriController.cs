using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaret.BLL;
using ETicaret.DLL;

namespace ETicaretHSabahAdmin.Controllers
{
    public class UrunOzellikleriController : Controller
    {
        UrunlerManager um = new UrunlerManager();
        OlcuBirimleriManager obm = new OlcuBirimleriManager();
        UrunOzellikleriManager uom = new UrunOzellikleriManager();
        // GET: UrunOzellikleri

        public ActionResult UrunOzellikleriIndex()
        {
            return View(uom.UrunOzellikGetir());
        }

        public ActionResult UrunOzellikGuncelleIndex(int? ID)
        {
            ViewBag.UrunGetir = um.UrunGetir();
            ViewBag.OlcuBirimGetir = obm.OlcuBirimGetir();
            ViewBag.UrunOzellikleriGetir = uom.UrunOzellikGetir();

            return View(uom.UrunOzellikleriBul((int)ID));
        }

        [HttpPost]
        public ActionResult UrunOzellikGuncelleIndex(UrunOzellikleri tabloUrunOzellik)
        {
            int gnc = uom.UrunOzellikleriGuncelle(tabloUrunOzellik);
            if (gnc > 0)
            {
                ViewBag.mesaj = "<h5> Güncelleme Başarılı </h5>";
            }
            else
            {
                ViewBag.mesaj = "<h5> Güncelleme Olmadı. Kontrol ediniz</h5>";
            }
            ViewBag.UrunGetir = um.UrunGetir();
            ViewBag.OlcuBirimGetir = obm.OlcuBirimGetir();
            ViewBag.UrunOzellikleriGetir = uom.UrunOzellikGetir();

            return View(uom.UrunOzellikleriBul(tabloUrunOzellik.UrunOzellikleriID));
        }

        public ActionResult UrunOzellikEkleIndex()
        {
            ViewBag.Urunler = um.UrunGetir();
            ViewBag.OlcuBirimleri = obm.OlcuBirimGetir();
            return View();
        }

        [HttpPost]
        public ActionResult UrunOzellikEkleIndex(int? UrunID, string ozellikTanimi,string OlcuBirimi, decimal? birimStok, decimal? kalanStok)
        {
            ViewBag.Urunler = um.UrunGetir();
            ViewBag.OlcuBirimleri = obm.OlcuBirimGetir();
            int ekle= uom.InsertUrunOzellikleri((int)UrunID, ozellikTanimi, OlcuBirimi, (decimal)birimStok, (decimal)kalanStok);
            if (ekle>0)
            {
                TempData["mesaj"] = "Ekleme Başarılı";
            }
            else
            {
                TempData["mesaj"] = "Ekleme Başarısız";
            }
            
            return View();
        }

        public ActionResult UrunOzellikleriDetayIndex(int? UrunOzellikDetay_ID)
        {
            //kaç adet resim var..
            return View(uom.UrunOzellikleriBul(UrunOzellikDetay_ID));
        }

        public ActionResult UrunResimEkleIndex(int? Urun_ID)
        {
            return View();
        }

    }
}