[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/Psgen4Dj)

# Ujian Praktikum Flutter POS SQLite
*Nama Mahasiswa:* [Rasya Aprilia]
*NIM:* [362458302115]
*Kelompok:* [5]

## Deskripsi Fitur yang Ditambahkan
* Menambahkan filter laporan berdasarkan rentang tanggal menggunakan DatePicker.
* Menambahkan grafik batang penjualan harian menggunakan chartsf lutter

## File yang Dimodifikasi
Tuliskan nama file dan deskripsi singkat:
* lib/screens/laporan/datePicker_screen.dart → memastikan halaman dataPicker dapat diakses oleh pengguna dari menu utama aplikasi setelah login
* lib/database/database_helper.dart → menambah fungsi untuk memanggil dan memerintahkan database di sql menampilkan tanggal di rentang Waktu yang dipilih lewat UI datapicker
* lib/screen/home/home_screen.dart → menambah tombol (Card) baru yang digunakan sebagai pintasan menuju halaman Laporan Transaksi
* lib/screen/laporan/grafikPenjualan_screen.dart → menampilkan Grafik Batang Penjualan Harian menggunakan package fl_chart

## Cara Menjalankan Aplikasi
1. Jalankan ‘flutter pub get‘
dokumentasi :
<img width="826" height="784" alt="image" src="https://github.com/user-attachments/assets/7b2a276d-aa76-44cb-8735-0b91b13c9506" />
2. Jalankan ‘flutter run‘
dokumentasi :
<img width="895" height="831" alt="image" src="https://github.com/user-attachments/assets/e9109e2f-9823-4959-a02b-f99fd2c3de0c" />
3. Uji fitur yang telah Anda tambahkan : menambah fitur laporan berdasarkan rentang tanggal
-lakukan beberapa kali transaksi pembelian makanan dan minuman,
-cek terlebih dahulu apakah sudah ada transaksi di riwayat transaksi,
-masuk ke bagian laporan transaksi,
-pilih tanggal rentang waktu untuk menampilkan transaksi yang diinginkan,
-transaksi dalam rentang waktu itu akan langsung ditampilkan

## Screenshot
Lampirkan minimal 2 screenshot hasil implementasi fitur.
1. lampiran pintasan laporan transaksi (di homescreen) :
![WhatsApp Image 2025-10-20 at 19 24 16_20ac9e50](https://github.com/user-attachments/assets/8504f3ec-d628-4d2b-bb78-8844f64ba0fb)
2. lampiran isi saat sudah menentukan rentang tanggal untuk menampilkan transaksi di rentang waktu tersebut :
![WhatsApp Image 2025-10-20 at 19 25 49_45cec03e](https://github.com/user-attachments/assets/2e6f715c-077b-4277-aa21-812883931ab5)
3. lampiran jika tidak ada transaksi di rentang tanggal tersebut :
![WhatsApp Image 2025-10-20 at 18 48 19_e09d7771](https://github.com/user-attachments/assets/66541f21-1841-4fe3-8321-376dce9a2869)
4. lampiran homescreen ada grafik penjualan :
![WhatsApp Image 2025-10-20 at 20 05 41_4694ab02](https://github.com/user-attachments/assets/a64c8a7d-3260-444f-be00-44d3f53c21bb)

## Catatan Tambahan
Tuliskan kendala atau hal menarik yang ditemukan selama ujian.
- saat menampilkan rentang tanggal di tanggal saat ini tidak muncul transaksi di tanggal tersebut
- saat awal tidak muncul ditampilan homescreen
