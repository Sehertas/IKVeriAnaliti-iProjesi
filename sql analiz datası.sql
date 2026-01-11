--İNSAN KAYNAKLARI VE BORDRO SİSTEMİ--
--TABLO OLUŞTURMA--
-- 1️⃣ ÇALIŞANLAR
CREATE TABLE "çalışanlar" (
    "id" SERIAL PRIMARY KEY,
    "ad" VARCHAR(255) NOT NULL,
    "soyad" VARCHAR(255) NOT NULL,
    "departman_id" INTEGER NOT NULL,
    "pozisyon" VARCHAR(255) NOT NULL,
    "işe_giriş_tarihi" DATE NOT NULL,
    "maaş" DECIMAL(10,2) NOT NULL
);
-- 2️⃣ DEPARTMANLAR
CREATE TABLE "departmanlar" (
    "id" SERIAL PRIMARY KEY,
    "departman_adı" VARCHAR(255) NOT NULL,
    "yönetici_id" INTEGER, -- NULL olabilir (döngüsel FK çözümü)
    "lokasyon" VARCHAR(255) NOT NULL,
    "bütçe" DECIMAL(10,2) NOT NULL
);
-- 3️⃣ BORDRO
CREATE TABLE "bordro" (
    "id" SERIAL PRIMARY KEY,
    "çalışan_id" INTEGER NOT NULL,
    "ay" INTEGER NOT NULL CHECK ("ay" BETWEEN 1 AND 12),
    "yıl" INTEGER NOT NULL,
    "net_maaş" DECIMAL(10,2) NOT NULL,
    "prim" DECIMAL(10,2) NOT NULL,
    "kesinti" DECIMAL(10,2) NOT NULL
);
-- 4️⃣ İZİNLER
CREATE TABLE "izinler" (
    "id" SERIAL PRIMARY KEY,
    "çalışan_id" INTEGER NOT NULL,
    "izin_türü" VARCHAR(255) NOT NULL,
    "başlangıç" DATE NOT NULL,
    "bitiş" DATE NOT NULL,
    "onay_durumu" VARCHAR(50) NOT NULL
);
-- 5️⃣ FOREIGN KEY TANIMLARI
ALTER TABLE "çalışanlar"
ADD CONSTRAINT "çalışanlar_departman_id_fk"
FOREIGN KEY ("departman_id") REFERENCES "departmanlar"("id");

ALTER TABLE "bordro"
ADD CONSTRAINT "bordro_çalışan_id_fk"
FOREIGN KEY ("çalışan_id") REFERENCES "çalışanlar"("id");

ALTER TABLE "izinler"
ADD CONSTRAINT "izinler_çalışan_id_fk"
FOREIGN KEY ("çalışan_id") REFERENCES "çalışanlar"("id");

ALTER TABLE "departmanlar"
ADD CONSTRAINT "departmanlar_yönetici_id_fk"
FOREIGN KEY ("yönetici_id") REFERENCES "çalışanlar"("id");

--VERİ EKLEME İŞLEMİ--
INSERT INTO "departmanlar" ("departman_adı", "lokasyon", "bütçe")
VALUES
('İnsan Kaynakları', 'İstanbul', 500000),
('Muhasebe', 'İstanbul', 750000),
('Bilgi Teknolojileri', 'Ankara', 1200000),
('Üretim', 'Bursa', 2000000),
('Satış', 'İzmir', 1000000);
--Çalışanlar--
INSERT INTO "çalışanlar"
("ad","soyad","departman_id","pozisyon","işe_giriş_tarihi","maaş") VALUES
('Ahmet','Yılmaz',1,'İK Uzmanı','2019-03-15',22000),
('Mehmet','Kaya',3,'Yazılım Mühendisi','2020-01-10',38000),
('Elif','Demir',2,'Muhasebe Uzmanı','2018-07-01',26000),
('Zeynep','Şahin',3,'Veri Analisti','2021-06-20',34000),
('Murat','Çelik',4,'Üretim Mühendisi','2017-09-05',42000),
('Ayşe','Koç',5,'Satış Uzmanı','2022-02-14',28000),
('Burak','Aydın',4,'Vardiya Amiri','2016-11-30',39000),
('Selin','Arslan',1,'İK Analisti','2023-04-01',21000),
('Emre','Öztürk',3,'Sistem Analisti','2019-11-18',36000),
('Canan','Polat',2,'Mali Analist','2020-05-25',29500),

