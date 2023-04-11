import 'package:flutter/material.dart';
import 'package:ikirengaauto/model/container_model.dart';

class UsedCarsCartModel extends ChangeNotifier {
  final List<CartItem> _cartItems = [];
  get cartItems => _cartItems;

  int getCartItemQuantity(UsedCarsModel item) {
    int index =
        _cartItems.indexWhere((element) => element.item.title == item.title);
    if (index == -1) {
      return 0;
    }
    return _cartItems[index].quantity;
  }

  void addToCart(UsedCarsModel item) {
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

  void removeFromCart(UsedCarsModel item) {
    int index =
        _cartItems.indexWhere((element) => element.item.title == item.title);
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void decreaseQuantity(UsedCarsModel item) {
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

class CartItem {
  final UsedCarsModel item;
  int quantity;
  CartItem({required this.item, required this.quantity});
}
