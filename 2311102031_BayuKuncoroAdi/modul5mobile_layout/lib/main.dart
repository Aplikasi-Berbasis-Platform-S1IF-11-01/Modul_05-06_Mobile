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