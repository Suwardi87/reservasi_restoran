import 'package:flutter/material.dart';
import 'cart_screen.dart'; // Import file CartScreen yang benar
import '../cart_provider.dart'; // Import singleton Cart

class SaladsScreen extends StatelessWidget {
  const SaladsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Salad'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
              ),
              Positioned(
                right: 0,
                child: Cart().items.isNotEmpty
                    ? Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          maxWidth: 20,
                          maxHeight: 20,
                        ),
                        child: Center(
                          child: Text(
                            '${Cart().itemCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah item per baris
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75, // Sesuaikan dengan ukuran gambar
        ),
        itemCount: saladData.length,
        itemBuilder: (context, index) {
          final salad = saladData[index];
          return Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SaladDetailScreen(salad: salad),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      salad['image'] as String,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          salad['name'] as String,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\Rp.${(salad['price'] as double)}',
                          style: const TextStyle(fontSize: 14, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SaladDetailScreen extends StatelessWidget {
  final Map<String, dynamic> salad;

  const SaladDetailScreen({required this.salad, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(salad['name'] as String),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                salad['image'] as String,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                salad['name'] as String,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Harga: \Rp.${(salad['price'] as double)}',
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
              const SizedBox(height: 16),
              Text(
                salad['description'] as String,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Cart().addItem(
                    CartItem(
                      id: salad['name'] as String,
                      name: salad['name'] as String,
                      price: salad['price'] as double,
                      image: salad['image'] as String, // Menetapkan properti gambar
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${salad['name']} telah ditambahkan ke keranjang')),
                  );
                },
                child: const Text('Tambahkan ke Keranjang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final saladData = [
  {
    'name': 'Caesar Salad',
    'description': 'Romaine renyah dengan saus Caesar, crouton, dan keju Parmesan.',
    'image': 'assets/images/salad1.png',
    'price': 100000.00, // Harga dalam Rupiah
  },
  {
    'name': 'Greek Salad',
    'description': 'Campuran sayuran segar dengan keju feta dan zaitun.',
    'image': 'assets/images/salad2.png',
    'price': 115000.00, // Harga dalam Rupiah
  },
];
