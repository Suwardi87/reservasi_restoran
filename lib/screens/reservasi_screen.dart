import 'package:flutter/material.dart';
import '../models/restoran.dart';
import 'konfirmasi_screen.dart';

class ReservasiScreen extends StatefulWidget {
  final Restoran restoran;

  ReservasiScreen({required this.restoran});

  @override
  _ReservasiScreenState createState() => _ReservasiScreenState();
}

class _ReservasiScreenState extends State<ReservasiScreen> {
  final _formKey = GlobalKey<FormState>();
  String _nama = '';
  String _tanggal = '';
  String _waktu = '';
  int _jumlahTamu = 1;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => KonfirmasiScreen(
            restoran: widget.restoran,
            nama: _nama,
            tanggal: _tanggal,
            waktu: _waktu,
            jumlahTamu: _jumlahTamu,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Reservasi'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan nama Anda';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nama = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tanggal (YYYY-MM-DD)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan tanggal reservasi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _tanggal = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Waktu (HH:MM)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan waktu reservasi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _waktu = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Jumlah Tamu'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan jumlah tamu';
                  }
                  return null;
                },
                onSaved: (value) {
                  _jumlahTamu = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Selesai'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
