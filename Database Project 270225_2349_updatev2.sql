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








 
 
   
   