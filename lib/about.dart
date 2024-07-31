import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tentang Kami',
            style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Kami adalah restoran yang menyediakan berbagai hidangan lezat dan berkualitas tinggi. Dengan pengalaman lebih dari 18 tahun, kami terus berkomitmen untuk memberikan layanan terbaik dan pengalaman kuliner yang memuaskan.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implementasikan logika untuk tombol "Pelajari Lebih Lanjut" di sini
            },
            child: const Text('Pelajari Lebih Lanjut'),
          ),
        ],
      ),
    );
  }
}