('Kerem','Yıldız',3,'Backend Geliştirici','2021-02-08',36000),
('Seda','Karaca',1,'İK Uzman Yardımcısı','2022-09-12',20000),
('Onur','Taş',4,'Üretim Şefi','2016-06-01',45000),
('Pınar','Aksoy',2,'Bütçe Uzmanı','2019-10-21',31000),
('Volkan','Güneş',5,'Satış Müdürü','2015-03-18',48000),
('Ece','Bayram',3,'Veri Bilimci','2022-01-17',40000),
('Serkan','Bozkurt',4,'Kalite Kontrol Mühendisi','2018-12-03',37000),
('Büşra','Çetin',1,'İK Eğitim Sorumlusu','2020-07-14',24000),
('Kaan','Uslu',3,'DevOps Mühendisi','2019-04-09',42000),
('Melis','Toprak',5,'Kurumsal Satış Uzmanı','2021-11-22',29500),

('İsmail','Doğan',4,'Bakım Teknisyeni','2017-05-30',33000),
('Gamze','Eren',2,'Maliyet Analisti','2020-08-19',32500),
('Tolga','Korkmaz',3,'Frontend Geliştirici','2022-06-06',35000),
('Aslı','Özkan',1,'İK İş Ortağı','2018-02-26',30000),
('Fatih','Çalışkan',5,'Saha Satış Temsilcisi','2023-03-13',23000),
('Neslihan','Yavuz',2,'Finansal Raporlama Uzmanı','2017-09-04',34000),
('Barış','Acar',4,'Üretim Planlama Mühendisi','2019-12-16',39000),
('Şeyma','Altın',3,'İş Zekası Analisti','2021-05-10',36500),
('Okan','Kılıç',5,'Satış Operasyonları Uzmanı','2020-10-01',31000),
('Zehra','Bulut',1,'İK Raporlama Uzmanı','2022-04-18',22500),

('Hakan','Erdoğan',4,'Üretim Müdürü','2015-08-10',52000),
('Derya','Kurt',5,'Bölge Satış Sorumlusu','2018-04-17',33000),
('Emrah','Keskin',3,'Uygulama Geliştirici','2019-06-11',35500),
('Merve','Avcı',1,'İK Asistanı','2023-01-09',19000),
('Serhat','Boz',2,'Muhasebe Analisti','2021-03-22',27500),
('İrem','Akın',3,'Test Mühendisi','2022-08-15',32000),
('Uğur','Deniz',4,'Üretim Operatörü','2017-10-03',30000),
('Gizem','Yalçın',5,'Satış Destek Uzmanı','2020-12-07',26000),
('Cihan','Özer',3,'Veritabanı Uzmanı','2016-05-19',41000),
('Esra','Kapan',2,'Finans Uzmanı','2018-11-26',34500),
('Yasin','Mutlu',3,'Yazılım Geliştirici','2020-02-12',36000),
('Sinem','Özdemir',1,'İK Uzmanı','2019-09-23',24000),
('Levent','Şen',4,'Üretim Mühendisi','2017-04-05',43000),
('Cansu','Güler',5,'Satış Uzmanı','2021-06-18',29000),
('Berk','Tuna',3,'Veri Analisti','2022-03-11',33500),
('Nazan','Korkut',2,'Muhasebe Uzmanı','2018-10-30',27500),
('Oğuz','Kaplan',4,'Vardiya Sorumlusu','2016-08-19',39500),
('Hilal','Yıldırım',1,'İK Asistanı','2023-02-06',19500),
('Furkan','Ekinci',3,'Frontend Geliştirici','2021-12-01',34500),
('Tuğçe','Ateş',5,'Satış Destek Uzmanı','2020-05-14',26000),

('Serdar','Işık',4,'Üretim Şefi','2015-11-09',47000),
('Deniz','Pekcan',2,'Finans Analisti','2019-07-22',31500),
('Alper','Sarı',3,'Backend Geliştirici','2020-09-17',37500),
('Beyza','Karaman',1,'İK Raporlama Uzmanı','2022-04-28',23000),
('Kubilay','Ersoy',5,'Bölge Satış Temsilcisi','2018-03-05',34000),
('Aylin','Önal',2,'Bütçe Uzmanı','2017-12-14',33000),
('Emir','Sezer',3,'DevOps Mühendisi','2019-06-01',42500),
('Nazlı','Türkmen',1,'İK Eğitim Uzmanı','2020-10-20',25500),
('Hüseyin','Demirtaş',4,'Bakım Teknisyeni','2016-01-25',32000),
('Sibel','Aktaş',5,'Kurumsal Satış Uzmanı','2021-08-09',30500),

