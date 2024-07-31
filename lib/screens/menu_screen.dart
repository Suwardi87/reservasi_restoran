import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pizza_screen.dart';
import 'dessert_screen.dart';
import 'burger_screen.dart';
import 'salads_screen.dart';
import 'drinks_screen.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Colors.amber[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // GridView untuk kategori menu
              SizedBox(
                height: 300, // Sesuaikan tinggi sesuai kebutuhan
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: kategoriMenu.length,
                  itemBuilder: (context, index) {
                    final kategori = kategoriMenu[index];
                    return Card(
                      child: InkWell(
                        onTap: () {
                          // Navigasi ke layar kategori yang sesuai
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => kategori.layar,
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                kategori.ikon,
                                size: 40,
                                color: Colors.amber[800],
                              ),
                              SizedBox(height: 10),
                              Text(
                                kategori.nama,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Bagian untuk item unggulan
              Container(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Menu Unggulan',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    // GridView untuk item unggulan
                    GridView.builder(
                      shrinkWrap: true, // Izinkan GridView untuk menyesuaikan ukuran yang diperlukan
                      physics: NeverScrollableScrollPhysics(), // Nonaktifkan scrolling untuk GridView
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.75, // Sesuaikan sesuai preferensi Anda
                      ),
                      itemCount: itemUnggulan.length,
                      itemBuilder: (context, index) {
                        final item = itemUnggulan[index];
                        return Card(
                          elevation: 5,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => item['layar'] as Widget,
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    item['gambar'] as String,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['nama'] as String,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Rp.${(item['harga'] as double)}',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KategoriMenu {
  final String nama;
  final IconData ikon;
  final Widget layar;

  KategoriMenu({required this.nama, required this.ikon, required this.layar});
}

final List<KategoriMenu> kategoriMenu = [
  KategoriMenu(nama: 'Pizza', ikon: FontAwesomeIcons.pizzaSlice, layar: PizzaScreen()),
  KategoriMenu(nama: 'Burger', ikon: FontAwesomeIcons.hamburger, layar: BurgerScreen()),
  KategoriMenu(nama: 'Dessert', ikon: FontAwesomeIcons.iceCream, layar: DessertScreen()),
  KategoriMenu(nama: 'Salad', ikon: FontAwesomeIcons.carrot, layar: SaladsScreen()),
  KategoriMenu(nama: 'Minuman', ikon: FontAwesomeIcons.cocktail, layar: DrinksScreen()),
];

final List<Map<String, dynamic>> itemUnggulan = [
  {
    'nama': 'Pizza Margherita',
    'gambar': 'assets/images/pizza1.png',
    'harga': 135000.00, // Harga dalam Rupiah
    'layar': PizzaScreen(),
  },
  {
    'nama': 'Pizza Pepperoni',
    'gambar': 'assets/images/pizza2.png',
    'harga': 15000.00, // Harga dalam Rupiah
    'layar': PizzaScreen(),
  },
  {
    'nama': 'Cheeseburger',
    'gambar': 'assets/images/burger1.png',
    'harga': 105000.00, // Harga dalam Rupiah
    'layar': BurgerScreen(),
  },
  {
    'nama': 'Veggie Burger',
    'gambar': 'assets/images/burger2.png',
    'harga': 12000.00, // Harga dalam Rupiah
    'layar': BurgerScreen(),
  },
  {
    'nama': 'Kue Coklat',
    'gambar': 'assets/images/dessert1.png',
    'harga': 90000.00, // Harga dalam Rupiah
    'layar': DessertScreen(),
  },
  {
    'nama': 'Cheesecake',
    'gambar': 'assets/images/dessert2.png',
    'harga': 97500.00, // Harga dalam Rupiah
    'layar': DessertScreen(),
  },
  {
    'nama': 'Caesar Salad',
    'gambar': 'assets/images/salad1.png',
    'harga': 112000.00, // Harga dalam Rupiah
    'layar': SaladsScreen(),
  },
  {
    'nama': 'Greek Salad',
    'gambar': 'assets/images/salad2.png',
    'harga': 135000.00, // Harga dalam Rupiah
    'layar': SaladsScreen(),
  },
  {
    'nama': 'Lemonade',
    'gambar': 'assets/images/drink1.png',
    'harga': 60000.00, // Harga dalam Rupiah
    'layar': DrinksScreen(),
  },
  {
    'nama': 'Coke',
    'gambar': 'assets/images/drink2.png',
    'harga': 45000.00, // Harga dalam Rupiah
    'layar': DrinksScreen(),
  },
  // Tambahkan item unggulan lainnya sesuai kebutuhan
];
