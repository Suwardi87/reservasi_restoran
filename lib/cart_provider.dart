class CartItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String image; // Add the image property

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image, // Include the image property
    this.quantity = 1,
  });

  CartItem copyWith({
    String? id,
    String? name,
    double? price,
    int? quantity,
    String? image, // Include the image property
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image, // Copy the image property
      quantity: quantity ?? this.quantity,
    );
  }
}

class Cart {
  Cart._privateConstructor();

  static final Cart _instance = Cart._privateConstructor();

  factory Cart() {
    return _instance;
  }

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (total, item) => total + item.quantity);

  double get totalPrice => _items.fold(0, (total, item) => total + (item.price * item.quantity));

  void addItem(CartItem item) {
    final index = _items.indexWhere((existingItem) => existingItem.id == item.id);
    if (index >= 0) {
      _items[index] = _items[index].copyWith(quantity: _items[index].quantity + item.quantity);
    } else {
      _items.add(item);
    }
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
  }

  void clear() {
    _items.clear();
  }

  void updateItem(String id, int quantity) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index] = _items[index].copyWith(quantity: quantity);
      }
    }
  }
}
