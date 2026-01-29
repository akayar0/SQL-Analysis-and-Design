CREATE DATABASE univ_bilgi;
USE univ_bilgi;



CREATE TABLE fakulte(
	fakulte_id INT PRIMARY KEY AUTO_INCREMENT not null,
    fakulte_adi VARCHAR(50)
);

CREATE TABLE bolum(
	bolum_id INT PRIMARY KEY AUTO_INCREMENT not null,
    fakulte_id INT, -- references
    bolum_adi VARCHAR(50)
);

CREATE TABLE ogrenci(
	ogrenci_id INT PRIMARY KEY AUTO_INCREMENT not null,
	ogrenci_ad VARCHAR(50),
    ogrenci_soyad VARCHAR(50),
    bolum_id INT -- references
);

CREATE TABLE ogrenci_adres(
	ogrenci_adres_id INT PRIMARY KEY AUTO_INCREMENT not null,
    ogrenci_id INT, -- references
    ogrenci_adres VARCHAR (250)
);

CREATE TABLE ogrenci_tel(
	ogrenci_tel_id INT PRIMARY KEY AUTO_INCREMENT not null,
    ogrenci_id INT, -- references
    ogrenci_telefon VARCHAR(11)
);

CREATE TABLE ogretim_uyesi(
	ogretim_uyesi_id INT PRIMARY KEY AUTO_INCREMENT not null,
    ogretim_uyesi_ad VARCHAR(50),
    ogretim_uyesi_soyad VARCHAR(50),
    bolum_id INT -- references
);

CREATE TABLE ders(
	ders_id INT PRIMARY KEY AUTO_INCREMENT not null,
    ders_adi VARCHAR(100) not null,
    kredi INT
);

CREATE TABLE donem(
	donem_id INT PRIMARY KEY AUTO_INCREMENT not null,
    donem_ad VARCHAR(50)
);

CREATE TABLE ders_acma (
    ders_acma_id INT PRIMARY KEY AUTO_INCREMENT not null,
    ders_id INT, 
    ogretim_uyesi_id INT, -- references
    donem_id INT -- references
);

CREATE TABLE ders_kayit(
	ders_kayit_id INT PRIMARY KEY AUTO_INCREMENT not null,
    ogrenci_id INT, -- references
    ders_acma_id INT -- references
);

CREATE TABLE notlandirma(
	notlandirma_id INT PRIMARY KEY AUTO_INCREMENT not null,
    ders_kayit_id INT, -- references
    vize TINYINT,
    final TINYINT
);

-- --------------------------------------------------------------------------------------

ALTER TABLE ogrenci
ADD FOREIGN KEY (bolum_id) REFERENCES bolum(bolum_id);

ALTER TABLE ogrenci_adres
ADD FOREIGN KEY (ogrenci_id) REFERENCES ogrenci(ogrenci_id);

ALTER TABLE ogrenci_tel
ADD FOREIGN KEY (ogrenci_id) REFERENCES ogrenci(ogrenci_id);

ALTER TABLE bolum
ADD FOREIGN KEY (fakulte_id) REFERENCES fakulte(fakulte_id);

ALTER TABLE ogretim_uyesi
ADD FOREIGN KEY (bolum_id) REFERENCES bolum(bolum_id);

ALTER TABLE ders_acma
ADD FOREIGN KEY (ogretim_uyesi_id) REFERENCES ogretim_uyesi(ogretim_uyesi_id),
ADD FOREIGN KEY (donem_id) REFERENCES donem(donem_id),
ADD FOREIGN KEY (ders_id) REFERENCES ders(ders_id);

ALTER TABLE ders_kayit
ADD FOREIGN KEY (ogrenci_id) REFERENCES ogrenci(ogrenci_id),
ADD FOREIGN KEY (ders_acma_id) REFERENCES ders_acma(ders_acma_id);

ALTER TABLE notlandirma
ADD FOREIGN KEY (ders_kayit_id) REFERENCES ders_kayit(ders_kayit_id);

-- --------------------------------------------------------------------------------------

INSERT INTO fakulte(fakulte_adi) VALUES
('MÜHENDİSLİK VE DOĞA BİLİMLERİ FAKÜLTESİ'),
('MİMARLIK FAKÜLTESİ'),
('SAĞLIK BİLİMLERİ FAKÜLTESİ'),
('EĞİTİM BİLİMLERİ FAKÜLTESİ');


INSERT INTO bolum(fakulte_id, bolum_adi) VALUES
(1, 'BİLGİSAYAR MÜHENDİSLİĞİ'),
(3, 'TIP'),
(4, 'MATEMATİK ÖĞRETMENLİĞİ'),
(4, 'İNGİLİZCE ÖĞRETMENLİĞİ'),
(2, 'MİMARLIK');


INSERT INTO ogrenci(ogrenci_ad, ogrenci_soyad, bolum_id) VALUES
('AHMET', 'KAYAR', 1),
('MAŞİDE', 'KAYGUSUZ', 2),
('YUSUF', 'BOYRAZ', 3),
('ZEYNEP', 'DEMİR', 4),
('MEHMET ZEKİ', 'ELMAS', 5);


INSERT INTO ogretim_uyesi(ogretim_uyesi_ad, ogretim_uyesi_soyad, bolum_id) VALUES
('SAMİ', 'KARAKUL', 1),
('YAKUP', 'KUTLU', 2),
('İPEK', 'ABASIKELEŞ', 3),
('AHMET', 'DEMİR', 4),
('MEHMET', 'BAKIR', 5);


INSERT INTO ders(ders_adi,kredi) VALUES
('VERİTABANI YÖNETİM SİSTEMLERİ', 4),
('BİLGİSAYAR PROGRAMLAMA', 3),
('NESNE TABANLI PROGRAMLAMA', 3),
('AĞ TEKNOLOJİLERİ', 3),
('ETİK', 2);


INSERT INTO donem(donem_ad) VALUES
('2025 GÜZ'),
('2025 BAHAR');


INSERT INTO ders_acma(ders_id, ogretim_uyesi_id,donem_id) VALUES
(1,2,1),
(2,4,1),
(3,5,1),
(4,3,2),
(5,1,2);


INSERT INTO ogrenci_adres(ogrenci_id,ogrenci_adres) VALUES
(1,'MARDİN, ARTUKLU'),
(2,'MALATYA, BATTALGAZİ'),
(3,'AMASYA, MERKEZ'),
(4,'İSTANBUL, KADIKÖY'),
(5,'İZMİR, BERGAMA');


INSERT INTO ogrenci_tel(ogrenci_id,ogrenci_telefon) VALUES
(1,'5317964447'),
(2,'5337968574'),
(3,'5527458540'),
(4,'5317996524'),
(5,'5322968504');


INSERT INTO ders_kayit(ogrenci_id, ders_acma_id) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);


INSERT INTO notlandirma(ders_kayit_id, vize, final) VALUES
(1,80,91),
(2,74,76),
(3,32,56),
(4,41,86),
(5,96,66);

SELECT*FROM ogrenci;
SELECT*FROM ogretim_uyesi;
SELECT*FROM ders;
SELECT*FROM donem;
SELECT*FROM ogrenci_adres;
SELECT*FROM notlandirma;
SELECT*FROM ogrenci_tel;
SELECT*FROM fakulte;
SELECT*FROM ders_acma;
SELECT*FROM ders_kayit;
SELECT*FROM bolum;