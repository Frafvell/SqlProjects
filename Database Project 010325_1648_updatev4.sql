-- Membuat database LaundryPertamina
CREATE DATABASE LaundryPertamina;

-- menggunakan database yang sudah dibuat
USE LaundryPertamina;

-- membuat tabel wisma untuk mencatat lokasi penginapan pelanggan
CREATE TABLE Wisma (
   id_wisma INT AUTO_INCREMENT PRIMARY KEY, -- ID unik untuk nama wisma
   nama_wisma VARCHAR(100)  NOT NULL UNIQUE -- Nama wisma (harus unik)
   );
   
-- Nambahin data wisma ke tabel wisma
INSERT INTO Wisma (nama_wisma) VALUES
('Wisma Sungkai'),
('Wisma Bekasap'),
('Wisma Mahoni'),
('Wisma DBQ');

-- Cek data
Select * FROM Wisma;

-- Membuat Tabel Untuk Mencatat Pesanan Laundry 
Create table LaundryOrder (
   id_order INT AUTO_INCREMENT PRIMARY KEY, -- ID unik untuk setiap order
   id_wisma INT, -- ID wisma yang mengirimkan laundry
   tanggal_terima DATETIME NOT NULL, -- Waktu pakaian diterima
   tanggal_selesai DATETIME,
   status_laundry ENUM('Proses', 'Selesai') DEFAULT 'Proses', -- Status Laundry
   FOREIGN KEY (id_wisma) REFERENCES Wisma(id_wisma) -- Hubungkan ke tabel wisma
   );
   
-- Nambahin Column Bulan dan tahun
ALTER TABLE LaundryOrder 
  ADD COLUMN bulan INT GENERATED ALWAYS AS (MONTH(tanggal_terima)) STORED,
  ADD COLUMN tahun INT GENERATED ALWAYS AS (YEAR(tanggal_terima)) STORED;
 
   
-- Cek table
SHOW TABLES;
DESC LaundryOrder;  --- UNTUK MELIHAT STRUKTUR SECARA CEPAT ---
DESC JenisPakaian;
DESC ItemLaundry;
SHOW CREATE TABLE LaundryOrder; --- UNTUK MELIHAT DETAIL PEMBUATAN TABLE, BACKUP STRUKTUR TABEL, CEK CONSTRAINT, DAN DEBUGGING ---
SHOW CREATE TABLE ItemLaundry;



-- Buat tabel Jenis Pakaian 
CREATE TABLE JenisPakaian (
id_jenis_pakaian INT AUTO_INCREMENT PRIMARY KEY,
nama_jenis VARCHAR(50) UNIQUE NOT NULL
);

-- Buat tabel Item Laundry 
CREATE TABLE ItemLaundry (
	id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_order INT,
    id_jenis_pakaian INT, -- Hubungkan ke tabel jenis pakaian --
    jumlah INT NOT NULL,
    harga_per_item DECIMAL (10,2) NOT NULL,
    subtotal decimal (10,2) AS (jumlah * harga_per_item) STORED,
    FOREIGN KEY (id_order) REFERENCES LaundryOrder(id_order) ON DELETE CASCADE,
    FOREIGN KEY (id_jenis_pakaian) REFERENCES JenisPakaian(id_jenis_pakaian) ON DELETE CASCADE
    );
    
-- membuat table kategori pakaian pria,wanita,dll
CREATE TABLE IF NOT EXISTS KategoriPakaian (
   id_kategori INT AUTO_INCREMENT PRIMARY KEY,
   nama_kategori VARCHAR(50) UNIQUE NOT NULL
   );
   
-- Ubah tabel JenisPakaian agar terhubung ke KategoriPakaian
ALTER TABLE JenisPakaian ADD COLUMN id_kategori INT;
ALTER TABLE JenisPakaian ADD FOREIGN KEY (id_kategori) REFERENCES KategoriPakaian(id_kategori) ON DELETE SET NULL;

-- Memasukkan kategori pakaian
INSERT INTO KategoriPakaian (nama_kategori) VALUES
('Pria'),
('Wanita'),
('Lain-lain');
SELECT * FROM KategoriPakaian; -- CEK ID kategori yang sudah masuk

