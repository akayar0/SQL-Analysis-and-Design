CREATE DATABASE AracSatisSistemi;
USE AracSatisSistemi;


CREATE TABLE Markalar (
    marka_id INT AUTO_INCREMENT PRIMARY KEY,
    marka_ad VARCHAR(50) 
);


CREATE TABLE Modeller (
    model_id INT AUTO_INCREMENT PRIMARY KEY,
    model_ad VARCHAR(50),
    marka_id INT,
    FOREIGN KEY (marka_id) REFERENCES Markalar(marka_id)
);


CREATE TABLE Renkler (
    renk_id INT AUTO_INCREMENT PRIMARY KEY,
    renk_ad VARCHAR(30) 
);


CREATE TABLE MotorTipleri (
    motor_id INT AUTO_INCREMENT PRIMARY KEY,
    motor_tipi VARCHAR(30) 
);


CREATE TABLE VitesTipleri (
    vites_id INT AUTO_INCREMENT PRIMARY KEY,
    vites_tipi VARCHAR(30) 
);


CREATE TABLE Kullanicilar (
    kullanici_id INT AUTO_INCREMENT PRIMARY KEY,
    ad VARCHAR(50),
    soyad VARCHAR(50),
    telefon VARCHAR(20),
    email VARCHAR(50)
);


CREATE TABLE Adresler (
    adres_id INT AUTO_INCREMENT PRIMARY KEY,
    kullanici_id INT,
    sehir VARCHAR(50),
    ilce VARCHAR(50),
    sokak VARCHAR(100),
    FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id)
);


CREATE TABLE Araclar (
    arac_id INT AUTO_INCREMENT PRIMARY KEY,
    model_id INT,
    renk_id INT,
    motor_id INT,
    vites_id INT,
    yil INT,
    fiyat BIGINT,
    FOREIGN KEY (model_id) REFERENCES Modeller(model_id),
    FOREIGN KEY (renk_id) REFERENCES Renkler(renk_id),
    FOREIGN KEY (motor_id) REFERENCES MotorTipleri(motor_id),
    FOREIGN KEY (vites_id) REFERENCES VitesTipleri(vites_id)
);


CREATE TABLE Stok (
    stok_id INT AUTO_INCREMENT PRIMARY KEY,
    arac_id INT,
    adet INT,
    FOREIGN KEY (arac_id) REFERENCES Araclar(arac_id)
);


CREATE TABLE Satislar (
    satis_id INT AUTO_INCREMENT PRIMARY KEY,
    arac_id INT,
    kullanici_id INT,
    odeme_turu_id INT,
    tarih DATE,
    FOREIGN KEY (arac_id) REFERENCES Araclar(arac_id),
    FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id),
    FOREIGN KEY (odeme_turu_id) REFERENCES OdemeTurleri(odeme_turu_id)
);


CREATE TABLE OdemeTurleri (
    odeme_turu_id INT AUTO_INCREMENT PRIMARY KEY,
    odeme_turu VARCHAR(30)
);


CREATE TABLE Faturalar (
    fatura_id INT AUTO_INCREMENT PRIMARY KEY,
    satis_id INT,
    toplam_tutar INT,
    fatura_tarihi DATE,
    FOREIGN KEY (satis_id) REFERENCES Satislar(satis_id)
);

CREATE TABLE Fotograflar (
    foto_id INT AUTO_INCREMENT PRIMARY KEY,
    arac_id INT,
    foto_url VARCHAR(250),
    FOREIGN KEY (arac_id) REFERENCES Araclar(arac_id)
);

CREATE TABLE ServisKayitlari (
    servis_id INT AUTO_INCREMENT PRIMARY KEY,
    arac_id INT,
    tarih DATE,
    aciklama VARCHAR(350),
    FOREIGN KEY (arac_id) REFERENCES Araclar(arac_id)
);


CREATE TABLE Kampanyalar (
    kampanya_id INT AUTO_INCREMENT PRIMARY KEY,
    kampanya_adi VARCHAR(50),
    indirim_orani INT,
    baslangic_tarihi DATE,
    bitis_tarihi DATE
);

CREATE TABLE Ilanlar (
    ilan_id INT AUTO_INCREMENT PRIMARY KEY,
    arac_id INT,
    kullanici_id INT,
    aciklama VARCHAR(350),
    tarih DATE,
    FOREIGN KEY (arac_id) REFERENCES Araclar(arac_id),
    FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id)
);

