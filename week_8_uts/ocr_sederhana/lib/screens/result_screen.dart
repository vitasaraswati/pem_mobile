import 'package:flutter/material.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final String ocrText;

  const ResultScreen({super.key, required this.ocrText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil OCR')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SelectableText(
            // Fungsi ocrText.replaceAll agar hasil teks ditampilkan dengan baik
            ocrText.isEmpty
                ? 'Tidak ada teks ditemukan.'
                : ocrText.replaceAll('\n', ' '),
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      // FloatingActionButton dengan ikon Icons.home
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi harus kembali langsung ke HomeScreen menggunakan pushReplacement
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        },
        child: Icon(Icons.home),
        tooltip: 'Kembali ke Home',
      ),
    );
  }
}