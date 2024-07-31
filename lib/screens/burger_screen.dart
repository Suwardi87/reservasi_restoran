import 'package:flutter/material.dart';
import 'cart_screen.dart'; // Mengimpor file CartScreen yang sesuai
import '../cart_provider.dart'; // Mengimpor singleton Cart

class BurgerScreen extends StatelessWidget {
  const BurgerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Burger'),
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
          childAspectRatio: 0.75, // Sesuaikan berdasarkan ukuran gambar Anda
        ),
        itemCount: burgerData.length,
        itemBuilder: (context, index) {
          final burger = burgerData[index];
          return Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BurgerDetailScreen(burger: burger),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      burger['image'] as String,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          burger['name'] as String,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          // ignore: unnecessary_string_escapes
                          '\Rp.${(burger['price'] as double)}',
                          // ignore: prefer_const_constructors
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

class BurgerDetailScreen extends StatelessWidget {
  final Map<String, dynamic> burger;

  const BurgerDetailScreen({required this.burger, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(burger['name'] as String),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                burger['image'] as String,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                burger['name'] as String,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                // ignore: unnecessary_string_escapes
                'Harga: \Rp.${(burger['price'] as double)}',
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
              const SizedBox(height: 16),
              Text(
                burger['description'] as String,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Cart().addItem(
                    CartItem(
                      id: burger['name'] as String,
                      name: burger['name'] as String,
                      price: burger['price'] as double,
                      image: burger['image'] as String, // Menetapkan properti gambar
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${burger['name']} ditambahkan ke keranjang')),
                  );
                },
                // ignore: prefer_const_constructors
                child: Text('Tambah ke Keranjang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final burgerData = [
  {
    'name': 'Cheeseburger',
    'description': 'Cheeseburger klasik dengan selada, tomat, dan acar.',
    'image': 'assets/images/burger1.png',
    'price': 85000.00, // Harga dalam Rupiah
  },
  {
    'name': 'Bacon Burger',
    'description': 'Burger lezat dengan bacon renyah dan keju cheddar.',
    'image': 'assets/images/burger2.png',
    'price': 100000.00, // Harga dalam Rupiah
  },
];
