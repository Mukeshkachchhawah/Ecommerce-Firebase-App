class CartItemModal {
  String id;
  String name;
  String description;
  double price;
  String imgPath;
  int quantity;

  CartItemModal({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imgPath,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imgPath': imgPath,
      'quantity': quantity,
    };
  }

  factory CartItemModal.fromMap(Map<String, dynamic> map) {
    return CartItemModal(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      imgPath: map['imgPath'],
      quantity: map['quantity'],
    );
  }
}
