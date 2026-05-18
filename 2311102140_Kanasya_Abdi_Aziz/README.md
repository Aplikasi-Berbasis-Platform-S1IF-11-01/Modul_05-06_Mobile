<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3> Modul 05-06 Mobile <br> TEXTFIELD </h3>
  <br />
  <img src="assets/logo.png" alt="Logo" width="300"> 
  <br />
  <br />
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Kanasya Abdi Aziz</strong><br>
    <strong>2311102140</strong><br>
    <strong>S1 IF-11-01</strong>
  </p>
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


## 1. Latar Belakang

### A. Flutter, Font, dan Text Field
Flutter adalah  kerangka kerja sumber terbuka yang dikembangkan dan didukung oleh Google, digunakan oleh pengembang front-end dan full-stack untuk membuat antarmuka pengguna (UI) aplikasi untuk berbagai platform menggunakan kode program tunggal. Flutter berfokus pada pengembangan aplikasi seluler saat diluncurkan pada tahun 2018. Saat ini, Flutter mendukung pengembangan aplikasi di enam platform—iOS, Android, web, Windows, MacOS, dan Linux.

Keuntungan Flutter: 
- Kinerja yang lebih mirip dengan versi aslinya Flutter dikompilasi menjadi kode mesin menggunakan bahasa pemrograman Dart. Sebagai hasil dari pemahaman kode ini, perangkat host menjamin performa yang cepat dan efisien.
- Rendering yang cepat, konsisten, dan fleksibel Flutter menggunakan pustaka grafis Skia sumber terbuka milik Google untuk menghasilkan antarmuka antarmuka, yang memberikan pengguna visual yang konsisten apa pun platform yang digunakan untuk mengakses aplikasi, daripada bergantung pada alat rendering khusus platform. 
- Alat yang ramah pembangun. Flutter dibuat oleh Google dengan mengutamakan kemudahan penggunaan. Alat seperti hot reload memungkinkan pengembang melihat perubahan kode tanpa kehilangan status mereka. Memvisualisasikan dan memecahkan masalah tata letak UI lebih mudah dengan alat tambahan seperti pemeriksa widget.

Dart, bahasa pemrograman sumber terbuka yang juga dikembangkan oleh Google, adalah bahasa yang digunakan Flutter. Dart Virtual Machine (VM) berjalan di sistem operasi Windows, Linux, dan macOS. Dart VM menggunakan kompilasi kode just-in-time (JIT), yang menawarkan fitur hot-reload untuk menghemat waktu pengembangan. Widget Text Field adalah sebuah widget Flutter yang digunakan untuk menerima inputan berupa teks dari pengguna. Widget ini memungkinkan kita sebagai pengguna aplikasi untuk memasukkan teks menggunakan keyboard. Banyak manfaat menggunakan widget Text Field untuk mengatur tata letak UI.

- Text Field memungkinkan interaksi langsung dengan pengguna aplikasi seperti mengedit profil, bantuan pencarian, dan memasukkan data saat login. 
- Text Field membantu pengumpulan data yang lebih efisien, karena biasanya data dapat dikumpulkan saat pengguna memasukkan data pada Text Field, sehingga data yang masuk dapat disimpan dan diproses secara real-time.
- Text Field membantu pengembang memasukkan atau menginput data seperti email pengguna secara efektif. Dengan demikian, Text Field akan memastikan bahwa data yang dimasukkan, seperti email yang dimasukkan saat login, sesuai dengan format dan tidak memiliki bagian kosong.

## 2. Sourcecode 

### Sourcecode main.dart
``` Dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talkyu',
      theme: ThemeData(
        // Menambahkan ColorScheme yang benar
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Talkyu'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Masukkan",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Namaaa",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text('You have pushed the button this many times:'),
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

### 3. Hasil Penugasan
![Tampilan](/assets/1.png)

## 4. Penjelasan dan Kesimpulan
Kode di atas adalah aplikasi Flutter sederhana bernama "Talkyu" yang memodifikasi struktur default (aplikasi counter) dengan menambahkan dua kolom input teks. Secara struktural, aplikasi ini dibagi menjadi dua bagian utama, yaitu komponen tanpa perubahan status (StatelessWidget) dan komponen dengan perubahan status (StatefulWidget). Bagian awal kode mendefinisikan fungsi main() sebagai titik masuk aplikasi untuk menjalankan MyApp, sebuah StatelessWidget yang berfungsi mengatur konfigurasi global seperti judul aplikasi dan tema visual berbasis Material 3 dengan warna dasar ungu tua (Colors.deepPurple). Halaman utama aplikasi kemudian diarahkan ke kelas MyHomePage.

Halaman MyHomePage dirancang menggunakan StatefulWidget karena memiliki data dinamis yang nilainya dapat berubah secara real-time, yaitu variabel _counter. Di dalam fungsi penciptaan tampilannya (build method), halaman ini menggunakan struktur dasar Scaffold yang menyediakan komponen area atas (AppBar) untuk menampilkan judul aplikasi dan tombol melayang (FloatingActionButton) di sudut kanan bawah. Ketika tombol plus tersebut ditekan, ia akan memicu fungsi _incrementCounter yang di dalamnya terdapat metode setState(). Fungsi inilah yang bertugas memberi tahu kerangka kerja Flutter untuk memperbarui nilai variabel _counter sekaligus menggambar ulang layar agar perubahan angka terbaru langsung terlihat oleh pengguna.

Untuk tata letak konten utamanya, aplikasi ini menyusun elemen secara vertikal menggunakan widget Column. Pada bagian atas layar, terdapat dua bidang pengisian teks (TextField) yang masing-masing dibungkus dengan widget Padding agar memiliki jarak renggang di sisi-sisinya. Kedua kolom input ini memiliki teks petunjuk placeholder berupa "Masukkan" dan "Namaaa" dengan bingkai luar berbentuk kotak. Tepat di bawah kedua input tersebut, terdapat widget Expanded yang diisi oleh Column lain di dalamnya. Kombinasi ini berfungsi untuk mengambil sisa ruang kosong yang tersedia di layar dan memosisikan teks petunjuk beserta angka penghitung (_counter) agar tampil tepat di tengah-tengah area bawah aplikasi.
