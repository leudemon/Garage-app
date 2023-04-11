import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<CartItem> _cartItems = [];
  get cartItems => _cartItems;

  int getCartItemQuantity(Item item) {
    int index =
        _cartItems.indexWhere((element) => element.item.title == item.title);
    if (index == -1) {
      return 0;
    }
    return _cartItems[index].quantity;
  }

  void addToCart(Item item) {
    int index =
        _cartItems.indexWhere((element) => element.item.title == item.title);
    if (index != -1) {
      _cartItems[index].quantity++;
      notifyListeners();
      return;
    }
    _cartItems.add(CartItem(item: item, quantity: 1));
    notifyListeners();
  }

  void removeFromCart(Item item) {
    int index =
        _cartItems.indexWhere((element) => element.item.title == item.title);
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void decreaseQuantity(Item item) {
    int index =
        _cartItems.indexWhere((element) => element.item.title == item.title);
    if (cartItems[index].quantity < 2) {
      return;
    }
    if (index != -1) {
      _cartItems[index].quantity--;
      notifyListeners();
      return;
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  String calculateTotal() {
    double total = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      total += _cartItems[i].item.price * _cartItems[i].quantity;
    }
    return total.toStringAsFixed(2);
  }
}

class Item {
  final String title;
  final String image;
  final String description;
  final int price;
  Item(
      {required this.title,
      required this.image,
      required this.description,
      required this.price});
}

class CartItem {
  // final SparePartsModel item;
  final Item item;
  int quantity;
  CartItem({required this.quantity, required this.item});
}
