class CartItemModal {
  String id;
  String name;
  String description;
  double price;
  int quantity;

  CartItemModal({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
  });

  double get totalPrice => price * quantity;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
    };
  }

  static CartItemModal fromMap(Map<String, dynamic> map) {
    return CartItemModal(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }
}
