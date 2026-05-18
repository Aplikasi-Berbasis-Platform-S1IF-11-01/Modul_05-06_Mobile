/*
 * LAPORAN PRAKTIKUM MODUL 5 & 6: FONT & TEXTFIELD
 * Nama : Satrio Wibowo
 * NIM  : 2311102149
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
      title: 'Bang Sat',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C3CE1)),
        useMaterial3: true,
        
        scaffoldBackgroundColor: const Color(0xFFF4F6FF),
      ),
      home: const MyHomePage(title: 'Bang Sat'),

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
  // Controller untuk menangkap dan memanipulasi input teks dari pengguna
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ─── HERO HEADER dengan Gradien ───────────────────────────────
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6C3CE1), Color(0xFF9D5CF6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              // Sudut bawah container dibuat melengkung untuk efek modern
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Baris judul aplikasi dan ikon notifikasi
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Bang Sat',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            // Efek frosted-glass pada tombol notifikasi
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // Baris avatar dan salam pengguna
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white.withOpacity(0.25),
                          child: const Icon(
                            Icons.person_rounded,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo, Satrio! 👋',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Kirim pesanmu sekarang.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ─── AREA FORM ────────────────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 28,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sub-judul seksi form
                    const Text(
                      'Pesan Baru',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Isi formulir di bawah untuk mengirim pesanmu.',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    const SizedBox(height: 28),

                    // ── Input 1: Nama ──────────────────────────────────
                    _buildInputLabel('Nama'),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Masukkan nama',
                        // Ikon ungu senada tema di sisi kiri kolom input
                        prefixIcon: const Icon(
                          Icons.person_outline_rounded,
                          color: Color(0xFF6C3CE1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        // Garis tepi default: abu tipis dengan sudut melengkung
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                            width: 1.5,
                          ),
                        ),
                        // Garis tepi saat aktif: ungu tebal sebagai visual feedback
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Color(0xFF6C3CE1),
                            width: 2,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 18),
                      ),
                    ),
                    const SizedBox(height: 22),

                    // ── Input 2: Pesan (multi-baris) ───────────────────
                    _buildInputLabel('Pesan'),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _messageController,
                      // Memungkinkan pengguna menulis beberapa baris sekaligus
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Ketik pesanmu di sini...',
                        prefixIcon: const Padding(
                          // Ikon disesuaikan agar sejajar baris pertama teks
                          padding: EdgeInsets.only(bottom: 60),
                          child: Icon(
                            Icons.chat_bubble_outline_rounded,
                            color: Color(0xFF6C3CE1),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Color(0xFF6C3CE1),
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),

                    // ── Tombol Submit dengan Gradien ───────────────────
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          // Gradien ungu horizontal pada permukaan tombol
                          gradient: const LinearGradient(
                            colors: [Color(0xFF6C3CE1), Color(0xFF9D5CF6)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          // Bayangan ungu transparan untuk efek melayang (elevated)
                          boxShadow: [
                            BoxShadow(
                              color:
                                  const Color(0xFF6C3CE1).withOpacity(0.45),
                              blurRadius: 14,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            // Latar transparan agar gradien di DecoratedBox tampak
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            // Placeholder aksi pengiriman pesan
                          },
                          icon: const Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Kirim Pesan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method untuk membuat label konsisten di atas setiap TextField
  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1A1A2E),
      ),
    );
  }
}