-- Memasukkan Jenis pakaian berdasarkan kategori
INSERT INTO JenisPakaian (nama_jenis, id_kategori) VALUES
('Baju Kemeja', 1), -- Pria
('Baju Karate', 1), -- Pria
('Baju Kaus/T-shirt',1), -- Pria
('Baju Safari', 1), -- Pria
('Celana Dalam (P)', 1), -- Pria
('Celana Panjang (P)', 1), -- Pria
('Celana Pendek (P)', 1), -- Pria
('Dasi', 1), -- Pria
('Engkel', 1), -- Pria
('Jaket', 1), -- Pria
('Kaus Dalam', 1), -- Pria
('Kaus Kaki', 1), -- Pria
('Mantel', 1), -- Pria
('Piyama (P)', 1), -- Pria
('Sapu Tangan', 1), -- Pria
('Sarung', 1), -- Pria
('Setelan Jas (P)', 1), -- Pria
('Topi', 1), -- Pria
('Wear Pack', 1), -- Pria
('Baju Renang', 2), -- Wanita
('Bra', 2), -- Wanita
('Blus', 2), -- Wanita
('Celana Dalam (W)', 2), -- Wanita
('Celana Panjang (W)', 2), -- Wanita
('Celana Pendek (W)', 2), -- Wanita
('Gaun', 2), -- Wanita
('Gaun Malam', 2), -- Wanita
('Gaun Panjang', 2), -- Wanita
('Jilbab', 2), -- Wanita
('Kain Panjang', 2), -- Wanita
('Manset', 2), -- Wanita
('Masker', 2), -- Wanita
('Mukenah (W)', 2), -- Wanita
('Pita Baju Muslim', 2), -- Wanita
('Piyama (W)', 2), -- Wanita
('Rok Dalam', 2), -- Wanita
('Rok Panjang', 2), -- Wanita
('Rok Pendek', 2), -- Wanita
('Rompi', 2), -- Wanita
('Sajadah (W)', 2), -- Wanita
('Selendang', 2), -- Wanita
('Setelan Jas (W)', 2), -- Wanita
('Baju Operasi', 3), -- Lain-lain
('Bath Mat', 3), -- Lain-lain
('Bathrobe', 3), -- Lain-lain
('Bed Cover', 3), -- Lain-lain
('Bendera 1M', 3), -- Lain-lain
('Gorden', 3), -- Lain-lain
('Handuk', 3), -- Lain-lain
('Handuk Muka', 3), -- Lain-lain
('Handuk Tangan', 3), -- Lain-lain
('Kain Operasi', 3), -- Lain-lain
('Napkin', 3), -- Lain-lain
('Mukenah (LL)', 3), -- Lain-lain
('Popok', 3), -- Lain-lain
('Sajadah (LL)', 3), -- Lain-lain
('Sarung Bantal', 3), -- Lain-lain
('Sarung Kursi', 3), -- Lain-lain
('Selimut', 3), -- Lain-lain
('Seprai', 3), -- Lain-lain
('Table Cloth LARGE', 3), -- Lain-lain
('Table Cloth MEDIUM', 3), -- Lain-lain
('Umbul-umbul', 3), -- Lain-lain
('Window Curtain', 3); -- Lain-lain

-- Cek Data Jenis Pakaian
SELECT * FROM JenisPakaian;
SHOW CREATE TABLE JenisPakaian;

-- Masang harga
CREATE TABLE HargaPakaian (
 id_harga INT AUTO_INCREMENT PRIMARY KEY,
 id_jenis_pakaian INT,
 harga INT, -- dalam rupiah
 FOREIGN KEY(id_jenis_pakaian) REFERENCES JenisPakaian(id_jenis_pakaian)
);

