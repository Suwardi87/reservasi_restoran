import 'package:flutter/material.dart';
import '../models/restoran.dart';

class KonfirmasiScreen extends StatelessWidget {
  final Restoran restoran;
  final String nama;
  final String tanggal;
  final String waktu;
  final int jumlahTamu;

  KonfirmasiScreen({
    required this.restoran,
    required this.nama,
    required this.tanggal,
    required this.waktu,
    required this.jumlahTamu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Reservasi'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reservasi di ${restoran.nama}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Nama: $nama', style: TextStyle(fontSize: 18)),
            Text('Tanggal: $tanggal', style: TextStyle(fontSize: 18)),
            Text('Waktu: $waktu', style: TextStyle(fontSize: 18)),
            Text('Jumlah Tamu: $jumlahTamu', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika untuk menyelesaikan reservasi
              },
              child: Text('Selesai'),
            ),
          ],
        ),
      ),
    );
  }
}
