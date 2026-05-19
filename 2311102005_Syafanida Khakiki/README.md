<div align="center">

# LAPORAN PRAKTIKUM
## APLIKASI BERBASIS PLATFORM

### MODUL 5 & 6 — MOBILE

<br>

<img src="aset/logo.png" width="150">

<br>

**Disusun oleh:**
**Syafanida Khakiki — 2311102005**

**Kelas:** PS1IF-11-REG01
**Dosen:** Dimas Fanny Hebrasianto Permadi, S.ST., M.Kom

---

**PROGRAM STUDI S1 TEKNIK INFORMATIKA**
**FAKULTAS INFORMATIKA**
**UNIVERSITAS TELKOM PURWOKERTO**
**2026**

</div>

---

## Daftar Isi

1. [Dasar Teori](#1-dasar-teori)
2. [Hasil Praktikum](#2-hasil-praktikum)
3. [Penjelasan Widget](#3-penjelasan-widget-yang-digunakan)
4. [Kesimpulan](#4-kesimpulan)

---

## 1. Dasar Teori

Flutter menyediakan berbagai widget input dan state management sederhana untuk membangun antarmuka interaktif. Pada praktikum modul 5 dan 6, fokus utama adalah penggunaan `TextField`, `TextEditingController`, pengelolaan state dengan `StatefulWidget`, serta penerapan desain modern menggunakan Material Design 3.

### TextField

`TextField` merupakan widget input pada Flutter yang digunakan untuk menerima data dari pengguna seperti email, password, pencarian, dan teks lainnya.

| Properti | Fungsi |
|---|---|
| `controller` | Mengontrol dan mengambil isi teks dari input |
| `keyboardType` | Menentukan jenis keyboard yang muncul |
| `obscureText` | Menyembunyikan teks, biasanya untuk password |
| `decoration` | Mengatur tampilan TextField |
| `style` | Mengatur style teks input |

### TextEditingController

`TextEditingController` digunakan untuk mengontrol isi dari `TextField`. Controller memungkinkan program membaca, mengubah, maupun menghapus isi input.

```dart
final TextEditingController _emailController = TextEditingController();
```

Controller perlu dibersihkan menggunakan `dispose()` agar tidak terjadi memory leak:

```dart
@override
void dispose() {
  _emailController.dispose();
  super.dispose();
}
```

### StatefulWidget

`StatefulWidget` digunakan ketika tampilan aplikasi memiliki data yang dapat berubah secara dinamis selama aplikasi berjalan.

Pada praktikum ini, `StatefulWidget` digunakan untuk:
- Mengubah icon visibility password
- Mengatur status `obscureText`
- Mengelola perubahan state menggunakan `setState()`

### Material Design 3

Flutter mendukung Material Design 3 melalui properti `useMaterial3: true`, yang memberikan:
- Tampilan modern dan clean
- Dynamic color system
- Rounded component
- UI yang lebih responsif

### InputDecoration

`InputDecoration` digunakan untuk mempercantik tampilan `TextField` dengan komponen seperti `labelText`, `hintText`, `prefixIcon`, `suffixIcon`, `filled`, dan `border`.

---

## 2. Hasil Praktikum

### Deskripsi Aplikasi

Aplikasi yang dibuat bernama **Findemy**, yaitu tampilan halaman login modern bertema dark mode dengan desain clean dan futuristik. Aplikasi menggunakan dua buah `TextField` (input email dan password), lengkap dengan icon, efek focus border, serta fitur show/hide password.

**Tema warna utama:**
- Hijau tosca — `#00C9A7`
- Biru — `#0077FF`
- Dark navy background — `#0A0E1A`

---

### Langkah-Langkah Pembuatan

#### 1. Membuat Project Flutter

```bash
flutter create findemy
cd findemy
```

#### 2. Membuka File `main.dart`

Buka file `lib/main.dart`, lalu hapus seluruh kode default Flutter.

#### 3. Menambahkan Kode Program

Tambahkan kode berikut pada `main.dart`:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Findemy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00C9A7),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Findemy'),
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            // Hero Section
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 40, 28, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF00C9A7), Color(0xFF0077FF)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.lock_open_rounded,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Selamat\nDatang Kembali',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                        letterSpacing: -0.8,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Masuk ke akun Findemy kamu',
                      style: TextStyle(color: Colors.white38, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 36),

            // TextField Email
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Masukkan teks',
                  hintStyle: const TextStyle(color: Colors.white30),
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Color(0xFF00C9A7)),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xFF00C9A7),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF141929),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            // TextField Password
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Masukkan teks 2',
                  hintStyle: const TextStyle(color: Colors.white30),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Color(0xFF0077FF)),
                  prefixIcon: const Icon(
                    Icons.key_rounded,
                    color: Color(0xFF0077FF),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.white30,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: const Color(0xFF141929),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

#### 4. Menjalankan Program

```bash
# Di browser Chrome
flutter run -d chrome

# Di emulator Android
flutter run
```

---

### Output

<div align="center">

<img src="aset/output.png" width="800">

</div>

---

## 3. Penjelasan Widget yang Digunakan

### 3.1 MaterialApp

`MaterialApp` merupakan root widget utama pada Flutter yang mengatur tema, title aplikasi, routing, dan konfigurasi Material Design.

```dart
MaterialApp(
  title: 'Findemy',
  debugShowCheckedModeBanner: false,
)
```

### 3.2 Scaffold

`Scaffold` digunakan sebagai struktur dasar tampilan aplikasi Material Design, menyediakan `body`, `backgroundColor`, dan layout utama.

```dart
Scaffold(
  backgroundColor: const Color(0xFF0A0E1A),
)
```

### 3.3 StatefulWidget

`StatefulWidget` digunakan karena aplikasi memiliki state yang berubah, yaitu status tampil/sembunyikan password.

```dart
class MyHomePage extends StatefulWidget { ... }

// Perubahan state:
setState(() {
  _obscurePassword = !_obscurePassword;
});
```

### 3.4 TextField

`TextField` digunakan untuk menerima input dari pengguna.

```dart
// Email
TextField(
  controller: _emailController,
  keyboardType: TextInputType.emailAddress,
)

// Password
TextField(
  controller: _passwordController,
  obscureText: _obscurePassword,
)
```

### 3.5 TextEditingController

Controller digunakan untuk mengontrol isi `TextField` dan dibersihkan menggunakan `dispose()` untuk menghindari memory leak.

```dart
final TextEditingController _emailController = TextEditingController();
```

### 3.6 InputDecoration

`InputDecoration` mengatur tampilan `TextField` seperti label, hint, icon, border, dan warna.

```dart
decoration: InputDecoration(
  labelText: 'Email',
  prefixIcon: Icon(Icons.email_outlined),
)
```

### 3.7 IconButton

`IconButton` digunakan sebagai tombol show/hide password di dalam `suffixIcon`.

```dart
suffixIcon: IconButton(
  icon: Icon(Icons.visibility_outlined),
  onPressed: () { ... },
)
```

---

## 4. Kesimpulan

Pada praktikum modul 5 dan 6, telah berhasil dibuat aplikasi login modern bernama **Findemy** menggunakan Flutter dan Dart. Praktikum ini mencakup penggunaan `TextField`, `TextEditingController`, `StatefulWidget`, `InputDecoration`, serta pengelolaan state dengan `setState()`.

Aplikasi juga menerapkan konsep UI modern menggunakan Material Design 3 dengan dark mode dan kombinasi warna futuristik, sehingga tampilan menjadi lebih menarik dan interaktif.
