// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../cart_provider.dart'; // Mengimpor manajemen keranjang

// ignore: duplicate_ignore
// ignore: use_key_in_widget_constructors
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = Cart().items; // Mengambil item dari keranjang
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: cartItems.isEmpty
          // ignore: prefer_const_constructors
          ? Center(child: Text('Keranjang Anda kosong'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    leading: Image.asset(
                      item.image, // Menggunakan item.image secara langsung
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.name),
                    subtitle: Text('\$${item.price.toStringAsFixed(2)} x ${item.quantity}'),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutScreen(),
            ),
          );
        },
        child: const Icon(Icons.payment),
      ),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = Cart().items; // Mengambil item dari keranjang
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Catatan Pesanan:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: cartItems.isEmpty
                  ? const Center(child: Text('Keranjang Anda kosong'))
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          leading: Image.asset(
                            item.image, // Menggunakan item.image secara langsung
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          title: Text(item.name),
                          subtitle: Text('\$${item.price.toStringAsFixed(2)} x ${item.quantity}'),
                        );
                      },
                    ),
            ),
            ElevatedButton(
              onPressed: () {
                // Menangani proses checkout di sini
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pesanan ditempatkan!')),
                );
                Cart().clear(); // Mengosongkan keranjang setelah pesanan
              },
              child: const Text('Tempatkan Pesanan'),
            ),
          ],
        ),
      ),
    );
  }
}
