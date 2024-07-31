import 'package:flutter/material.dart';

class VoucherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voucher'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: vouchers.length,
          itemBuilder: (context, index) {
            final voucher = vouchers[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  voucher.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(voucher.description),
                trailing: Text(
                  '${voucher.discount} diskon',
                  style: TextStyle(color: Colors.amber),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Voucher {
  final String title;
  final String description;
  final String discount;

  Voucher({required this.title, required this.description, required this.discount});
}

final List<Voucher> vouchers = [
  Voucher(title: 'Diskon 10% Pizza', description: 'Dapatkan diskon 10% untuk semua pizza!', discount: '10%'),
  Voucher(title: 'Dessert Gratis', description: 'Dessert gratis dengan pembelian hidangan utama!', discount: 'Gratis'),
  Voucher(title: 'Beli 1 Gratis 1', description: 'Beli 1 burger dan dapatkan 1 gratis!', discount: 'Beli 1 Gratis 1'),
];
