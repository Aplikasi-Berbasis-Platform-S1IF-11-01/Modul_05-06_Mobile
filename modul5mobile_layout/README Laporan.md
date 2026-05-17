<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3>MODUL 5 & 6<br> FONT & TEXTFIELD</h3>
  <br />
  <img src="assets/Telkom.png" alt="Logo" width="300"> 
  <br />
  <br />
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>BAYU KUNCORO ADI</strong><br>
    <strong>2311102031</strong><br>
    <strong>S1 IF-11-REG01</strong>
  </p>
  <br />
  <br />
  <h3>Dosen Pengampu :</h3>
  <p>
    <strong>Dimas Fanny Hebrasianto Permadi, S.ST., M.Kom</strong>
  </p>
  <br />
  <br />
    <h4>Asisten Praktikum :</h4>
    <strong> Apri Pandu Wicaksono </strong> <br>
    <strong>Rangga Pradarrell Fathi</strong>
  <br />
  <h3>LABORATORIUM HIGH PERFORMANCE
 <br>FAKULTAS INFORMATIKA <br>UNIVERSITAS TELKOM PURWOKERTO <br>2026</h3>
</div>

---

## 1. Dasar Teori

#### 1.1 Mengenal Flutter
Flutter merupakan *framework open-source* besutan Google yang dirancang untuk menciptakan aplikasi multi-platform (mobile, web, dan desktop) hanya dengan mengandalkan satu basis kode (*single codebase*). Berjalan dengan bahasa pemrograman Dart, Flutter mengadopsi prinsip *“Everything is a Widget”*, di mana seluruh elemen visual pembangun antarmuka (UI) diperlakukan sebagai sekumpulan widget. Pada project praktikum ini, Flutter dimanfaatkan untuk merangkai antarmuka interaktif sederhana yang menitikberatkan pada penggunaan layouting dan form input.

#### 1.2 Konsep Widget
Widget bertindak sebagai blok penyusun fundamental dalam setiap aplikasi Flutter, baik sebagai elemen visual langsung maupun sebagai struktur pengatur tata letak. Secara garis besar, Flutter mengklasifikasikan widget ke dalam dua kategori utama:
* **StatelessWidget**: Komponen statis yang tampilannya bersifat permanen dan tidak akan mengalami perubahan *state* selama aplikasi berjalan.
* **StatefulWidget**: Komponen dinamis yang mampu memperbarui atau merender ulang tampilannya secara *real-time* merespons interaksi pengguna atau perubahan data. Pada project ini, `StatefulWidget` digunakan sebagai fondasi halaman utama agar aplikasi siap menangani perubahan data pada area form.

#### 1.3 Pengaturan Tata Letak dengan Column
`Column` adalah widget struktural yang bertugas menyusun sekumpulan widget anak (*children*) secara vertikal dari atas ke bawah. Untuk menyesuaikan perataan elemen di dalamnya secara horizontal, `Column` menyediakan properti seperti `crossAxisAlignment`. Dalam implementasinya di praktikum ini, `Column` difungsikan sebagai kerangka utama untuk menumpuk elemen-elemen seperti teks sapaan dan form input agar berjajar rapi ke bawah.

#### 1.4 Memberikan Ruang dengan Padding
Untuk menghindari tampilan yang terlalu sesak, digunakan widget `Padding`. Fungsinya adalah memberikan ruang kosong (spasi internal) antara suatu komponen dengan komponen lain di sekitarnya atau dengan batas tepi layar perangkat. Pengaplikasian `Padding` pada praktikum ini bertujuan untuk memberikan margin pada area `TextField`, sehingga form input terlihat lebih proporsional, nyaman dipandang, dan tidak menempel langsung pada bezel (*edge*) layar.

#### 1.5 Interaksi Pengguna melalui TextField
Sebagai media input utama, `TextField` memfasilitasi pengguna untuk memasukkan data teks ke dalam aplikasi. Widget ini dilengkapi dengan berbagai properti fungsional, seperti `hintText` yang berfungsi sebagai teks *placeholder* atau panduan singkat, `border` untuk memodifikasi bentuk garis tepi kolom, serta `controller` yang bertugas merekam dan memanipulasi teks yang diketik. Pada program ini, `TextField` dikustomisasi agar memiliki garis tepi melingkar/kotak yang modern memanfaatkan `OutlineInputBorder()`.

#### 1.6 Standarisasi Material Design
Material Design adalah pedoman desain visual komprehensif dari Google yang bertujuan menciptakan pengalaman pengguna (UX) yang konsisten, modern, dan intuitif. Melalui integrasi *library* `material.dart`, Flutter menyediakan akses langsung ke berbagai komponen bawaan Material seperti `Scaffold`, `AppBar`, `Card`, hingga `TextField`. Penerapan `MaterialApp` sebagai akar dari program ini memastikan bahwa seluruh antarmuka yang dibangun otomatis mewarisi gaya desain Material yang familier dan interaktif.

---

