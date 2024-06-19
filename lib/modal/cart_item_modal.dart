class CartItemModal {
  String name;
  String description;
  double price;
  int quantity;

  CartItemModal({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
  });

  double get totalPrice => price * quantity;
}
