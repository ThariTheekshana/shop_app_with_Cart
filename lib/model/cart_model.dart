import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = [
    // [ item, itemPrice, imagePath, color]
    ["Avocado", "3.53", "lib/images/avocado.png", Colors.green],
    ["Banana", "1.53", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "14.32", "lib/images/chicken.png", Colors.brown],
    ["Water", "1.23", "lib/images/water.png", Colors.blue]
  ];

  // list of cart items
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  // adding item to the cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // removing item from the cart
  void removeItemToCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