## 2. Source Code dan Implementasinya

Berikut adalah kode program yang dipelajari pada Modul 5 ini:

```dart
/*
 * LAPORAN PRAKTIKUM MODUL 5 & 6: FONT & TEXTFIELD
 * Nama : Bayu Kuncoro Adi
 * NIM  : 2311102031
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talkyu Custom',
      theme: ThemeData(
        // Ganti warna utama jadi biru dongker gelap yang lebih modern
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F172A)),
        useMaterial3: true,
        // Background aplikasi dibikin abu-abu super muda biar form-nya lebih menonjol
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const MyHomePage(title: 'Talkyu'),
      // Pita merah debug dimatikan biar UI kelihatan bersih
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Talkyu App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        // Bikin ujung bawah AppBar sedikit melengkung
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      // Center untuk menaruh konten di tengah layar
      body: Center(
        // SingleChildScrollView mencegah error kuning-hitam saat keyboard HP muncul
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Header Teks
                const Text(
                  'Halo, Bayu!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Silakan masukkan pesan kamu di bawah ini.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 35),

                // Kolom Input 1 - Desain Modern dengan Ikon
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan nama',
                    prefixIcon: const Icon(Icons.person_outline), // Tambahan ikon
                    filled: true,
                    fillColor: Colors.white,
                    // Style saat kolom belum diklik
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    // Style saat kolom sedang diklik (fokus)
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xFF0F172A), width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                ),
                const SizedBox(height: 20),

                // Kolom Input 2 - Desain Modern dengan Ikon
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan pesan',
                    prefixIcon: const Icon(Icons.chat_bubble_outline), // Tambahan ikon
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xFF0F172A), width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                ),
                const SizedBox(height: 35),

                // Tambahan Tombol Submit biar makin proper
                SizedBox(
                  width: double.infinity, // Bikin tombol selebar layar
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F172A),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 3,
                    ),
                    onPressed: () {
                      // Aksi ketika tombol ditekan (bisa dikosongi dulu)
                    },
                    child: const Text(
                      'Kirim Pesan',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```

**Implementasi Widget (Column, Padding, dan TextField)**

1. **Implementasi Widget `Column`**:
```
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
```
Widget Column digunakan untuk menyusun beberapa widget secara vertikal dari atas ke bawah. Pada program ini, Column digunakan sebagai wadah utama untuk menyusun teks sapaan, dua buah kolom input (TextField), dan tombol submit. Untuk mengatur tata letaknya, program ini memanfaatkan properti mainAxisAlignment: MainAxisAlignment.center agar keseluruhan susunan widget berada tepat di tengah layar secara vertikal, serta menggunakan properti crossAxisAlignment: CrossAxisAlignment.start agar posisi elemen-elemen di dalam Column (terutama teks header) memiliki perataan kiri yang rapi.

2. **Implementasi Widget `Padding`**
```
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24.0),
  child: Column(...)
```
dan 
```
const SizedBox(height: 20),
```
Widget Padding pada program modifikasi ini diterapkan langsung membungkus keseluruhan Column. Tujuannya adalah untuk memberikan jarak (margin internal) sebesar 24 piksel di sisi kanan dan kiri layar agar form tidak menempel pada tepi device.

Untuk memberikan ruang atau jarak antar komponen di dalam form (seperti jarak antara TextField pertama dan kedua), program ini menggunakan widget SizedBox(height: ...) sebagai pengganti Padding per-elemen agar struktur kode lebih bersih dan mudah dibaca.

3. **Implementasi Widget `TextField`**
```
TextField(
  decoration: InputDecoration(
    hintText: 'Masukkan nama',
    prefixIcon: const Icon(Icons.person_outline),
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Color(0xFF0F172A), width: 2),
    ),
  ),
),
```
Widget TextField digunakan sebagai komponen input teks utama. Pada modifikasi ini, desain TextField dibuat lebih modern dengan penambahan beberapa properti khusus pada InputDecoration. Properti hintText digunakan untuk menampilkan teks petunjuk (placeholder) pada kolom input, sedangkan prefixIcon ditambahkan untuk memunculkan ikon visual di sebelah kiri area input agar fungsi kolom lebih mudah dikenali oleh pengguna. Tampilan visual kolom dipertegas menggunakan properti filled dan fillColor yang memberikan warna latar belakang solid (putih) pada area input. Untuk memperhalus desain, enabledBorder digunakan untuk membentuk garis tepi melengkung (rounded corners dengan radius 15) saat kolom dalam keadaan diam atau belum dipilih. Selain itu, terdapat focusedBorder yang digunakan untuk memberikan interaksi visual berupa perubahan ketebalan dan warna garis tepi menjadi lebih gelap saat pengguna mengklik dan mulai mengetik di kolom tersebut.

## 3. TAMPILAN OUTPUT
<img src="assets/WhatsApp Image 2026-05-17 at 22.42.35.jpeg">

<img src="assets/WhatsApp Image 2026-05-17 at 22.54.15.jpeg">