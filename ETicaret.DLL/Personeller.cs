//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ETicaret.DLL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Personeller
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Personeller()
        {
            this.Faturalar = new HashSet<Faturalar>();
            this.Kampanyalar = new HashSet<Kampanyalar>();
            this.Kategoriler = new HashSet<Kategoriler>();
            this.Markalar = new HashSet<Markalar>();
            this.Reklamlar = new HashSet<Reklamlar>();
            this.Siparisler = new HashSet<Siparisler>();
            this.Urunler = new HashSet<Urunler>();
            this.UrunResimleri = new HashSet<UrunResimleri>();
        }
    
        public int PersonellerID { get; set; }
        public string TC { get; set; }
        public string Adi { get; set; }
        public string Soyadi { get; set; }
        public string Email { get; set; }
        public string Telefon { get; set; }
        public Nullable<System.DateTime> DogumTarihi { get; set; }
        public string Cinsiyet { get; set; }
        public string MedeniHali { get; set; }
        public string Unvan { get; set; }
        public Nullable<System.DateTime> KayitTarihi { get; set; }
        public string Adres { get; set; }
        public string KAdi { get; set; }
        public string KSifre { get; set; }
        public Nullable<int> RolID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Faturalar> Faturalar { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Kampanyalar> Kampanyalar { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Kategoriler> Kategoriler { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Markalar> Markalar { get; set; }
        public virtual PersonelRolleri PersonelRolleri { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reklamlar> Reklamlar { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Siparisler> Siparisler { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Urunler> Urunler { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UrunResimleri> UrunResimleri { get; set; }
    }
}