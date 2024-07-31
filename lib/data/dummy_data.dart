// lib/data/dummy_data.dart
import '../models/restoran.dart';

final List<Restoran> restoranList = [
  Restoran(
    id: 'r1',
    nama: 'Restoran Padang Sederhana',
    deskripsi: 'Restoran yang menyajikan masakan khas Padang.',
    lokasi: 'Jl. Merdeka No. 1, Jakarta',
    gambar: 'assets/images/padang.jpg',
    jamOperasional: '08:00 - 22:00',
    menu: ['Rendang', 'Ayam Pop', 'Gulai Ikan', 'Sate Padang'],
  ),
  // Tambahkan lebih banyak restoran
];
