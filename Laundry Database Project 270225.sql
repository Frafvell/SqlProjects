/-- Membuat database LaundryPertamina--\
CREATE DATABASE LaundryPertamina;

/-- menggunakan database yang sudah dibuat--\
USE LaundryPertamina;

/-- membuat tabel wisma untuk mencatat lokasi penginapan pelanggan --\
CREATE TABLE Wisma (
   id_wisma INT AUTO_INCREMENT PRIMARY KEY, -- ID unik untuk nama wisma
   nama_wisma VARCHAR(100)  NOT NULL UNIQUE -- Nama wisma (harus unik)
   );
   
/-- Nambahin data wisma ke tabel wisma --\
INSERT INTO Wisma (nama_wisma) VALUES
('Wisma Sungkai'),
('Wisma Bekasap'),
('Wisma Mahoni'),
('Wisma DBQ');

/-- Cek data --\
Select * FROM Wisma;

/-- Membuat Tabel Untuk Mencatat Pesanan Laundry --\
Create table LaundryOrder (
   id_order INT AUTO_INCREMENT PRIMARY KEY, -- ID unik untuk setiap order
   id_wisma INT, -- ID wisma yang mengirimkan laundry
   tanggal_terima DATETIME NOT NULL, -- Waktu pakaian diterima
   tanggal_selesai DATETIME,
   status_laundry ENUM('Proses', 'Selesai') DEFAULT 'Proses', -- Status Laundry
   FOREIGN KEY (id_wisma) REFERENCES Wisma(id_wisma) -- Hubungkan ke tabel wisma
   );
   
/-- cek table--\
SHOW TABLES;
DESC LaundryOrder;  --- UNTUK MELIHAT STRUKTUR SECARA CEPAT ---
DESC JenisPakaian;
DESC ItemLaundry;
SHOW CREATE TABLE LaundryOrder; --- UNTUK MELIHAT DETAIL PEMBUATAN TABLE, BACKUP STRUKTUR TABEL, CEK CONSTRAINT, DAN DEBUGGING ---
SHOW CREATE TABLE ItemLaundry;



/-- Buat tabel Jenis Pakaian --\
CREATE TABLE JenisPakaian (
id_jenis_pakaian INT AUTO_INCREMENT PRIMARY KEY,
nama_jenis VARCHAR(50) UNIQUE NOT NULL
);

/-- Buat tabel Item Laundry --\
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








 
 
   
   
