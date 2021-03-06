USE [EticaretDB]
GO
/****** Object:  Table [dbo].[Bankalar]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bankalar](
	[BankalarID] [int] IDENTITY(1,1) NOT NULL,
	[BankaAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bankalar] PRIMARY KEY CLUSTERED 
(
	[BankalarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BegenilenUrunler]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BegenilenUrunler](
	[BegenilenUrunlerID] [int] IDENTITY(1,1) NOT NULL,
	[UyeID] [int] NULL,
	[UrunID] [int] NULL,
	[Tarih] [date] NULL,
 CONSTRAINT [PK_BegenilenUrunler] PRIMARY KEY CLUSTERED 
(
	[BegenilenUrunlerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Duyurular]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Duyurular](
	[DuyurularID] [int] IDENTITY(1,1) NOT NULL,
	[BaslangicTarihi] [date] NULL,
	[BitisTarihi] [date] NULL,
	[DuyuruBasligi] [nvarchar](100) NULL,
	[Duyuru] [nvarchar](max) NULL,
	[Aciklama] [nvarchar](max) NULL,
 CONSTRAINT [PK_Duyurular] PRIMARY KEY CLUSTERED 
(
	[DuyurularID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faturalar]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faturalar](
	[FaturalarID] [int] IDENTITY(1,1) NOT NULL,
	[UyeID] [int] NULL,
	[SiparisID] [int] NULL,
	[AdresID] [int] NULL,
	[PersonelID] [int] NULL,
 CONSTRAINT [PK_Faturalar] PRIMARY KEY CLUSTERED 
(
	[FaturalarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[indirimTurleri]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[indirimTurleri](
	[indirimTurleriID] [int] IDENTITY(1,1) NOT NULL,
	[indirimTuruAdi] [nvarchar](50) NULL,
	[Aciklama] [nvarchar](max) NULL,
 CONSTRAINT [PK_indirimTurleri] PRIMARY KEY CLUSTERED 
(
	[indirimTurleriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kampanyalar]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kampanyalar](
	[KampanyalarID] [int] IDENTITY(1,1) NOT NULL,
	[indirimTuruID] [int] NULL,
	[Tutar] [decimal](18, 2) NULL,
	[KampanyaBasligi] [nvarchar](100) NULL,
	[KampanyaAciklamasi] [nvarchar](max) NULL,
	[BaslamaTarihi] [date] NULL,
	[BitisTarihi] [date] NULL,
	[PersonelID] [int] NULL,
 CONSTRAINT [PK_Kampanyalar] PRIMARY KEY CLUSTERED 
(
	[KampanyalarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KargoFirmalari]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KargoFirmalari](
	[KargoFirmalariID] [int] IDENTITY(1,1) NOT NULL,
	[KargoAdi] [nvarchar](50) NULL,
	[AnlasmaTarihi] [date] NULL,
	[AnlasmaBitisTarihi] [date] NULL,
	[Aciklama] [nvarchar](max) NULL,
 CONSTRAINT [PK_KargoFirmalari] PRIMARY KEY CLUSTERED 
(
	[KargoFirmalariID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kargolar]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kargolar](
	[KargolarID] [int] IDENTITY(1,1) NOT NULL,
	[KargoFirmaID] [int] NULL,
	[KargoVerilisTarihi] [date] NULL,
	[KargoUcreti] [decimal](18, 2) NULL,
	[KargoTeslimTarihi] [date] NULL,
 CONSTRAINT [PK_Kargolar] PRIMARY KEY CLUSTERED 
(
	[KargolarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategorilerID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](50) NULL,
	[ParentKategoriID] [int] NULL,
	[PersonelID] [int] NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategorilerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markalar]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markalar](
	[MarkalarID] [int] IDENTITY(1,1) NOT NULL,
	[MarkaAdi] [nvarchar](50) NULL,
	[PersonelID] [int] NULL,
 CONSTRAINT [PK_Markalar] PRIMARY KEY CLUSTERED 
(
	[MarkalarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OlcuBirimleri]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OlcuBirimleri](
	[OlcuBirimleriID] [int] IDENTITY(1,1) NOT NULL,
	[OlcuBirimiAdi] [nvarchar](50) NULL,
	[Aciklama] [nvarchar](max) NULL,
 CONSTRAINT [PK_OlcuBirimleri] PRIMARY KEY CLUSTERED 
(
	[OlcuBirimleriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personeller]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personeller](
	[PerseonellerID] [int] IDENTITY(1,1) NOT NULL,
	[TC] [char](11) NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](50) NULL,
	[Email] [nvarchar](30) NULL,
	[Telefon] [nvarchar](30) NULL,
	[DogumTarihi] [date] NULL,
	[Cinsiyet] [nvarchar](10) NULL,
	[MedeniHali] [nvarchar](10) NULL,
	[Unvan] [nvarchar](50) NULL,
	[KayitTarihi] [date] NULL,
	[Adres] [nvarchar](max) NULL,
	[KAdi] [nvarchar](50) NULL,
	[KSifre] [nvarchar](50) NULL,
	[RolID] [int] NULL,
 CONSTRAINT [PK_Personeller] PRIMARY KEY CLUSTERED 
(
	[PerseonellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonelRolleri]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonelRolleri](
	[PersonelRolleriID] [int] IDENTITY(1,1) NOT NULL,
	[RolAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_PersonelRolleri] PRIMARY KEY CLUSTERED 
(
	[PersonelRolleriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reklamlar]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reklamlar](
	[ReklamlarID] [int] IDENTITY(1,1) NOT NULL,
	[ReklamAdi] [nvarchar](100) NULL,
	[ReklamKodu] [nvarchar](50) NULL,
	[Durum] [bit] NULL,
	[Yer] [nvarchar](50) NULL,
	[PersonelID] [int] NULL,
 CONSTRAINT [PK_Reklamlar] PRIMARY KEY CLUSTERED 
(
	[ReklamlarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sepet]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sepet](
	[SepetlerID] [int] IDENTITY(1,1) NOT NULL,
	[UyeID] [int] NULL,
	[Tarihi] [date] NULL,
	[ToplamAdet] [int] NULL,
	[ToplamTutar] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Sepet] PRIMARY KEY CLUSTERED 
(
	[SepetlerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SepetDetay]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SepetDetay](
	[SepetDetaylarID] [int] IDENTITY(1,1) NOT NULL,
	[UrunID] [int] NULL,
	[UrunAdet] [int] NULL,
	[UrunFiyat] [decimal](18, 2) NULL,
	[SepetID] [int] NULL,
 CONSTRAINT [PK_SepetDetay] PRIMARY KEY CLUSTERED 
(
	[SepetDetaylarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiparisDetaylari]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisDetaylari](
	[SiparisDetaylariID] [int] IDENTITY(1,1) NOT NULL,
	[SiparisID] [int] NULL,
	[UrunID] [int] NULL,
	[SiparisFiyati] [decimal](18, 2) NULL,
	[Miktar] [int] NULL,
	[KampanyaID] [int] NULL,
 CONSTRAINT [PK_SiparisDetaylari] PRIMARY KEY CLUSTERED 
(
	[SiparisDetaylariID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparisler]    Script Date: 09.04.2019 15:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparisler](
	[SiparislerID] [int] IDENTITY(1,1) NOT NULL,
	[UyeID] [int] NULL,
	[PersonelID] [int] NULL,
	[Tarihi] [date] NULL,
	[KargoID] [int] NULL,
	[ToplamFiyat] [decimal](18, 2) NULL,
	[SiparisAdet] [int] NULL,
 CONSTRAINT [PK_Siparisler] PRIMARY KEY CLUSTERED 
(
	[SiparislerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunDuyurulari]    Script Date: 09.04.2019 15:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunDuyurulari](
	[UrunDuyurulariID] [int] IDENTITY(1,1) NOT NULL,
	[DuyuruID] [int] NULL,
	[UrunID] [int] NULL,
 CONSTRAINT [PK_UrunDuyurulari] PRIMARY KEY CLUSTERED 
(
	[UrunDuyurulariID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 09.04.2019 15:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[UrunlerID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriID] [int] NULL,
	[MarkaID] [int] NULL,
	[UrunAdi] [nvarchar](50) NULL,
	[UrunFiyat] [decimal](18, 2) NULL,
	[UrunOlcuTanimi] [nvarchar](50) NULL,
	[UrunStok] [decimal](18, 2) NULL,
	[UrunAciklama] [nvarchar](50) NULL,
	[PersonelID] [int] NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[UrunlerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunOzellikleri]    Script Date: 09.04.2019 15:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunOzellikleri](
	[UrunOzellikleriID] [int] IDENTITY(1,1) NOT NULL,
	[UrunID] [int] NULL,
	[OzellikTanimi] [nvarchar](50) NULL,
	[OlcuBirimi] [nvarchar](50) NULL,
	[BirimStok] [decimal](18, 2) NULL,
	[KalanStok] [decimal](18, 2) NULL,
 CONSTRAINT [PK_UrunOzellikleri] PRIMARY KEY CLUSTERED 
(
	[UrunOzellikleriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunResimleri]    Script Date: 09.04.2019 15:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunResimleri](
	[UrunResimleriID] [int] IDENTITY(1,1) NOT NULL,
	[UrunID] [int] NULL,
	[Resim] [nvarchar](50) NULL,
	[PersonelID] [int] NULL,
 CONSTRAINT [PK_UrunResimleri] PRIMARY KEY CLUSTERED 
(
	[UrunResimleriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UyeAdresleri]    Script Date: 09.04.2019 15:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UyeAdresleri](
	[UyeAdresleriID] [int] IDENTITY(1,1) NOT NULL,
	[AdresYeri] [nvarchar](100) NULL,
	[Adres] [nvarchar](max) NULL,
	[ili] [nvarchar](100) NULL,
	[ilcesi] [nvarchar](100) NULL,
	[UyeID] [int] NULL,
 CONSTRAINT [PK_UyeAdresleri] PRIMARY KEY CLUSTERED 
(
	[UyeAdresleriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 09.04.2019 15:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[UyelerID] [int] IDENTITY(1,1) NOT NULL,
	[UyeAdi] [nvarchar](50) NULL,
	[UyeSoyadi] [nvarchar](50) NULL,
	[KayitTarihi] [date] NULL,
	[Email] [nvarchar](30) NULL,
	[Telefon] [nvarchar](30) NULL,
	[DogumTarihi] [date] NULL,
	[Cinsiyet] [nvarchar](10) NULL,
	[MedeniHali] [nvarchar](10) NULL,
	[Meslek] [nvarchar](50) NULL,
	[KullaniciAdi] [nvarchar](50) NULL,
	[KullaniciSifre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Uyeler] PRIMARY KEY CLUSTERED 
(
	[UyelerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorumlar]    Script Date: 09.04.2019 15:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorumlar](
	[YorumlarID] [int] IDENTITY(1,1) NOT NULL,
	[UyeID] [int] NULL,
	[UrunID] [int] NULL,
	[YorumBasligi] [nvarchar](100) NULL,
	[YorumMetni] [nvarchar](max) NULL,
	[Star] [int] NULL,
	[Tarihi] [date] NULL,
	[BegenmeSayisi] [int] NULL,
	[BegenmemeSayisi] [int] NULL,
	[OnayDurumu] [bit] NULL,
 CONSTRAINT [PK_Yorumlar] PRIMARY KEY CLUSTERED 
(
	[YorumlarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Duyurular] ON 

INSERT [dbo].[Duyurular] ([DuyurularID], [BaslangicTarihi], [BitisTarihi], [DuyuruBasligi], [Duyuru], [Aciklama]) VALUES (1, CAST(N'2018-05-12' AS Date), CAST(N'2019-05-12' AS Date), N'indirim', N'indirim', N'')
SET IDENTITY_INSERT [dbo].[Duyurular] OFF
SET IDENTITY_INSERT [dbo].[indirimTurleri] ON 

INSERT [dbo].[indirimTurleri] ([indirimTurleriID], [indirimTuruAdi], [Aciklama]) VALUES (1, N'yılbaşı', N'')
INSERT [dbo].[indirimTurleri] ([indirimTurleriID], [indirimTuruAdi], [Aciklama]) VALUES (2, N'', N'')
SET IDENTITY_INSERT [dbo].[indirimTurleri] OFF
SET IDENTITY_INSERT [dbo].[KargoFirmalari] ON 

INSERT [dbo].[KargoFirmalari] ([KargoFirmalariID], [KargoAdi], [AnlasmaTarihi], [AnlasmaBitisTarihi], [Aciklama]) VALUES (1, N'ups', CAST(N'2005-02-11' AS Date), CAST(N'2020-02-11' AS Date), N'')
SET IDENTITY_INSERT [dbo].[KargoFirmalari] OFF
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([KategorilerID], [KategoriAdi], [ParentKategoriID], [PersonelID]) VALUES (1, N'Elektronik', 0, 1)
INSERT [dbo].[Kategoriler] ([KategorilerID], [KategoriAdi], [ParentKategoriID], [PersonelID]) VALUES (2, N'Mobilya', 0, 1)
INSERT [dbo].[Kategoriler] ([KategorilerID], [KategoriAdi], [ParentKategoriID], [PersonelID]) VALUES (3, N'Beyaz Eşya', 0, 1)
INSERT [dbo].[Kategoriler] ([KategorilerID], [KategoriAdi], [ParentKategoriID], [PersonelID]) VALUES (4, N'Telefon', 1, 1)
INSERT [dbo].[Kategoriler] ([KategorilerID], [KategoriAdi], [ParentKategoriID], [PersonelID]) VALUES (5, N'Kulaklık', 1, 1)
INSERT [dbo].[Kategoriler] ([KategorilerID], [KategoriAdi], [ParentKategoriID], [PersonelID]) VALUES (6, N'Çamaşır Makinesi', 3, 1)
INSERT [dbo].[Kategoriler] ([KategorilerID], [KategoriAdi], [ParentKategoriID], [PersonelID]) VALUES (7, N'Giyim', 0, 1)
INSERT [dbo].[Kategoriler] ([KategorilerID], [KategoriAdi], [ParentKategoriID], [PersonelID]) VALUES (8, N'Ses sistemi', 0, 1)
INSERT [dbo].[Kategoriler] ([KategorilerID], [KategoriAdi], [ParentKategoriID], [PersonelID]) VALUES (9, N'Kanepe', 2, 1)
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
SET IDENTITY_INSERT [dbo].[Markalar] ON 

INSERT [dbo].[Markalar] ([MarkalarID], [MarkaAdi], [PersonelID]) VALUES (1, N'Hp', NULL)
INSERT [dbo].[Markalar] ([MarkalarID], [MarkaAdi], [PersonelID]) VALUES (2, N'Casper', 1)
INSERT [dbo].[Markalar] ([MarkalarID], [MarkaAdi], [PersonelID]) VALUES (3, N'Apple', 1)
INSERT [dbo].[Markalar] ([MarkalarID], [MarkaAdi], [PersonelID]) VALUES (4, N'Lenovo', 1)
INSERT [dbo].[Markalar] ([MarkalarID], [MarkaAdi], [PersonelID]) VALUES (5, N'LG', 1)
INSERT [dbo].[Markalar] ([MarkalarID], [MarkaAdi], [PersonelID]) VALUES (6, N'Philips', 1)
INSERT [dbo].[Markalar] ([MarkalarID], [MarkaAdi], [PersonelID]) VALUES (7, N'Samsung', 1)
INSERT [dbo].[Markalar] ([MarkalarID], [MarkaAdi], [PersonelID]) VALUES (8, N'Msi', 1)
INSERT [dbo].[Markalar] ([MarkalarID], [MarkaAdi], [PersonelID]) VALUES (9, N'Dell', 1)
INSERT [dbo].[Markalar] ([MarkalarID], [MarkaAdi], [PersonelID]) VALUES (10, N'Jakaman', 1)
INSERT [dbo].[Markalar] ([MarkalarID], [MarkaAdi], [PersonelID]) VALUES (11, N'Logitech', 1)
INSERT [dbo].[Markalar] ([MarkalarID], [MarkaAdi], [PersonelID]) VALUES (12, N'AA', 1)
SET IDENTITY_INSERT [dbo].[Markalar] OFF
SET IDENTITY_INSERT [dbo].[OlcuBirimleri] ON 

INSERT [dbo].[OlcuBirimleri] ([OlcuBirimleriID], [OlcuBirimiAdi], [Aciklama]) VALUES (1, N'Adet', N'tane')
INSERT [dbo].[OlcuBirimleri] ([OlcuBirimleriID], [OlcuBirimiAdi], [Aciklama]) VALUES (2, N'Kg', N'eewrwer')
INSERT [dbo].[OlcuBirimleri] ([OlcuBirimleriID], [OlcuBirimiAdi], [Aciklama]) VALUES (3, N'eee', N'qqq')
INSERT [dbo].[OlcuBirimleri] ([OlcuBirimleriID], [OlcuBirimiAdi], [Aciklama]) VALUES (4, N'Litre', NULL)
INSERT [dbo].[OlcuBirimleri] ([OlcuBirimleriID], [OlcuBirimiAdi], [Aciklama]) VALUES (5, N'metre', N'')
INSERT [dbo].[OlcuBirimleri] ([OlcuBirimleriID], [OlcuBirimiAdi], [Aciklama]) VALUES (6, N'Metre', N'Metric')
SET IDENTITY_INSERT [dbo].[OlcuBirimleri] OFF
SET IDENTITY_INSERT [dbo].[Personeller] ON 

INSERT [dbo].[Personeller] ([PerseonellerID], [TC], [Adi], [Soyadi], [Email], [Telefon], [DogumTarihi], [Cinsiyet], [MedeniHali], [Unvan], [KayitTarihi], [Adres], [KAdi], [KSifre], [RolID]) VALUES (1, N'10         ', N'Selim', N'Rekabet', N'selim@', N'', CAST(N'1999-01-01' AS Date), N'Erkek', N'Bekar', N'', CAST(N'2019-03-18' AS Date), N'', N'admin', N'1', 1)
INSERT [dbo].[Personeller] ([PerseonellerID], [TC], [Adi], [Soyadi], [Email], [Telefon], [DogumTarihi], [Cinsiyet], [MedeniHali], [Unvan], [KayitTarihi], [Adres], [KAdi], [KSifre], [RolID]) VALUES (2, N'11         ', N'omer', N'yılmaz', N'omersolmaz@gmai.com', N'05216357898', CAST(N'1992-02-19' AS Date), N'erkek', N'bekar', N'işçi', CAST(N'2000-05-11' AS Date), N'şişli', N'omer', N'123', 1)
INSERT [dbo].[Personeller] ([PerseonellerID], [TC], [Adi], [Soyadi], [Email], [Telefon], [DogumTarihi], [Cinsiyet], [MedeniHali], [Unvan], [KayitTarihi], [Adres], [KAdi], [KSifre], [RolID]) VALUES (3, N'12         ', N'harun', N'mutlu', N'harun@hotmail.com', N'05211478585', CAST(N'1993-05-19' AS Date), N'erkek', N'evli', N'güvenlik', CAST(N'2004-03-11' AS Date), N'beykoz', N'harun', N'123', 3)
INSERT [dbo].[Personeller] ([PerseonellerID], [TC], [Adi], [Soyadi], [Email], [Telefon], [DogumTarihi], [Cinsiyet], [MedeniHali], [Unvan], [KayitTarihi], [Adres], [KAdi], [KSifre], [RolID]) VALUES (4, N'13         ', N'hasan', N'hasan', N'hasan@gmail.com', N'05321478526', CAST(N'1993-02-05' AS Date), N'erkek', N'bekar', N'güvenlik', CAST(N'2010-03-12' AS Date), N'beykoz', N'hasan', N'123', 4)
INSERT [dbo].[Personeller] ([PerseonellerID], [TC], [Adi], [Soyadi], [Email], [Telefon], [DogumTarihi], [Cinsiyet], [MedeniHali], [Unvan], [KayitTarihi], [Adres], [KAdi], [KSifre], [RolID]) VALUES (5, N'13         ', N'hasan', N'hasan', N'hasan@gmail.com', N'05321478526', CAST(N'1993-02-05' AS Date), N'erkek', N'bekar', N'güvenlik', CAST(N'2010-03-12' AS Date), N'beykoz', N'hasan', N'123', 4)
INSERT [dbo].[Personeller] ([PerseonellerID], [TC], [Adi], [Soyadi], [Email], [Telefon], [DogumTarihi], [Cinsiyet], [MedeniHali], [Unvan], [KayitTarihi], [Adres], [KAdi], [KSifre], [RolID]) VALUES (6, N'14         ', N'murat', N'm', N'murat@gmail.com', N'023541554', CAST(N'1990-11-11' AS Date), N'erkek', N'bekar', N'işçi', CAST(N'2000-05-11' AS Date), N'ümraniye', N'm', N'1', 2)
SET IDENTITY_INSERT [dbo].[Personeller] OFF
SET IDENTITY_INSERT [dbo].[PersonelRolleri] ON 

INSERT [dbo].[PersonelRolleri] ([PersonelRolleriID], [RolAdi]) VALUES (1, N'Admin')
INSERT [dbo].[PersonelRolleri] ([PersonelRolleriID], [RolAdi]) VALUES (2, N'Yönetici')
INSERT [dbo].[PersonelRolleri] ([PersonelRolleriID], [RolAdi]) VALUES (3, N'Personel')
INSERT [dbo].[PersonelRolleri] ([PersonelRolleriID], [RolAdi]) VALUES (4, N'Müdür')
SET IDENTITY_INSERT [dbo].[PersonelRolleri] OFF
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([UrunlerID], [KategoriID], [MarkaID], [UrunAdi], [UrunFiyat], [UrunOlcuTanimi], [UrunStok], [UrunAciklama], [PersonelID]) VALUES (1, 1, 7, N'TV', CAST(5500.00 AS Decimal(18, 2)), N'Adet', CAST(600.00 AS Decimal(18, 2)), N'LCD', 1)
INSERT [dbo].[Urunler] ([UrunlerID], [KategoriID], [MarkaID], [UrunAdi], [UrunFiyat], [UrunOlcuTanimi], [UrunStok], [UrunAciklama], [PersonelID]) VALUES (2, 1, 4, N'Bilgisayar', CAST(3500.00 AS Decimal(18, 2)), N'Adet', CAST(500.00 AS Decimal(18, 2)), N'i7 işlemci 8gb ram ', 1)
INSERT [dbo].[Urunler] ([UrunlerID], [KategoriID], [MarkaID], [UrunAdi], [UrunFiyat], [UrunOlcuTanimi], [UrunStok], [UrunAciklama], [PersonelID]) VALUES (3, 1, 6, N'Kulaklık', CAST(200.00 AS Decimal(18, 2)), N'Adet', CAST(5000.00 AS Decimal(18, 2)), N'Kablosuz', 1)
INSERT [dbo].[Urunler] ([UrunlerID], [KategoriID], [MarkaID], [UrunAdi], [UrunFiyat], [UrunOlcuTanimi], [UrunStok], [UrunAciklama], [PersonelID]) VALUES (4, 8, 11, N'z906', CAST(2800.00 AS Decimal(18, 2)), N'Adet', CAST(50.00 AS Decimal(18, 2)), N'5+1 surround', 1)
INSERT [dbo].[Urunler] ([UrunlerID], [KategoriID], [MarkaID], [UrunAdi], [UrunFiyat], [UrunOlcuTanimi], [UrunStok], [UrunAciklama], [PersonelID]) VALUES (5, 7, 12, N'Deri Kemer 2 metre', CAST(18.00 AS Decimal(18, 2)), N'6', CAST(2500.00 AS Decimal(18, 2)), N'Siyah deri kemer yapıları imalata gönderilmeli', 1)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
SET IDENTITY_INSERT [dbo].[UrunOzellikleri] ON 

INSERT [dbo].[UrunOzellikleri] ([UrunOzellikleriID], [UrunID], [OzellikTanimi], [OlcuBirimi], [BirimStok], [KalanStok]) VALUES (1, 5, N'LCD', N'1', CAST(75.00 AS Decimal(18, 2)), CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[UrunOzellikleri] ([UrunOzellikleriID], [UrunID], [OzellikTanimi], [OlcuBirimi], [BirimStok], [KalanStok]) VALUES (2, 1, N'LCD', N'1', CAST(50.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[UrunOzellikleri] ([UrunOzellikleriID], [UrunID], [OzellikTanimi], [OlcuBirimi], [BirimStok], [KalanStok]) VALUES (3, 1, N'LCD', N'1', CAST(50.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[UrunOzellikleri] ([UrunOzellikleriID], [UrunID], [OzellikTanimi], [OlcuBirimi], [BirimStok], [KalanStok]) VALUES (4, 1, N'LCD', N'1', CAST(50.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[UrunOzellikleri] ([UrunOzellikleriID], [UrunID], [OzellikTanimi], [OlcuBirimi], [BirimStok], [KalanStok]) VALUES (5, 1, N'LCD', N'1', CAST(50.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[UrunOzellikleri] ([UrunOzellikleriID], [UrunID], [OzellikTanimi], [OlcuBirimi], [BirimStok], [KalanStok]) VALUES (6, 2, N'i7', N'1', CAST(750.00 AS Decimal(18, 2)), CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[UrunOzellikleri] ([UrunOzellikleriID], [UrunID], [OzellikTanimi], [OlcuBirimi], [BirimStok], [KalanStok]) VALUES (7, 3, N'kablosuz', N'1', CAST(750.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[UrunOzellikleri] OFF
SET IDENTITY_INSERT [dbo].[Uyeler] ON 

INSERT [dbo].[Uyeler] ([UyelerID], [UyeAdi], [UyeSoyadi], [KayitTarihi], [Email], [Telefon], [DogumTarihi], [Cinsiyet], [MedeniHali], [Meslek], [KullaniciAdi], [KullaniciSifre]) VALUES (1, NULL, NULL, CAST(N'2019-03-21' AS Date), N'ali@gmail.com', NULL, NULL, NULL, NULL, N'', N'ali@gmail.com', N'123')
INSERT [dbo].[Uyeler] ([UyelerID], [UyeAdi], [UyeSoyadi], [KayitTarihi], [Email], [Telefon], [DogumTarihi], [Cinsiyet], [MedeniHali], [Meslek], [KullaniciAdi], [KullaniciSifre]) VALUES (2, N'baran', NULL, CAST(N'2019-03-21' AS Date), N'b@gmail.com', NULL, NULL, NULL, NULL, N'', N'b@gmail.com', N'1')
INSERT [dbo].[Uyeler] ([UyelerID], [UyeAdi], [UyeSoyadi], [KayitTarihi], [Email], [Telefon], [DogumTarihi], [Cinsiyet], [MedeniHali], [Meslek], [KullaniciAdi], [KullaniciSifre]) VALUES (3, N'baran', NULL, CAST(N'2019-03-21' AS Date), N'baran@gmail.com', NULL, NULL, NULL, NULL, N'', N'baran@gmail.com', N'1')
INSERT [dbo].[Uyeler] ([UyelerID], [UyeAdi], [UyeSoyadi], [KayitTarihi], [Email], [Telefon], [DogumTarihi], [Cinsiyet], [MedeniHali], [Meslek], [KullaniciAdi], [KullaniciSifre]) VALUES (4, N'bar', NULL, CAST(N'2019-03-21' AS Date), N'bar@gmail.com', NULL, NULL, NULL, NULL, N'', N'bar@gmail.com', N'1')
INSERT [dbo].[Uyeler] ([UyelerID], [UyeAdi], [UyeSoyadi], [KayitTarihi], [Email], [Telefon], [DogumTarihi], [Cinsiyet], [MedeniHali], [Meslek], [KullaniciAdi], [KullaniciSifre]) VALUES (5, N'ali', NULL, CAST(N'2019-03-21' AS Date), N'ali@gmail.com', NULL, NULL, NULL, NULL, N'', N'ali@gmail.com', N'12')
INSERT [dbo].[Uyeler] ([UyelerID], [UyeAdi], [UyeSoyadi], [KayitTarihi], [Email], [Telefon], [DogumTarihi], [Cinsiyet], [MedeniHali], [Meslek], [KullaniciAdi], [KullaniciSifre]) VALUES (6, N'görkem', NULL, CAST(N'2019-03-21' AS Date), N'gorkem@gmail.com', NULL, NULL, NULL, NULL, N'', N'gorkem@gmail.com', N'123')
INSERT [dbo].[Uyeler] ([UyelerID], [UyeAdi], [UyeSoyadi], [KayitTarihi], [Email], [Telefon], [DogumTarihi], [Cinsiyet], [MedeniHali], [Meslek], [KullaniciAdi], [KullaniciSifre]) VALUES (7, N'ahmet', NULL, CAST(N'2019-03-21' AS Date), N'ahemt@gmail.com', NULL, NULL, NULL, NULL, N'', N'ahemt@gmail.com', N'2')
SET IDENTITY_INSERT [dbo].[Uyeler] OFF
ALTER TABLE [dbo].[BegenilenUrunler]  WITH CHECK ADD  CONSTRAINT [FK_BegenilenUrunler_Urunler] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urunler] ([UrunlerID])
GO
ALTER TABLE [dbo].[BegenilenUrunler] CHECK CONSTRAINT [FK_BegenilenUrunler_Urunler]
GO
ALTER TABLE [dbo].[BegenilenUrunler]  WITH CHECK ADD  CONSTRAINT [FK_BegenilenUrunler_Uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyelerID])
GO
ALTER TABLE [dbo].[BegenilenUrunler] CHECK CONSTRAINT [FK_BegenilenUrunler_Uyeler]
GO
ALTER TABLE [dbo].[Faturalar]  WITH CHECK ADD  CONSTRAINT [FK_Faturalar_Personeller] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personeller] ([PerseonellerID])
GO
ALTER TABLE [dbo].[Faturalar] CHECK CONSTRAINT [FK_Faturalar_Personeller]
GO
ALTER TABLE [dbo].[Faturalar]  WITH CHECK ADD  CONSTRAINT [FK_Faturalar_Siparisler] FOREIGN KEY([SiparisID])
REFERENCES [dbo].[Siparisler] ([SiparislerID])
GO
ALTER TABLE [dbo].[Faturalar] CHECK CONSTRAINT [FK_Faturalar_Siparisler]
GO
ALTER TABLE [dbo].[Faturalar]  WITH CHECK ADD  CONSTRAINT [FK_Faturalar_UyeAdresleri] FOREIGN KEY([AdresID])
REFERENCES [dbo].[UyeAdresleri] ([UyeAdresleriID])
GO
ALTER TABLE [dbo].[Faturalar] CHECK CONSTRAINT [FK_Faturalar_UyeAdresleri]
GO
ALTER TABLE [dbo].[Faturalar]  WITH CHECK ADD  CONSTRAINT [FK_Faturalar_Uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyelerID])
GO
ALTER TABLE [dbo].[Faturalar] CHECK CONSTRAINT [FK_Faturalar_Uyeler]
GO
ALTER TABLE [dbo].[Kampanyalar]  WITH CHECK ADD  CONSTRAINT [FK_Kampanyalar_indirimTurleri] FOREIGN KEY([indirimTuruID])
REFERENCES [dbo].[indirimTurleri] ([indirimTurleriID])
GO
ALTER TABLE [dbo].[Kampanyalar] CHECK CONSTRAINT [FK_Kampanyalar_indirimTurleri]
GO
ALTER TABLE [dbo].[Kampanyalar]  WITH CHECK ADD  CONSTRAINT [FK_Kampanyalar_Personeller] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personeller] ([PerseonellerID])
GO
ALTER TABLE [dbo].[Kampanyalar] CHECK CONSTRAINT [FK_Kampanyalar_Personeller]
GO
ALTER TABLE [dbo].[Kargolar]  WITH CHECK ADD  CONSTRAINT [FK_Kargolar_KargoFirmalari] FOREIGN KEY([KargoFirmaID])
REFERENCES [dbo].[KargoFirmalari] ([KargoFirmalariID])
GO
ALTER TABLE [dbo].[Kargolar] CHECK CONSTRAINT [FK_Kargolar_KargoFirmalari]
GO
ALTER TABLE [dbo].[Kategoriler]  WITH CHECK ADD  CONSTRAINT [FK_Kategoriler_Personeller] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personeller] ([PerseonellerID])
GO
ALTER TABLE [dbo].[Kategoriler] CHECK CONSTRAINT [FK_Kategoriler_Personeller]
GO
ALTER TABLE [dbo].[Markalar]  WITH CHECK ADD  CONSTRAINT [FK_Markalar_Personeller] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personeller] ([PerseonellerID])
GO
ALTER TABLE [dbo].[Markalar] CHECK CONSTRAINT [FK_Markalar_Personeller]
GO
ALTER TABLE [dbo].[Personeller]  WITH CHECK ADD  CONSTRAINT [FK_Personeller_PersonelRolleri] FOREIGN KEY([RolID])
REFERENCES [dbo].[PersonelRolleri] ([PersonelRolleriID])
GO
ALTER TABLE [dbo].[Personeller] CHECK CONSTRAINT [FK_Personeller_PersonelRolleri]
GO
ALTER TABLE [dbo].[Reklamlar]  WITH CHECK ADD  CONSTRAINT [FK_Reklamlar_Personeller] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personeller] ([PerseonellerID])
GO
ALTER TABLE [dbo].[Reklamlar] CHECK CONSTRAINT [FK_Reklamlar_Personeller]
GO
ALTER TABLE [dbo].[SepetDetay]  WITH CHECK ADD  CONSTRAINT [FK_SepetDetay_Sepet] FOREIGN KEY([SepetID])
REFERENCES [dbo].[Sepet] ([SepetlerID])
GO
ALTER TABLE [dbo].[SepetDetay] CHECK CONSTRAINT [FK_SepetDetay_Sepet]
GO
ALTER TABLE [dbo].[SepetDetay]  WITH CHECK ADD  CONSTRAINT [FK_SepetDetay_Urunler] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urunler] ([UrunlerID])
GO
ALTER TABLE [dbo].[SepetDetay] CHECK CONSTRAINT [FK_SepetDetay_Urunler]
GO
ALTER TABLE [dbo].[SiparisDetaylari]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetaylari_Kampanyalar] FOREIGN KEY([KampanyaID])
REFERENCES [dbo].[Kampanyalar] ([KampanyalarID])
GO
ALTER TABLE [dbo].[SiparisDetaylari] CHECK CONSTRAINT [FK_SiparisDetaylari_Kampanyalar]
GO
ALTER TABLE [dbo].[SiparisDetaylari]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetaylari_Siparisler] FOREIGN KEY([SiparisID])
REFERENCES [dbo].[Siparisler] ([SiparislerID])
GO
ALTER TABLE [dbo].[SiparisDetaylari] CHECK CONSTRAINT [FK_SiparisDetaylari_Siparisler]
GO
ALTER TABLE [dbo].[SiparisDetaylari]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetaylari_Urunler] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urunler] ([UrunlerID])
GO
ALTER TABLE [dbo].[SiparisDetaylari] CHECK CONSTRAINT [FK_SiparisDetaylari_Urunler]
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_Siparisler_Kargolar] FOREIGN KEY([KargoID])
REFERENCES [dbo].[Kargolar] ([KargolarID])
GO
ALTER TABLE [dbo].[Siparisler] CHECK CONSTRAINT [FK_Siparisler_Kargolar]
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_Siparisler_Personeller] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personeller] ([PerseonellerID])
GO
ALTER TABLE [dbo].[Siparisler] CHECK CONSTRAINT [FK_Siparisler_Personeller]
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_Siparisler_Uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyelerID])
GO
ALTER TABLE [dbo].[Siparisler] CHECK CONSTRAINT [FK_Siparisler_Uyeler]
GO
ALTER TABLE [dbo].[UrunDuyurulari]  WITH CHECK ADD  CONSTRAINT [FK_UrunDuyurulari_Duyurular] FOREIGN KEY([DuyuruID])
REFERENCES [dbo].[Duyurular] ([DuyurularID])
GO
ALTER TABLE [dbo].[UrunDuyurulari] CHECK CONSTRAINT [FK_UrunDuyurulari_Duyurular]
GO
ALTER TABLE [dbo].[UrunDuyurulari]  WITH CHECK ADD  CONSTRAINT [FK_UrunDuyurulari_Urunler] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urunler] ([UrunlerID])
GO
ALTER TABLE [dbo].[UrunDuyurulari] CHECK CONSTRAINT [FK_UrunDuyurulari_Urunler]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Kategoriler] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategoriler] ([KategorilerID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Kategoriler]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Markalar] FOREIGN KEY([MarkaID])
REFERENCES [dbo].[Markalar] ([MarkalarID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Markalar]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Personeller] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personeller] ([PerseonellerID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Personeller]
GO
ALTER TABLE [dbo].[UrunOzellikleri]  WITH CHECK ADD  CONSTRAINT [FK_UrunOzellikleri_Urunler] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urunler] ([UrunlerID])
GO
ALTER TABLE [dbo].[UrunOzellikleri] CHECK CONSTRAINT [FK_UrunOzellikleri_Urunler]
GO
ALTER TABLE [dbo].[UrunResimleri]  WITH CHECK ADD  CONSTRAINT [FK_UrunResimleri_Personeller] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personeller] ([PerseonellerID])
GO
ALTER TABLE [dbo].[UrunResimleri] CHECK CONSTRAINT [FK_UrunResimleri_Personeller]
GO
ALTER TABLE [dbo].[UrunResimleri]  WITH CHECK ADD  CONSTRAINT [FK_UrunResimleri_Urunler] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urunler] ([UrunlerID])
GO
ALTER TABLE [dbo].[UrunResimleri] CHECK CONSTRAINT [FK_UrunResimleri_Urunler]
GO
ALTER TABLE [dbo].[UyeAdresleri]  WITH CHECK ADD  CONSTRAINT [FK_UyeAdresleri_Uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyelerID])
GO
ALTER TABLE [dbo].[UyeAdresleri] CHECK CONSTRAINT [FK_UyeAdresleri_Uyeler]
GO
ALTER TABLE [dbo].[Yorumlar]  WITH CHECK ADD  CONSTRAINT [FK_Yorumlar_Urunler] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urunler] ([UrunlerID])
GO
ALTER TABLE [dbo].[Yorumlar] CHECK CONSTRAINT [FK_Yorumlar_Urunler]
GO
ALTER TABLE [dbo].[Yorumlar]  WITH CHECK ADD  CONSTRAINT [FK_Yorumlar_Uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyelerID])
GO
ALTER TABLE [dbo].[Yorumlar] CHECK CONSTRAINT [FK_Yorumlar_Uyeler]
GO
