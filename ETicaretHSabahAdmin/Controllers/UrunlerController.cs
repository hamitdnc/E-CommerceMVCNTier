using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaret.BLL;
using ETicaret.DLL;

namespace ETicaretHSabahAdmin.Controllers
{
    public class UrunlerController : Controller
    {
        KategorilerManager katman = new KategorilerManager();
        MarkalManager markman = new MarkalManager();
        OlcuBirimleriManager olbirman = new OlcuBirimleriManager();
        UrunlerManager urunman = new UrunlerManager();
        UrunResimleriManager resMan = new UrunResimleriManager();
        
        // GET: Urunler
        public ActionResult UrunlerIndex()
        {
        
            DropDownListeler();
            return View();
        }

        [HttpPost]
        public ActionResult UrunlerIndex(int KategoriId, int markaId, string urunadi, decimal urunfiyat, string urunolcutanimi, decimal urunstok, string urunaciklama, int? personelId)
        {

            personelId = 1;
            urunman.InsertUrunler(KategoriId, markaId, urunadi, urunfiyat, urunolcutanimi, urunstok, urunaciklama, (int)personelId);
            DropDownListeler();
            return View();
        }
        private void DropDownListeler()
        {
            ViewBag.Kategoriler = katman.KategoriGetir();
            ViewBag.Markalar = markman.MarkaListele();
            ViewBag.Olculer = olbirman.OlcuBirimGetir();
            
        }

        //*********************
        //Ürün Listesini farklı bir sayfada yapacağız
        public ActionResult UrunListesiView()
        {
            return View(urunman.UrunGetir());

        }
        public ActionResult UrunGuncelleIndex(int? UrunlerID)
        {
            ViewBag.KategoriGetir = katman.KategoriGetir();
            ViewBag.Markalar = markman.MarkaListele();
            ViewBag.UrunlerGetir = urunman.UrunGetir();
            ViewBag.OlcuGetir = olbirman.OlcuBirimGetir();

            //UrunListesiView Sayfaında düzenle butttonuna tıklanınca bir ID değeri bu metoda gönderilercek.Bu ID değerini Parametre tanımlayan değişken ismi ile aynı olcak şekillde ayarlanacak ve Manager classın da tanımlanan metota Bu ID değerini vererek Düzenle buttonu ile hangi Ürüne tıklandıysa o ürünün bilgilerini UrunGuncelleIndex sayfasına gönderecek 
            return View(urunman.UrunlerBul((int)UrunlerID));
            /*
             ---------------
             1-Repository
             ---------------
             Bütün tablolar için interface class olacak şekilde ayarlandı. Ürünler için gerekli listeleme, sorgulama, veri bulma, Ekleme, güncelleme, Silme işlemlerini alabiliriz.
            -----------------------
            2-Veritabanından Model'deki Urunler alınacak
            -----------------------
            Urunler tablosunda Repository ye T yapıları için referans verilecek
            --------------------
            3-UrunManager 
            --------------------
            UrunManager class'ı Repository class'ndan metot alarak işlem yapacaktır. Biz ürün güncelleme işlemi için VeriBul(int ID) diye bir metot oluşturduk bu metot reporsitory class'ından ListeFiltre metodundan referans alır(interface metot)
            -----------------
            4-UrunController
             ----------------
             UrunController sayfasından UrunManager classında VeriBul metodunu çağırarak her düzenle buttonuna tıklanınca bir ürün bulması için Repository'deki sorguya gidecek
            ------------------
            5-View
            -----------
            Return view ile UrunGuncelleIndex sayfasına tıklanan ürünün bilgileri ilgili tag'lere dolduracak
             */

        }

        [HttpPost]
        public ActionResult UrunGuncelleIndex(Urunler tabUrunler)
        {
            int gnc = urunman.UrunGuncelle(tabUrunler);
            if (gnc > 0)
            {
                ViewBag.mesaj = "<h5> Güncelleme Başarılı </h5>";
            }
            else
            {
                ViewBag.mesaj = "<h5> Güncelleme Olmadı. Kontrol ediniz</h5>";
            }
            ViewBag.KategoriGetir = katman.KategoriGetir();
            ViewBag.Markalar = markman.MarkaListele();
            ViewBag.OlcuGetir = olbirman.OlcuBirimGetir();
            return View(urunman.UrunlerBul(tabUrunler.UrunlerID));

        }



        public ActionResult UrunDetayIndex(int? UrunDetay_ID)
        {
            //kaç adet resim var..
            return View(urunman.UrunlerBul(UrunDetay_ID));
        }

        public ActionResult UrunResimEkleIndex(int? Urun_ID)
        {
            return View();
        }

        [HttpPost]
        public void UrunSil(int urunler_id)
        {
            urunman.UrunSil(urunler_id);
          
        }
        //bu metot geriye bir json döndürecektir
        public JsonResult UrunFileUpload(HttpPostedFileBase file,int? id)
        {
            // HttpPostedFile resim ekle için bu yapıya ihtiyacımız var . Sadece resim dosya da eklemek i.in bu türde bir class yapısına  ihtiyaç vardır.
            if (file!=null && (file.ContentType=="image/jpg"|| file.ContentType=="image/jpeg"|| file.ContentType=="image/png"))
            {
                //her eklenen resime bir kod ile benzersiz yapmak için aşağadaki kod yapısını kullanıyoruz
                string filename =$"Urun_{ Guid.NewGuid()}.{file.ContentType.Split('/')[1]}";
                string path = Server.MapPath($"~/EklenenResimler/{filename}");
                //file.SaveAs(Server.MapPath($"~/EklenenResimler/{filename}"));
                file.SaveAs(path);

                UrunResimleri urunRess = new UrunResimleri();
                urunRess.Resim = filename;
                urunRess.UrunID = id;
                resMan.UrunResimEkle(urunRess);
                return Json("veri gelecek");
            }
            
            return Json("değiken veri");
        }


        public JsonResult UrunResimSil(int? UrunResimID)
        {
            int sonuc = resMan.ResimSil((int)UrunResimID);
            if (sonuc>0)
            {
                return Json(new { Durum = true }, JsonRequestBehavior.AllowGet);//silinen resimleri bulunduğu alandan kaldırır
            }
            return Json(new { Durum = false });
           
        }
    }
}