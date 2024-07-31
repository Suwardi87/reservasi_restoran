import 'package:flutter/material.dart';

class FruitScreen extends StatelessWidget {
  const FruitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Pizza'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Daftar pizza
          ListTile(
            title: Text('Pizza Margherita'),
            subtitle: Text('Pizza klasik dengan saus tomat dan keju'),
            leading: Icon(Icons.local_pizza),
          ),
          ListTile(
            title: Text('Pizza Pepperoni'),
            subtitle: Text('Pizza dengan pepperoni dan keju'),
            leading: Icon(Icons.local_pizza),
          ),
          // Tambahkan item tambahan sesuai kebutuhan
        ],
      ),
    );
  }
}
