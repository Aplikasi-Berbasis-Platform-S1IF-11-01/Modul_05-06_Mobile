<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3>MODUL 05-06 - Mobile <br> Flutter  </h3>
  <br />
  <img src="assets\logo.jpeg" alt="Logo" width="300"> 
  <br />
  <br />
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Raihan Ramadhan</strong><br>
    <strong>2311102040</strong><br>
    <strong>IF-11-REG01</strong>
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


## Laporan Praktikum: Aplikasi Flutter "Talkyu"



## 1. Dasar Teori

### 1.1 Flutter

Flutter adalah framework open-source buatan Google untuk membangun aplikasi mobile, web, dan desktop dari satu basis kode (codebase). Flutter menggunakan bahasa pemrograman **Dart** dan mengandalkan konsep **widget** sebagai unit dasar pembangunan antarmuka pengguna (UI).

### 1.2 Dart

Dart adalah bahasa pemrograman berorientasi objek yang dikembangkan oleh Google. Dart bersifat strongly typed, mendukung null safety, dan dirancang untuk performa tinggi. Dalam Flutter, seluruh logika aplikasi dan definisi UI ditulis menggunakan Dart.

### 1.3 Widget

Dalam Flutter, **semua elemen UI adalah widget**. Widget bersifat immutable (tidak dapat diubah langsung) dan disusun secara hierarki membentuk sebuah **widget tree**. Terdapat dua jenis widget utama:

| Jenis Widget | Keterangan |
|---|---|
| `StatelessWidget` | Widget yang tidak memiliki state yang berubah. Tampilannya bersifat statis. |
| `StatefulWidget` | Widget yang memiliki state internal yang dapat berubah, sehingga UI dapat diperbarui secara dinamis menggunakan `setState()`. |

### 1.4 Widget-Widget yang Digunakan

#### `MaterialApp`
Widget root yang menyediakan berbagai fitur Material Design seperti routing, tema, dan lokalisasi. Setiap aplikasi Flutter berbasis Material biasanya dimulai dengan widget ini.

#### `ThemeData`
Kelas yang digunakan untuk mendefinisikan tema visual aplikasi secara global, mencakup warna, tipografi, dan gaya komponen. `ColorScheme.fromSeed()` digunakan untuk menghasilkan palet warna secara otomatis berdasarkan warna seed yang diberikan.

#### `Scaffold`
Widget yang menyediakan struktur dasar halaman Material Design, termasuk `AppBar`, `body`, `floatingActionButton`, `drawer`, dan sebagainya.

#### `Column`
Widget layout yang menyusun widget-widget anaknya secara vertikal (dari atas ke bawah). Properti `crossAxisAlignment` digunakan untuk mengatur perataan horizontal dari widget-widget di dalamnya.

#### `Padding`
Widget yang menambahkan jarak (ruang kosong) di sekeliling widget anaknya. Jarak ditentukan menggunakan `EdgeInsets`.

#### `TextField`
Widget input teks yang memungkinkan pengguna mengetikkan teks. Dapat dikustomisasi menggunakan properti `decoration` bertipe `InputDecoration`.

#### `InputDecoration`
Kelas yang digunakan untuk mendekorasi tampilan `TextField`, seperti menambahkan label, hint text, ikon, dan border.

#### `OutlineInputBorder`
Salah satu jenis border pada `TextField` yang menampilkan garis tepi mengelilingi seluruh area input (berbentuk kotak).

---
## 2. Hasil
<img src="assets\hasil.jpeg" alt="Hasil" width="500"> 

## 3. Penjelasan Kode

### 3.1 Fungsi `main()`

```dart
void main() {
  runApp(const MyApp());
}
```

Fungsi `main()` adalah titik masuk (entry point) dari setiap aplikasi Dart/Flutter. Fungsi `runApp()` menerima sebuah widget dan menjadikannya sebagai root dari widget tree, lalu me-render-nya ke layar.

---

### 3.2 Class `MyApp`

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talkyu',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Talkyu'),
    );
  }
}
```

`MyApp` merupakan widget root aplikasi yang merupakan turunan dari `StatelessWidget` karena tidak membutuhkan state yang berubah. Di dalamnya dikonfigurasi:

- `title`: judul aplikasi yang tampil di task switcher sistem operasi.
- `theme`: tema visual menggunakan warna seed `deepPurple` untuk menghasilkan color scheme secara otomatis.
- `home`: halaman utama yang ditampilkan saat aplikasi dibuka, yaitu `MyHomePage`.

---

### 3.3 Class `MyHomePage`

```dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
```

`MyHomePage` adalah `StatefulWidget` yang menerima parameter `title` bertipe `String`. Method `createState()` mengembalikan instance dari `_MyHomePageState` yang akan mengelola state widget ini.

---

### 3.4 Class `_MyHomePageState`

```dart
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan teks',
                border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan teks 2',
                border: OutlineInputBorder()
              ),
            ),
          )
        ],
      ),
    );
  }
}
```

Kelas ini merupakan State dari `MyHomePage` yang membangun tampilan UI melalui method `build()`. Berikut penjelasan tiap bagian:

| Bagian | Penjelasan |
|---|---|
| `Scaffold` | Menyediakan struktur halaman. Pada kode ini hanya properti `body` yang digunakan. |
| `Column` | Menyusun dua `TextField` secara vertikal. `crossAxisAlignment: CrossAxisAlignment.end` membuat elemen-elemen di dalamnya rata ke kanan. |
| `Padding` (pertama) | Membungkus `TextField` pertama dengan padding vertikal 5 px dan horizontal 5 px. |
| `TextField` (pertama) | Input teks dengan hint `'Masukkan teks'` dan border kotak (`OutlineInputBorder`). |
| `Padding` (kedua) | Membungkus `TextField` kedua dengan padding vertikal 6 px dan horizontal 8 px. |
| `TextField` (kedua) | Input teks dengan hint `'Masukkan teks 2'` dan border kotak (`OutlineInputBorder`). |

---

## 3. Struktur Widget Tree

```
MyApp
└── MaterialApp
    └── MyHomePage (StatefulWidget)
        └── Scaffold
            └── body: Column
                ├── Padding
                │   └── TextField ("Masukkan teks")
                └── Padding
                    └── TextField ("Masukkan teks 2")
```

---

## 4. Kesimpulan

Kode di atas membangun aplikasi Flutter sederhana bernama **Talkyu** yang menampilkan dua buah `TextField` yang tersusun secara vertikal di dalam sebuah `Column`. Setiap `TextField` dibungkus dengan `Padding` untuk memberikan jarak antar elemen. Aplikasi ini memanfaatkan tema Material Design dengan warna berbasis `deepPurple` dan menggunakan `StatefulWidget` sebagai halaman utama, yang memungkinkan penambahan logika interaktif di masa mendatang.
