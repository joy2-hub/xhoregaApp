class CartModel {
  static final CartModel _instance = CartModel._internal();

  factory CartModel() => _instance;

  CartModel._internal();

  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> book) {
    _cartItems.add(book);
  }

  void removeFromCart(Map<String, dynamic> book) {
    _cartItems.remove(book);
  }

  void clearCart() {
    _cartItems.clear();
  }

  double get totalPrice =>
      _cartItems.fold(0.0, (sum, item) => sum + (item['price'] as double));
}