('Mert','Alkan',3,'Test Mühendisi','2022-07-04',31000),
('Şirin','Özsoy',2,'Mali Raporlama Uzmanı','2018-09-18',34500),
('İlker','Gök',4,'Üretim Planlama Mühendisi','2017-02-13',40500),
('Hande','Yücel',1,'İK İş Ortağı','2019-05-27',29500),
('Tolunay','Bayraktar',5,'Saha Satış Uzmanı','2023-01-16',24000),
('Funda','Taşkın',2,'Muhasebe Analisti','2020-11-02',28500),
('Cem','Ergin',3,'Sistem Mühendisi','2016-06-21',44500),
('Zeliha','Çoban',1,'İK Uzman Yardımcısı','2022-12-05',20500),
('Kadir','Şimşek',4,'Üretim Operatörü','2018-08-29',29500),
('Gökçe','Uçar',5,'Satış Operasyon Uzmanı','2021-04-12',31500),

('Baran','Tekin',3,'İş Zekası Analisti','2020-01-08',37000),
('Selma','Yurt',2,'Finans Uzmanı','2017-10-06',35000),
('Ozan','Koşar',4,'Kalite Mühendisi','2019-03-19',38500),
('Pelin','Erdal',1,'İK Planlama Uzmanı','2021-09-27',26500),
('Rıza','Karagöz',5,'Satış Müdür Yardımcısı','2016-05-03',46000),
('Burcu','Sağlam',2,'Maliyet Kontrol Uzmanı','2020-06-15',32500),
('Anıl','Özkan',3,'Mobil Uygulama Geliştirici','2022-02-22',35500),
('Suna','Bilgin',1,'İK Asistanı','2023-03-20',19000),
('Metin','Arıkan',4,'Üretim Süreç Uzmanı','2018-11-11',40000),
('Ebru','Tanrıverdi',5,'Müşteri İlişkileri Uzmanı','2019-07-01',28000);

--Bordro datasının oluşturulması--
INSERT INTO "bordro" (
    "çalışan_id", "ay", "yıl", "net_maaş", "prim", "kesinti"
)
SELECT
    c.id,
    m.ay,
    2024,
    c.maaş + (random() * 3000),
    random() * 2000,
    random() * 1500
FROM "çalışanlar" c
CROSS JOIN generate_series(1, 12) AS m(ay);
--İzinler tablosunun oluşturulması--
INSERT INTO "izinler" (
    "çalışan_id", "izin_türü", "başlangıç", "bitiş", "onay_durumu"
)
SELECT
    id,
    CASE 
        WHEN id % 3 = 0 THEN 'Yıllık İzin'
        WHEN id % 3 = 1 THEN 'Mazeret İzni'
        ELSE 'Hastalık İzni'
    END,
    DATE '2024-01-01' + (id % 200),
    DATE '2024-01-01' + (id % 200) + (id % 10),
    CASE
        WHEN id % 3 = 0 THEN 'Onaylandı'
        WHEN id % 3 = 1 THEN 'Beklemede'
        ELSE 'Reddedildi'
    END
FROM "çalışanlar"
WHERE id % 2 = 0;
--UPDATE--
-- select*from bordro
-- select*from departmanlar
-- select*from izinler
-- select*from çalışanlar
-- DELETE FROM çalışanlar;
-- TRUNCATE TABLE çalışanlar RESTART IDENTITY CASCADE;

-- SELECT id, ad, soyad, pozisyon, departman_id
-- FROM çalışanlar
-- WHERE pozisyon = 'Yönetici'

-- UPDATE departmanlar
-- SET yönetici_id = 50
-- WHERE id = 1; -- İnsan Kaynakları

-- UPDATE departmanlar
-- SET yönetici_id = 10
-- WHERE id = 2; -- Muhasebe

-- UPDATE departmanlar
-- SET yönetici_id = 22
-- WHERE id = 3; -- Bilgi Teknolojileri

-- UPDATE departmanlar
-- SET yönetici_id = 35
-- WHERE id = 4; -- Üretim

