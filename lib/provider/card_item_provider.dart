import 'package:e_commerece_clon/sqlite_database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:e_commerece_clon/modal/cart_item_modal.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModal> _cartItems = [];

  CartProvider() {
    _loadCartItemsFromDatabase();
  }

  List<CartItemModal> get cartItems => _cartItems;

  void addToCart(CartItemModal item) async {
    _cartItems.add(item);
    await DatabaseHelper().insertCartItem(item);
    notifyListeners();
  }

  void removeFromCart(CartItemModal item) async {
    _cartItems.remove(item);
    await DatabaseHelper().removeCartItem(item.id);
    notifyListeners();
  }

  void incrementQuantity(int index) async {
    _cartItems[index].quantity++;
    await DatabaseHelper().updateCartItemQuantity(_cartItems[index].id, _cartItems[index].quantity);
    notifyListeners();
  }

  void decrementQuantity(int index) async {
    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
      await DatabaseHelper().updateCartItemQuantity(_cartItems[index].id, _cartItems[index].quantity);
      notifyListeners();
    }
  }

  double get subtotal =>
      _cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  double get discount => subtotal * 0.20;

  double get total => subtotal - discount;

  Future<void> _loadCartItemsFromDatabase() async {
    _cartItems = await DatabaseHelper().getCartItems();
    notifyListeners();
  }
}
