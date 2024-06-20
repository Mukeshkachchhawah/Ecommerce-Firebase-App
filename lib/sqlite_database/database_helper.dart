import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:e_commerece_clon/modal/cart_item_modal.dart';

class DatabaseHelper {
  // Singleton pattern का उपयोग करते हुए केवल एक instance बनाने के लिए।

  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // फैक्ट्री कंस्ट्रक्टर जो क्लास का एकल instance लौटाता है।
  factory DatabaseHelper() {
    return _instance;
  }

  // Private named constructor for the singleton pattern.
  DatabaseHelper._internal();

  // Getter to retrieve the database instance, initializing it if necessary.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Method to initialize the database.
  Future<Database> _initDatabase() async {
    final databasesPath =
        await getDatabasesPath(); // Get the path to the database directory.
    final path = join(
        databasesPath, 'app.db'); // Create the full path to the database file.

    // Open the database, creating it if it doesn't exist.

    return await openDatabase(
      path,
      version: 2, // Set the database version
      onCreate: _onCreate, // Set the callback for creating the database.
    );
  }

  // Method to create the database tables.

  void _onCreate(Database db, int version) async {
    //Table 1 :-  Create the cart_items table with columns for id, name, description, price, and quantity.

    await db.execute('''
      CREATE TABLE cart_items (
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        price REAL,
        quantity INTEGER,
        imgPath TEXT
      )
    ''');

    // Table 2 :- Create the favorite_items table with columns for id and productDetails.

    await db.execute('''
      CREATE TABLE favorite_items (
        id TEXT PRIMARY KEY,
        productDetails TEXT
      )
    ''');
  }
  // Method to insert a cart item into the cart_items table.

  Future<void> insertCartItem(CartItemModal item) async {
    final db = await database; // Get the database instance.
    await db.insert(
      'cart_items', // Specify the table.
      item.toMap(), // Convert the CartItemModal object to a map.
      conflictAlgorithm: ConflictAlgorithm
          .replace, // Handle conflicts by replacing the existing row.
    );
  }

  // Method to remove a cart item from the cart_items table by id.
  Future<void> removeCartItem(String id) async {
    final db = await database; // Get the database instance.
    await db.delete(
      'cart_items', // Specify the table.
      where: 'id = ?', // Define the WHERE clause.
      whereArgs: [id], // Provide the argument for the WHERE clause.
    );
  }

  // Method to update the quantity of a cart item in the cart_items table by id.
  Future<void> updateCartItemQuantity(String id, int quantity) async {
    final db = await database; // Get the database instance.
    await db.update(
      'cart_items', // Specify the table.
      {'quantity': quantity}, // Provide the new quantity.
      where: 'id = ?', // Define the WHERE clause.
      whereArgs: [id], // Provide the argument for the WHERE clause.
    );
  }

  // Method to retrieve all cart items from the cart_items table.
  Future<List<CartItemModal>> getCartItems() async {
    final db = await database; // Get the database instance.
    final cartItems =
        await db.query('cart_items'); // Query the cart_items table.

    // Convert the query results to a list of CartItemModal objects.
    return cartItems.map((item) {
      return CartItemModal.fromMap(item);
    }).toList();
  }

  // Method to insert a favorite item into the favorite_items table.
  Future<void> insertFavoriteItem(
      String id, Map<String, dynamic> productDetails) async {
    final db = await database; // Get the database instance.
    await db.insert(
      'favorite_items',
      {
        'id': id, // Provide the id.
        'productDetails': jsonEncode(
            productDetails), // Convert productDetails to a JSON string.
      },
      conflictAlgorithm: ConflictAlgorithm
          .replace, // Handle conflicts by replacing the existing row.
    );
  }

  // Method to remove a favorite item from the favorite_items table by id.
  Future<void> removeFavoriteItem(String id) async {
    final db = await database; // Get the database instance.
    await db.delete(
      'favorite_items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Method to retrieve all favorite items from the favorite_items table.
  Future<List<Map<String, dynamic>>> getFavoriteItems() async {
    final db = await database; // Get the database instance.
    final favoriteItems =
        await db.query('favorite_items'); // Query the favorite_items table.

    // Convert the query results to a list of maps with product details.
    return favoriteItems.map((item) {
      return {
        'id': item['id'], // Provide the id.
        'productDetails': jsonDecode(item['productDetails']
            as String), // Decode the JSON string to a map.
      };
    }).toList();
  }
}
