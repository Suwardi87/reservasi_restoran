import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/restoran.dart';
import 'reservasi_screen.dart';

class DetailRestoranScreen extends StatelessWidget {
  final Restoran restoran;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  DetailRestoranScreen({required this.restoran});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restoran.nama),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              restoran.gambar,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restoran.nama,
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    restoran.deskripsi,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lokasi: ${restoran.lokasi}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Jam Operasional: ${restoran.jamOperasional}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Menu: ${restoran.menu.join(', ')}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => ReservasiScreen(restoran: restoran),
                        ),
                      );
                    },
                    child: Text('Buat Reservasi'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
