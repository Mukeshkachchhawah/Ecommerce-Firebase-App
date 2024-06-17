import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<String> _favoriteProductIds = [];
  final Map<String, dynamic> _favoriteProducts = {};

  List<String> get favoriteProductIds => _favoriteProductIds;
  List get favoriteProducts => _favoriteProducts.values.toList();

  bool isFavorite(String productId) {
    return _favoriteProductIds.contains(productId);
  }

  void addFavorite(String productId, Map<String, dynamic> productDetails) {
    if (!_favoriteProductIds.contains(productId)) {
      _favoriteProductIds.add(productId);
      _favoriteProducts[productId] = productDetails;
      notifyListeners();
    }
  }

  void removeFavorite(String productId) {
    if (_favoriteProductIds.contains(productId)) {
      _favoriteProductIds.remove(productId);
      _favoriteProducts.remove(productId);

      print("Product Id --------------------> $productId");
      notifyListeners();
    }
  }
}
