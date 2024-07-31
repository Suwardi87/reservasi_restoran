import 'package:flutter/material.dart';
import 'cart_screen.dart'; // Import file CartScreen yang benar
import '../cart_provider.dart'; // Import singleton Cart

class DrinksScreen extends StatelessWidget {
  const DrinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Minuman'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
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
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 20,
                          maxHeight: 20,
                        ),
                        child: Center(
                          child: Text(
                            '${Cart().itemCount}',
                            style: TextStyle(
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah item per baris
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75, // Sesuaikan berdasarkan ukuran gambar
        ),
        itemCount: drinkData.length,
        itemBuilder: (context, index) {
          final drink = drinkData[index];
          return Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DrinkDetailScreen(drink: drink),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      drink['image'] as String,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          drink['name'] as String,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\Rp.${(drink['price'] as double)}',
                          style: TextStyle(fontSize: 14, color: Colors.red),
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

class DrinkDetailScreen extends StatelessWidget {
  final Map<String, dynamic> drink;

  const DrinkDetailScreen({required this.drink, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drink['name'] as String),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                drink['image'] as String,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                drink['name'] as String,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Harga: \Rp.${(drink['price'] as double)}',
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
              const SizedBox(height: 16),
              Text(
                drink['description'] as String,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Cart().addItem(
                    CartItem(
                      id: drink['name'] as String,
                      name: drink['name'] as String,
                      price: drink['price'] as double,
                      image: drink['image'] as String, // Setel properti gambar
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${drink['name']} ditambahkan ke keranjang')),
                  );
                },
                child: Text('Tambah ke Keranjang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final drinkData = [
  {
    'name': 'Coca Cola',
    'description': 'Minuman Coca Cola klasik.',
    'image': 'assets/images/drink1.png',
    'price': 30000.00, // Harga dalam Rupiah
  },
  {
    'name': 'Jus Jeruk',
    'description': 'Jus jeruk segar yang baru diperas.',
    'image': 'assets/images/drink2.png',
    'price': 45000.00, // Harga dalam Rupiah
  },
];
