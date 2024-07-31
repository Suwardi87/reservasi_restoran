import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo atau ikon aplikasi
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.amber,
                  child: Text(
                    'S',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Judul layar login
                Text(
                  'Masuk ke Akun Anda.',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                // Subjudul layar login
                Text(
                  'Rasakan pengalaman menjadi sloth 4.0 sekarang.',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // TextField untuk email
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Alamat Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // TextField untuk password
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.visibility),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                // Checkbox untuk Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text('Ingat selama 30 Hari'),
                  ],
                ),
                const SizedBox(height: 20),
                // Tombol untuk login
                ElevatedButton(
                  onPressed: () {
                    // Implementasikan logika login di sini
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Masuk',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                // Tautan untuk lupa password dan daftar akun
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()),
                        );
                      },
                      // ignore: sort_child_properties_last
                      child: const Text('Daftar'),
                      style: TextButton.styleFrom(foregroundColor: Colors.amber),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Implementasikan logika lupa password di sini
                  },
                  // ignore: sort_child_properties_last
                  child: const Text('Lupa Kata Sandi'),
                  style: TextButton.styleFrom(foregroundColor: Colors.amber),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