-- UPDATE departmanlar
-- SET yönetici_id = 4
-- WHERE id = 5; -- Satış

--SQL İNSAN KAYNAKLARI & FİNANSAL ANALİZ SORGULARI --

--Departman & Organizasyon Analizleri--
--1) Hangi departmanda kaç kişi var? En kalabalık departman hangisi bulalım.
Select 
  departman_adı, 
  Count(çalışanlar.id) as çalışan_Sayısı 
from 
  çalışanlar 
  INNER JOIN departmanlar on çalışanlar.departman_id = departmanlar.id 
group by 
  departman_adı 
order by 
  departman_Adı asc
 --2) Hangi departmanın yöneticisi kim? (Departman adı ve Yönetici ad-soyadını yan yana getir)
select 
  yönetici_id, 
  ad, 
  soyad, 
  departman_adı 
from 
  çalışanlar 
  INNER JOIN departmanlar on çalışanlar.departman_id = departmanlar.id 
group by 
  yönetici_id, 
  ad, 
  soyad, 
  departman_adı

--Maaş & Bordro Analizleri--
--1) Şirket genelinde ortalama maaşı bulalım.
SELECT REPLACE(
           TO_CHAR(ROUND(AVG(net_maaş)), 'FM99G999G999'),
           ',', '.'
       )
FROM bordro;
--2) Maaşı 50.000 den fazla olan çalışanın adı,soyadı ve departmanını getirelim.
select ad,soyad,departman_adı,pozisyon, net_maaş
from bordro
LEFT JOIN çalışanlar on bordro.çalışan_id= çalışanlar.id
INNER JOIN departmanlar on çalışanlar.departman_id= departmanlar.id
where net_maaş>50000

--3)Departmanlar içerisinde "en yüksek maaş" kişi listesi--
SELECT 
    departman_adı,
    ad,
    soyad,
    pozisyon,
    net_maaş
FROM (
    SELECT 
        d.departman_adı,
        ç.ad,
        ç.soyad,
        ç.pozisyon,
        b.net_maaş,
        RANK() OVER (PARTITION BY d.id ORDER BY b.net_maaş DESC) AS rnk
    FROM bordro b
    INNER JOIN çalışanlar ç ON b.çalışan_id = ç.id
    INNER JOIN departmanlar d ON ç.departman_id = d.id
) t
WHERE rnk = 1;
--4) 2024 yılında en çok maaş alan ilk 5 çalışan ve aldıkları toplam prim tutarı--
SELECT c.ad, c.soyad, SUM(b.prim) AS toplam_prim
FROM bordro b
JOIN çalışanlar c ON b.çalışan_id = c.id
WHERE b.yıl = 2024
GROUP BY c.id, c.ad, c.soyad
ORDER BY toplam_prim DESC
LIMIT 5;

--İzin & Çalışan Durum Analizleri--
--1) Henüz "Onay bekleyen" (Beklemede) izinleri ve bu izinleri isteyen çalışanları listeleleyelim.
select 
  ç.ad, 
  ç.soyad, 
  i.onay_durumu 
from 
  çalışanlar as ç 
  INNER JOIN izinler as i on ç.id = i.çalışan_id 
where 
  onay_durumu = 'Beklemede'
--2) Hiç izin kullanmayanlar--
select ç.ad,ç.soyad
from çalışanlar ç
LEFT JOIN izinler i on ç.id=i.çalışan_id
where i.id is null

--3) Şirkette 3 yıldan fazla çalışan(işe giriş tarihini baz alarak) listesi--
SELECT ad, soyad, işe_giriş_tarihi
FROM çalışanlar
WHERE işe_giriş_tarihi < CURRENT_DATE - INTERVAL '3 years';

--Bütçe & Finansal Yük Analizleri--
--Bütçeyi aşan departmanları bulalım.(Departmanların kendi bütçeleri ile o departmandaki 
--çalışanların toplam maaş yükünü karşılaştıralım)
SELECT 
    d.departman_adı, 
    d.bütçe, 
   SUM(ç.maaş) as toplam_maaş_maliyeti,
    (d.bütçe - SUM(ç.maaş)) as kalan_bütçe
FROM departmanlar d
JOIN çalışanlar ç ON d.id = ç.departman_id
GROUP BY d.id, d.departman_adı, d.bütçe;


























