import 'package:e_commerece_clon/sqlite_database/database_helper.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<String> _favoriteProductIds = [];
  final Map<String, dynamic> _favoriteProducts = {};

  FavoriteProvider() {
    _loadFavoritesFromDatabase();
  }

  List<String> get favoriteProductIds => _favoriteProductIds;
  List get favoriteProducts => _favoriteProducts.values.toList();

  bool isFavorite(String productId) {
    return _favoriteProductIds.contains(productId);
  }

  Future<void> addFavorite(
      String productId, Map<String, dynamic> productDetails) async {
    if (!_favoriteProductIds.contains(productId)) {
      _favoriteProductIds.add(productId);
      _favoriteProducts[productId] = productDetails;

      await DatabaseHelper().insertFavoriteItem(productId, productDetails);
      notifyListeners();
    }
  }

  Future<void> removeFavorite(String productId) async {
    if (_favoriteProductIds.contains(productId)) {
      _favoriteProductIds.remove(productId);
      _favoriteProducts.remove(productId);

      await DatabaseHelper().removeFavoriteItem(productId);
      notifyListeners();
    }
  }

  Future<void> _loadFavoritesFromDatabase() async {
    final favorites = await DatabaseHelper().getFavoriteItems();
    for (var favorite in favorites) {
      _favoriteProductIds.add(favorite['id']);
      _favoriteProducts[favorite['id']] = favorite['productDetails'];
    }
    notifyListeners();
  }
}
