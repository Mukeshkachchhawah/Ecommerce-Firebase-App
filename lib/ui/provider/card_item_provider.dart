import 'package:flutter/material.dart';
import 'package:e_commerece_clon/modal/cart_item_modal.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModal> _cartItems = [];

  List<CartItemModal> get cartItems => _cartItems;

  void addToCart(CartItemModal item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(CartItemModal item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void incrementQuantity(int index) {
    _cartItems[index].quantity++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
      notifyListeners();
    }
  }

  double get subtotal =>
      _cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  double get discount => subtotal * 0.20;

  double get total => subtotal - discount;
}
