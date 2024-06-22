import 'package:flutter/material.dart';
import 'package:e_commerece_clon/modal/cart_item_modal.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModal> _cartItems = [];

  List<CartItemModal> get cartItems => _cartItems;

  double get subtotal => _cartItems.fold(
      0, (total, current) => total + current.price * current.quantity);

  double get discount => subtotal * 0.20; // Assuming a flat 20% discount

  double get total => subtotal - discount;

  void addToCart(CartItemModal item) {
    final index = _cartItems.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      _cartItems[index].quantity += item.quantity;
    } else {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeFromCart(CartItemModal item) {
    _cartItems.removeWhere((element) => element.id == item.id);
    notifyListeners();
  }

  bool isInCart(String id) {
    return _cartItems.any((element) => element.id == id);
  }

  void incrementQuantity(int index) {
    _cartItems[index].quantity++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
    }
    /* else {
      _cartItems.removeAt(index);
    } */
    /// -1 decrement quantity
    notifyListeners();
  }
}