-- -------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Markalar (marka_ad) VALUES
('Toyota'),
('Honda'),
('BMW'),
('Mercedes');

INSERT INTO Modeller (model_ad, marka_id) VALUES
('Corolla', 1),
('Civic', 2),
('320i', 3),
('C200', 4);

INSERT INTO Renkler (renk_ad) VALUES
('Beyaz'),
('Siyah'),
('Kırmızı'),
('Gri');

INSERT INTO MotorTipleri (motor_tipi) VALUES
('Benzin'),
('Dizel'),
('Elektrik');

INSERT INTO VitesTipleri (vites_tipi) VALUES
('Manuel'),
('Otomatik');

INSERT INTO Kullanicilar (ad, soyad, telefon, email) VALUES
('AHMET', 'KAYAR', '05531112233', 'ahmet@gmail.com'),
('MAŞİDE', 'KAYGUSUZ', '05374445566', 'maside@gmail.com'),
('ZEYNEP', 'DEMİR', '05423334455', 'zeynep@gmail.com');

INSERT INTO Adresler (kullanici_id, sehir, ilce, sokak) VALUES
(1, 'İstanbul', 'Kadıköy', 'Bağdat Cad.'),
(2, 'Hatay', 'İskenderun', 'Meydan Mah.'),
(3, 'Mardin', 'Midyat', 'Lozan Cad.');

INSERT INTO Araclar (model_id, renk_id, motor_id, vites_id, yil, fiyat) VALUES
(1, 1, 1, 2, 2020, 650000),
(2, 2, 2, 1, 2019, 550000),
(3, 4, 1, 2, 2022, 1450000),
(4, 3, 2, 2, 2021, 1650000);

INSERT INTO Stok (arac_id, adet) VALUES
(1, 5),
(2, 3),
(3, 2),
(4, 1);

INSERT INTO OdemeTurleri (odeme_turu) VALUES
('Nakit'),
('Kredi Kartı'),
('Havale/EFT');

INSERT INTO Satislar (arac_id, kullanici_id, odeme_turu_id, tarih) VALUES
(1, 1, 1, '2025-11-01'),
(2, 3, 2, '2025-11-05');

INSERT INTO Faturalar (satis_id, toplam_tutar, fatura_tarihi) VALUES
(1, 650000, '2025-11-01'),
(2, 550000, '2025-11-05');

INSERT INTO Fotograflar (arac_id, foto_url) VALUES
(1, 'https://www.corolla1.jpg'),
(2, 'https://www.civic1.jpg'),
(3, 'https://www.320i.jpg'),
(4, 'https://www.c200.jpg');


INSERT INTO ServisKayitlari (arac_id, tarih, aciklama) VALUES
(1, '2025-10-05', 'Periyodik bakım yapıldı'),
(2, '2025-09-10', 'Yağ ve filtre değişimi'),
(3, '2025-08-15', 'Motor kontrolü');

INSERT INTO Kampanyalar (kampanya_adi, indirim_orani, baslangic_tarihi, bitis_tarihi) VALUES
('Kasım İndirimi', 10.00, '2025-11-01', '2025-11-30'),
('Black Friday', 15.00, '2025-11-24', '2025-11-26');


INSERT INTO Ilanlar (arac_id, kullanici_id, aciklama, tarih) VALUES
(1, 1, 'Sahibinden temiz Corolla', '2025-11-01'),
(3, 2, 'Az kullanılmış BMW 320i', '2025-11-06');

-- ---------------------------------------------------------------------------------------------------------------------------------



SELECT * FROM Markalar;
SELECT * FROM Modeller;
SELECT * FROM Renkler;
SELECT * FROM MotorTipleri;
SELECT * FROM VitesTipleri;
SELECT * FROM Kullanicilar;
SELECT * FROM Adresler;
SELECT * FROM Araclar;
SELECT * FROM Stok;
SELECT * FROM OdemeTurleri;
SELECT * FROM Satislar;
SELECT * FROM Faturalar;
SELECT * FROM AracDosyalari;
SELECT * FROM ServisKayitlari;
SELECT * FROM Kampanyalar;
SELECT * FROM Ilanlar;

