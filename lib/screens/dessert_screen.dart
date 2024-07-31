import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cart_screen.dart'; // Import file CartScreen yang benar
import '../cart_provider.dart'; // Import Cart singleton

class DessertScreen extends StatelessWidget {
  const DessertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Dessert'),
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
                        decoration: const BoxDecoration(
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
                    : const SizedBox.shrink(),
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
          childAspectRatio: 0.75, // Sesuaikan berdasarkan ukuran gambar
        ),
        itemCount: dessertData.length,
        itemBuilder: (context, index) {
          final dessert = dessertData[index];
          return Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DessertDetailScreen(dessert: dessert),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      dessert['image'] as String,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dessert['name'] as String,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          // ignore: unnecessary_string_escapes
                          '\Rp.${(dessert['price'] as double)}',
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

class DessertDetailScreen extends StatelessWidget {
  final Map<String, dynamic> dessert;

  const DessertDetailScreen({required this.dessert, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dessert['name'] as String),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                dessert['image'] as String,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                dessert['name'] as String,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                // ignore: unnecessary_string_escapes
                'Harga: \Rp.${(dessert['price'] as double)}',
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
              const SizedBox(height: 16),
              Text(
                dessert['description'] as String,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Cart().addItem(
                    CartItem(
                      id: dessert['name'] as String,
                      name: dessert['name'] as String,
                      price: dessert['price'] as double,
                      image: dessert['image'] as String, // Setel properti gambar
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${dessert['name']} ditambahkan ke keranjang')),
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

final dessertData = [
  {
    'name': 'Kue Coklat',
    'description': 'Kue coklat kaya dengan frosting krim.',
    'image': 'assets/images/dessert1.png',
    'price': 85000.00, // Harga dalam Rupiah
  },
  {
    'name': 'Cheesecake',
    'description': 'Cheesecake klasik dengan kerak graham cracker.',
    'image': 'assets/images/dessert2.png',
    'price': 100000.00, // Harga dalam Rupiah
  },
  {
    'name': 'Pai Apel',
    'description': 'Pai apel hangat dengan kerak renyah.',
    'image': 'assets/images/dessert3.png',
    'price': 70000.00, // Harga dalam Rupiah
  },
  {
    'name': 'Tiramisu',
    'description': 'Dessert rasa kopi dengan keju mascarpone.',
    'image': 'assets/images/dessert4.png',
    'price': 110000.00, // Harga dalam Rupiah
  },
];
