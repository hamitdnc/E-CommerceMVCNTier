using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaret.BLL;
using ETicaret.DLL;

namespace ETicaretHSabahAdmin.Controllers
{
    public class KategoriController : Controller
    {
        KategorilerManager katman = new KategorilerManager();
        // GET: Kategori
        public ActionResult KategoriIndex()
        {
            //UstKategori değişkeni bir liste yapısı çağırdık ve bu liste yapısını view sayfasında select tagi içinde foreach ile listeleyeceğiz.
            ViewBag.UstKategori = katman.KategoriGetir();
            return View();
        }

        [HttpPost]
        public ActionResult KategoriIndex(string kadi,int? PKatID, int? personelID)
        {
            //üstkat var mı seçeneği ile kullanıcının seçtiği seçene göre burdaki işlemler yapılacaktır.
            string ustKatVarmi = "var";
            if (ustKatVarmi == "var")
            {
                personelID = 1;
                katman.InsertKaydet(kadi, (int)PKatID, (int)personelID);
            }
            else
            {
                katman.InsertKaydet(kadi, 0, (int)personelID);
            }

            ViewBag.UstKategori = katman.KategoriGetir();
            return View();
        }

        public ActionResult KategoriGuncelle(int? Kategori_Id)
        {
            //ViewBag.UstKategori = new SelectList(katman.KategoriGetir(), "KategorilerID", "KategoriAdi",katman.ParentKategorilerGetir((int)Kategori_Id));
            //tanımlama yapılacak
            ViewBag.UstKategori = katman.KategoriGetir();

            //ViewBag ile selectlist yapısı içne manager dan aldığımız listenin içinde kategorilerıd ile ıd dğerini, kategori ile kategori adını list yapısı içine attık.view sayflanda dropdownlist ile yakalayacağız
            return View(katman.KategorilerBul((int)Kategori_Id));
        }

        [HttpPost]
        public ActionResult KategoriGuncelle(int? Kategori_Id,Kategoriler katTablo,int? PKatID)
        {
            katTablo.ParentKategoriID = PKatID;
            int sonuc = katman.KategoriGuncelle((int)Kategori_Id, katTablo);
            if (sonuc>0)
            {
                TempData["KategoriGuncelle"] = "<h2 style='color:green'>Güncelleme Başarılı</2>";
            }
            else
            {
                TempData["KategoriGuncelle"] = "<h2 style='color:red'>Başarısız</2>";
            }
            ViewBag.UstKategori = katman.KategoriGetir();
            return View(katman.KategorilerBul((int)Kategori_Id));
        }

        public ActionResult KategoriSil(int kategoriSil_Id)
        {
            return View(katman.KategorilerBul(kategoriSil_Id));
        }

        //MVC'de aynı özelliklere sahip , aynı ismi taşıyan metotlar yapmak zorunda kalabiliriz. Özellikle silme işlemlerinde buna ihtiyaç duyarız. Bu gibi işlmelerde Metot adını değitrip post yapısından sonra [ActionName("KategoriSil") yazıp, bu metot isminin post işlemlerini gerçekleştireceğini gösterir]
        [HttpPost]
        [ActionName("KategoriSil")]//KategoriSil metodunun post işlemini yapacak
        public ActionResult KategorilerDelete(int kategoriSil_Id)
        {
            try
            {
                int sonuc = katman.KategoriSil(kategoriSil_Id);
                if (sonuc > 0)
                {
                    return RedirectToAction("KategoriIndex", "Kategori");
                }
                ViewBag.mesajSil = "<h5 style='color:red'>Bir Hata Oluştu<h5>";
                return View(katman.KategorilerBul(kategoriSil_Id));
            }
            catch (Exception)
            {
                ViewBag.mesajSil = "<h5 style='color:red'>Sileme Gerçekleştirilmedi lütfen kontrol edin<h5>";
                return View(katman.KategorilerBul(kategoriSil_Id));
             
            }
        }
    }
}