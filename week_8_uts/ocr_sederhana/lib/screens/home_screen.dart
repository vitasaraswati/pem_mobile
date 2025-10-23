import 'package:flutter/material.dart';
import 'scan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Utama')),
      body: Column(
        children: [
          // ListTile dengan leading icon
          ListTile(
            leading: Icon(Icons.camera_alt, color: Colors.blue),
            title: Text('Mulai Pindai Teks Baru'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ScanScreen()),
              );
            },
          ),
          
          // Fungsi onTap untuk navigasi
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // FloatingActionButton dengan ikon Icons.home
                  FloatingActionButton(
                    onPressed: () {
                      // Navigasi kembali ke HomeScreen menggunakan pushReplacement
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    },
                    child: Icon(Icons.home),
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Tombol untuk menghapus semua halaman di atasnya dari stack navigasi
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Text('Reset Navigasi'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}