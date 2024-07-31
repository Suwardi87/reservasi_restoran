import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bantuan & Dukungan'),
        backgroundColor: Colors.amber[800],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Bagian FAQ
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Pertanyaan yang Sering Diajukan'),
            subtitle: Text('Temukan jawaban untuk pertanyaan umum'),
            onTap: () {
              // Arahkan ke halaman FAQ
            },
          ),
          Divider(),

          // Bagian Kontak Dukungan
          ListTile(
            leading: Icon(Icons.contact_support),
            title: Text('Kontak Dukungan'),
            subtitle: Text('Hubungi tim dukungan kami'),
            onTap: () {
              // Arahkan ke halaman kontak dukungan
            },
          ),
          Divider(),

          // Bagian Bantuan Umum
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Bantuan Umum'),
            subtitle: Text('Temukan panduan dan bantuan umum'),
            onTap: () {
              // Arahkan ke halaman bantuan umum
            },
          ),
        ],
      ),
    );
  }
}
