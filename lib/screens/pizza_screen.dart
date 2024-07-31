import 'package:flutter/material.dart';
import 'cart_screen.dart'; // Impor file CartScreen yang benar
import '../cart_provider.dart'; // Impor singleton Cart
import 'menu_screen.dart';
import 'voucher_screen.dart';
import 'pesanan_screen.dart';
import 'akun_screen.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({super.key});

  @override
  _PizzaScreenState createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    PizzaScreenContent(),
    MenuScreen(),
    VoucherScreen(),
    PesananScreen(),
    AkunScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.local_pizza),
            label: 'Pizza',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Voucher',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PizzaScreenContent extends StatelessWidget {
  const PizzaScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Pizza'),
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
          childAspectRatio: 0.75, // Sesuaikan dengan ukuran gambar Anda
        ),
        itemCount: pizzaData.length,
        itemBuilder: (context, index) {
          final pizza = pizzaData[index];
          return Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PizzaDetailScreen(pizza: pizza),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      pizza['image'] as String,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pizza['name'] as String,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\Rp.${(pizza['price'] as double)}',
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

class PizzaDetailScreen extends StatelessWidget {
  final Map<String, dynamic> pizza;

  const PizzaDetailScreen({required this.pizza, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pizza['name'] as String),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                pizza['image'] as String,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                pizza['name'] as String,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Harga: \Rp.${(pizza['price'] as double)}',
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
              const SizedBox(height: 16),
              Text(
                pizza['description'] as String,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Cart().addItem(
                    CartItem(
                      id: pizza['name'] as String,
                      name: pizza['name'] as String,
                      price: pizza['price'] as double,
                      image: pizza['image'] as String, // Setel properti gambar
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${pizza['name']} ditambahkan ke keranjang')),
                  );
                },
                child: Text('Tambahkan ke Keranjang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final pizzaData = [
  {
    'name': 'Pizza Margherita',
    'description': 'Pizza klasik dengan saus tomat, keju mozzarella, dan basil segar.',
    'image': 'assets/images/pizza1.png', // Pastikan ini adalah path yang valid
    'price': 120000.00, // Harga dalam Rupiah
  },
  {
    'name': 'Pizza Pepperoni',
    'description': 'Pepperoni pedas dengan keju mozzarella dan saus tomat.',
    'image': 'assets/images/pizza2.png', // Pastikan ini adalah path yang valid
    'price': 130000.00, // Harga dalam Rupiah
  },
  {
    'name': 'Pizza BBQ Chicken',
    'description': 'Saus BBQ, ayam, bawang, dan keju mozzarella.',
    'image': 'assets/images/pizza3.png', // Pastikan ini adalah path yang valid
    'price': 140000.00, // Harga dalam Rupiah
  },
  {
    'name': 'Pizza Sayuran',
    'description': 'Dipenuhi dengan sayuran seperti paprika, jamur, dan zaitun.',
    'image': 'assets/images/pizza4.png', // Pastikan ini adalah path yang valid
    'price': 135000.00, // Harga dalam Rupiah
  },
];

