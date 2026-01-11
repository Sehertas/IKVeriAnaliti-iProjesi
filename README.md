# 📊 Power BI İnsan Kaynakları (İK) Analizi Projesi

Bu proje, bir şirketin **İnsan Kaynakları ve Bordro verilerini** analiz etmek ve stratejik karar alma süreçlerini desteklemek amacıyla geliştirilmiş **uçtan uca bir veri modelleme, analiz ve görselleştirme** çalışmasıdır.

Proje; **PostgreSQL** üzerinde kurulan ilişkisel veri tabanı ile başlar, **Power BI** üzerinde oluşturulan interaktif ve yönetici seviyesinde bir dashboard ile son bulur.

---

## 🎯 Projenin Amacı

* Şirket genelindeki **çalışan dağılımını** analiz etmek
* **Departman ve pozisyon bazlı** çalışan sayılarını incelemek
* **Maaş, kıdem ve bütçe** ilişkilerini analiz etmek
* **İzin süreçlerini** (bekleyen, onaylanan, reddedilen) takip etmek
* Power BI üzerinde **doğru veri modelleme ve DAX kullanımı** pratiği kazanmak

---

## 🏗️ Teknik Mimari & Proje Bileşenleri

### 🗄️ Veritabanı Katmanı (SQL)

* PostgreSQL kullanılarak **ilişkisel veri modeli** oluşturulmuştur.
* Primary Key & Foreign Key kısıtları ile veri bütünlüğü sağlanmıştır.
* `INSERT INTO` ve **dinamik SQL üretimi** ile 100+ çalışan kaydı içeren gerçekçi simülasyon verisi oluşturulmuştur.

**Ana SQL dosyaları:**

* `01_schema.sql` → Tablo ve kısıt tanımları
* `02_insert_data.sql` → Örnek / simülasyon verileri
* `03_analysis_queries.sql` → Analitik SQL sorguları

---

### 📊 Görselleştirme Katmanı (Power BI)

* PostgreSQL verileri Power BI’a bağlanarak modellenmiştir.
* Fact & Dimension mantığına uygun veri ilişkileri kurulmuştur.
* DAX ölçüleri ile hesaplanan KPI’lar üzerinden **etkileşimli dashboard** oluşturulmuştur.

---

## 🧱 Veri Modeli

Proje aşağıdaki 4 ana tablo üzerine inşa edilmiştir:

* **çalışanlar** → Ad, soyad, pozisyon, maaş, işe giriş tarihi, departman bilgileri
* **departmanlar** → Departman adı, lokasyon, bütçe ve yönetici eşleşmeleri
* **bordro** → Net maaş, prim ve kesinti detayları
* **izinler** → İzin türleri, tarih aralıkları ve onay durumları

Tablolar arası ilişkiler **1-N** olacak şekilde tasarlanmış ve tek yönlü filtreleme uygulanmıştır.

---

## 📈 Power BI Dashboard İçeriği

### 📌 Genel Şirket Özeti (KPI)

* Toplam çalışan sayısı
* Toplam ödenen maaş
* Bekleyen izin sayısı

### 🏢 Departman Analizi

* Departman bazlı çalışan sayısı
* Departman bütçesi vs toplam maaş maliyeti

### 💰 Maaş & Kıdem Analizi

* Pozisyonlara göre maaş dağılımı
* Kıdem – maaş ilişkisi (scatter chart)

### 🎛️ İnteraktif Filtreler (Slicer)

* Departman
* Pozisyon
* Lokasyon
* Maaş aralığı

---

## 🧠 Business Questions Answered

* Hangi departmanlarda çalışan yoğunluğu bütçeyi zorluyor?
* Departman bazında en yüksek maaşı alan çalışanlar kimler?
* Kıdem arttıkça maaşlar nasıl değişiyor?
* Bekleyen izin talepleri hangi departmanlarda yoğunlaşıyor?

---

## 🔍 SQL Analiz Senaryoları

* **Departman Bazlı Çalışan Sayısı**
* **Departman Yöneticileri ve Organizasyon Yapısı**
* **Ortalama Maaş ve Yüksek Maaş Alan Çalışanlar**
* **Departman Bazlı En Yüksek Maaş Analizi (Window Functions)**
* **Bekleyen İzinler ve Hiç İzin Kullanmayan Çalışanlar**
* **3 Yıldan Fazla Kıdeme Sahip Çalışanlar**
* **Departman Bütçesi vs Maaş Maliyeti Analizi**

---

## 🧮 Kullanılan Örnek DAX Ölçüleri

```DAX
Toplam Çalışan Sayısı = DISTINCTCOUNT(çalışanlar[id])
```

```DAX
Bekleyen İzin Sayısı =
CALCULATE(
    COUNTROWS(izinler),
    izinler[onay_durumu] = "Beklemede"
)
```

```DAX
Çalışma Süresi (Yıl) =
DATEDIFF(çalışanlar[işe_giriş_tarihi], TODAY(), YEAR)
```

---

## ⚙️ Kurulum & Çalıştırma

1️⃣ `01_schema.sql` dosyasını çalıştırarak tablo yapısını oluşturun

2️⃣ `02_insert_data.sql` ile örnek verileri yükleyin

3️⃣ Power BI Desktop üzerinden `dashboard.pbix` dosyasını açın

4️⃣ Gerekirse veri kaynağı bağlantı ayarlarını güncelleyin

---

## 🌟 Öne Çıkan Özellikler

* Dinamik SQL ile **gerçekçi veri üretimi**
* Doğru filtre bağlamı ve çapraz filtreleme (cross-filtering)
* Yönetici seviyesine uygun, sade ve estetik dashboard tasarımı
* SQL + Power BI entegrasyonu ile uçtan uca analiz yaklaşımı

---

## 📌 Varsayımlar & Kısıtlar

* Bordro verileri 2024 yılı ile sınırlıdır.
* Çıkış tarihi olmayan çalışanlar aktif kabul edilmiştir.
* Maaş ve prim verileri simülasyon amaçlıdır.

---

## 🔮 Gelecek Geliştirmeler

* Çalışan çıkış tarihleri eklenerek **turnover analizi**
* Performans skorları ile verimlilik analizi
* Power BI Service üzerinden paylaşım ve otomatik yenileme

---

## 👤 Hazırlayan

**Seher Taş**
Industrial Engineer | Data Analyst
SQL • Power BI • Excel

---

⭐ Bu proje, veri analitiği ve iş zekası alanında portföy geliştirme amacıyla hazırlanmıştır.
