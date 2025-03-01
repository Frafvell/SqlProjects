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




📋 To-Do List 


🔹 Menambahkan price list untuk setiap jenis pakaian. (DONE)

🔹 Memasukkan jumlah pakaian dalam pesanan (qty). (60% ON THE WAY)

🔹 Menghitung total harga berdasarkan pesanan. (CONTINUING TOMORROW)

🔹 Menyiapkan laporan jumlah pesanan per bulan. (CONTINUING TOMORROW)


(28 February 2025 23:44)

Preparing for Ramadhan tomorrow. I will complete it tomorrow.
Mau siap siap bulan Ramadhan. Akan aku lanjutkan besok :) Happy Ramadhan everyone!


(1 March 2025 21:27)

Hey! Got a little update. 

✔ Learned and added queries for total clothes per day, month, and year.
Also added a query to track total clothes per clothing type!
Today was a bit slow since I was busy with IRL stuff (also, my adhd went to the roof. no worries tho im chillin rn. needed some sleep tho), but I’m hoping to input the quantity tomorrow—there's a lot to handle! 

Hey! Ada sedikit update untuk hari ini

✔ Belajar dan menambahkan query untuk total pakaian per hari, bulan, dan tahun.
Juga menambahkan query untuk melacak total pakaian berdasarkan jenis pakaian!

Hari ini agak lambat karena sibuk dengan urusan lain (plus, ADHD-ku lagi kacau banget. Tapi sekarang udah okay. Cuma butuh istrahat untuk malam ini). Semoga besok bisa input jumlahnya—banyak yang harus dikerjakan!




