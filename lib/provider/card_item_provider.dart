import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerece_clon/modal/cart_item_modal.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModal> _cartItems = [];
  final CollectionReference _cartCollection =
      FirebaseFirestore.instance.collection('cart');

  List<CartItemModal> get cartItems => _cartItems;

  double get subtotal => _cartItems.fold(
      0, (total, current) => total + current.price * current.quantity);

  double get discount => subtotal * 0.20; // Assuming a flat 20% discount

  double get total => subtotal - discount;

  CartProvider() {
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    final snapshot = await _cartCollection.get();
    _cartItems = snapshot.docs
        .map((doc) => CartItemModal.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
    notifyListeners();
  }

  Future<void> addToCart(CartItemModal item) async {
    final index = _cartItems.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      _cartItems[index].quantity += item.quantity;
      await _updateCartItem(_cartItems[index]);
    } else {
      _cartItems.add(item);
      await _cartCollection.add(item.toMap());
    }
    notifyListeners();
  }

  Future<void> removeFromCart(CartItemModal item) async {
    _cartItems.removeWhere((element) => element.id == item.id);
    await _cartCollection
        .where('id', isEqualTo: item.id)
        .get()
        .then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
    notifyListeners();
  }

  bool isInCart(String id) {
    return _cartItems.any((element) => element.id == id);
  }

  Future<void> incrementQuantity(int index) async {
    _cartItems[index].quantity++;
    await _updateCartItem(_cartItems[index]);
    notifyListeners();
  }

  Future<void> decrementQuantity(int index) async {
    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
      await _updateCartItem(_cartItems[index]);
    } else {
      await removeFromCart(_cartItems[index]);
    }
    notifyListeners();
  }

  Future<void> _updateCartItem(CartItemModal item) async {
    await _cartCollection
        .where('id', isEqualTo: item.id)
        .get()
        .then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.update(item.toMap());
      }
    });
  }
}
