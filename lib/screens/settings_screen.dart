import 'package:flutter/material.dart';
import '../login_screen.dart'; // Pastikan untuk menyesuaikan import dengan struktur folder Anda

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Profil Section
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
            subtitle: Text('Lihat dan edit profil Anda'),
            onTap: () {
              
            },
          ),
          Divider(),

          // Ganti Password Section
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Ganti Password'),
            subtitle: Text('Perbarui password Anda'),
            onTap: () {
             
            },
          ),
          Divider(),

          // Pengaturan Notifikasi Section
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifikasi'),
            subtitle: Text('Kelola preferensi notifikasi Anda'),
            onTap: () {
             
            },
          ),
          Divider(),

          // Hapus Akun Section
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Hapus Akun'),
            subtitle: Text('Hapus akun Anda secara permanen'),
            onTap: () {
              
            },
          ),
          Divider(),

          // Logout Section
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Keluar'),
            subtitle: Text('Keluar dari akun Anda'),
            onTap: () {
              // Proses logout bisa dilakukan di sini, seperti menghapus sesi atau token
              // Misalnya:
              // AuthService.logout(); // Gantilah dengan metode logout yang sesuai

              // Navigasi ke layar login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
