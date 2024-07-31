import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/menu_screen.dart';
import 'screens/voucher_screen.dart';
import 'screens/pesanan_screen.dart';
import 'screens/akun_screen.dart';
import 'screens/pizza_screen.dart'; // Pastikan impor ini benar
import 'screens/burger_screen.dart';
import 'screens/dessert_screen.dart';
import 'screens/salads_screen.dart';
import 'screens/drinks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    const HomeContent(),
    MenuScreen(),
    VoucherScreen(),
    PesananScreen(),
    const AkunScreen(),
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
            icon: Icon(Icons.home),
            label: 'Beranda',
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
        selectedItemColor: const Color.fromARGB(255, 234, 231, 224),
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                ),
              ),
              Positioned(
                bottom: 50,
                left: 30,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            'Selamat Datang di Restaurantly',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        margin: const EdgeInsets.all(2),
                        child: const Text(
                          'Menyajikan makanan lezat selama lebih dari 18 tahun!',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuScreen()),
                          );
                        },
                        // ignore: sort_child_properties_last
                        child: const Text('Menu Kami',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Menu',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    List<IconData> icons = [
                      FontAwesomeIcons.pizzaSlice,
                      // ignore: deprecated_member_use
                      FontAwesomeIcons.hamburger,
                      FontAwesomeIcons.iceCream,
                      FontAwesomeIcons.carrot,
                      // ignore: deprecated_member_use
                      FontAwesomeIcons.cocktail
                    ];
                    List<String> labels = [
                      'Pizza',
                      'Burger',
                      'Dessert',
                      'Salad',
                      'Minuman'
                    ];
                    List<Widget> pages = [
                      const PizzaScreen(),
                      const BurgerScreen(),
                      const DessertScreen(),
                      const SaladsScreen(),
                      const DrinksScreen()
                    ];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => pages[index],
                          ),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Icon(
                                icons[index],
                                size: 50,
                                color: Colors.orange,
                              ),
                              const SizedBox(height: 10),
                              Text(labels[index]),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Promo',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
                const SizedBox(height: 20),
                Column(
                  children: List.generate(3, (index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Mengatur border radius
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.5), // Warna border
                          width: 1, // Lebar border
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Mengatur border radius yang sama
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          width: MediaQuery.of(context).size.width - 32,
                          child: Image.asset(
                            'assets/images/promo${index + 1}.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
