Laundry Database
Proyek ini adalah bagian dari pembelajaran pribadi saya dalam SQL, dengan fokus pada sistem database untuk pengelolaan laundry di wisma yang terkait. 

🚀 Goals

Membangun database laundry dengan struktur yang baik.
Memahami hubungan antar tabel (FK, constraints, indexing).
Menggunakan Stored Generated Columns untuk otomatisasi data.
Mengembangkan query SQL untuk analisis pesanan dan transaksi.


📂 Struktur Database

Tabel utama dalam database ini:

Wisma → Menyimpan daftar wisma yang menggunakan layanan laundry.
LaundryOrder → Menyimpan pesanan laundry, termasuk tanggal penerimaan dan status.
JenisPakaian → Menyimpan daftar jenis pakaian berdasarkan kategori.
KategoriPakaian → Menyimpan kategori pakaian (Pria, Wanita, Lain-lain).
ItemLaundry → Menyimpan detail jumlah dan harga pakaian dalam pesanan.

📌 Progress Hari Ini (27 Februari 2025)


✔ Membuat Struktur Database

Membuat database Laundry.
Membuat tabel Wisma, LaundryOrder, JenisPakaian, KategoriPakaian, dan ItemLaundry.
✔ Menambahkan Relasi Antar Tabel

LaundryOrder terhubung ke Wisma.
JenisPakaian terhubung ke KategoriPakaian.
ItemLaundry terhubung ke LaundryOrder dan JenisPakaian.
✔ Menambahkan Generated Columns

Menambahkan kolom bulan & tahun di LaundryOrder untuk analisis data.
✔ Memasukkan Data Awal

Menambahkan daftar wisma (Wisma Sungkai, Wisma Bekasap, dll.).
Menambahkan kategori pakaian (Pria, Wanita, Lain-lain).
Memasukkan jenis pakaian berdasarkan kategori (Baju Kemeja, Celana Panjang, dll.).




📋 To-Do List (28 Februari 2025)


🔹 Menambahkan price list untuk setiap jenis pakaian.
🔹 Memasukkan jumlah pakaian dalam pesanan (qty).
🔹 Menghitung total harga berdasarkan pesanan.
🔹 Menyiapkan laporan jumlah pesanan per bulan.