INSERT INTO HargaPakaian (id_jenis_pakaian, harga) VALUES
  (129, 2000), -- Baju Kemeja
  (130, 10000), -- Baju Karate
  (131, 2000), -- Baju Kaus/T-shirt
  (132, 10000), -- Baju Safari
  (133, 1000), -- Celana Dalam (P)
  (134, 2500), -- Celana Panjang (P)
  (135, 2000), -- Celana Pendek (P)
  (136, 1000), -- Dasi
  (137, 1000), -- Engkel
  (138, 2500), -- Jaket
  (139, 1500), -- Kaus Dalam
  (140, 1000), -- Kaus Kaki
  (141, 3000), -- Mantel
  (142, 10000), -- Piyama (P)
  (143, 1000), -- Sapu Tangan
  (144, 2000), -- Sarung
  (145, 13000), -- Setelan Jas (P)
  (146, 3000), -- Topi
  (147, 7000), -- Wear Pack
  (148, 3500), -- Baju Renang
  (149, 2000), -- Bra
  (150, 2500), -- Blus
  (151, 1000), -- Celana Dalam (W)
  (152, 2500), -- Celana Panjang (W)
  (153, 2000), -- Celana Pendek (W)
  (154, 5000), -- Gaun
  (155, 7000), -- Gaun Malam
  (156, 7500), -- Gaun Panjang
  (157, 2000), -- Jilbab
  (158, 4000), -- Kain Panjang
  (159, 1250), -- Manset
  (160, 1250), -- Masker
  (161, 5000), -- Mukenah (W)
  (162, 1000), -- Pita Baju Muslim 
  (163, 10000), -- Piyama (W)
  (164, 1500), -- Rok Dalam
  (165, 2500), -- Rok Panjang
  (166, 2000), -- Rok Pendek
  (167, 4000), -- Rompi
  (168, 3000), -- Sajadah (W)
  (169, 2500), -- Selendang
  (170, 15000), -- Setelan Jas (W)
  (171, 3500), -- Baju Operasi
  (172, 2000), -- Bath Mat
  (173, 9000), -- Bathrobe
  (174, 15000), -- Bed Cover
  (175, 4000), -- Bendera 1M
  (176, 8000), -- Gorden
  (177, 2500), -- Handuk
  (178, 2000), -- Handuk Muka
  (179, 2000), -- Handuk Tangan
  (180, 3500), -- Kain Operasi
  (181, 1000), -- Napkin
  (182, 5000), -- Mukenah (LL)
  (183, 1000), -- Popok
  (184, 3000), -- Sajadah (LL)
  (185, 1500), -- Sarung Bantal
  (186, 4000), -- Sarung Kursi
  (187, 10000), -- Selimut
  (188, 7000), -- Seprai
  (189, 7000), -- Table Cloth Large
  (190, 7000), -- Table Cloth Medium
  (191, 7000), -- Umbul umbul
  (192, 7000); -- Window Curtain
  
  Select * From HargaPakaian;
  
  -- Menampilkan Harga dengan nama jenis pakaian (JOIN dengan jenis pakaian)
  SELECT jp.nama_jenis, hp.harga
  FROM HargaPakaian hp
  JOIN JenisPakaian jp ON hp.id_jenis_pakaian = jp.id_jenis_pakaian;
  
  
  
  -- Query Total Pakaian per Hari
  SELECT
      DATE(lo.tanggal_terima) AS tanggal,
      COALESCE(SUM(il.jumlah), 0) AS total_pakaian
From LaundryOrder lo
left JOIN ItemLaundry il ON lo.id_order = il.id_order
WHERE lo.tanggal_terima >= '2024-08-01'
GROUP BY tanggal
ORDER BY tanggal;

-- Query Total Pakaian per Bulan dan Tahun
SELECT
    lo.bulan,
    lo.tahun,
    COALESCE(SUM(il.jumlah), 0) AS total_pakaian
FROM LaundryOrder lo
LEFT JOIN ItemLaundry il ON LO.id_order = il.id_order
WHERE lo.tanggal_terima >= '2024-08-01'
GROUP BY lo.tahun, lo.bulan
ORDER BY lo.tahun, lo.bulan;

-- Query Total Pakaian Per Jenis Pakaian
SELECT
   jp.nama_jenis,
   COALESCE(SUM(il.jumlah), 0) AS total_per_jenis
FROM ItemLaundry il
JOIN JenisPakaian jp ON il.id_jenis_pakaian = jp.id_jenis_pakaian
GROUP BY jp.nama_jenis
ORDER BY total_per_jenis DESC;
  
  










 
 
   
   