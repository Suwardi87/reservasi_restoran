import 'package:flutter/material.dart';
import '../cart_provider.dart'; // Impor singleton Cart

class PesananScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Cart(); // Akses singleton Cart

    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan'),
        backgroundColor: Colors.amber[800],
      ),
      body: cart.items.isEmpty
          ? Center(child: Text('Belum ada pesanan.'))
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final cartItem = cart.items[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    title: Text(
                      '${cartItem.name} (x${cartItem.quantity})',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text('\$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}'),
                  ),
                );
              },
            ),
    );
  }
}
