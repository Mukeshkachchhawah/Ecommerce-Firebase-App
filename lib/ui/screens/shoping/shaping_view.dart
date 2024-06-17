import 'package:e_commerece_clon/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import '../../../modal/cart_item_modal.dart';

class ShapingView extends StatefulWidget {
  final List<CartItemModal> initialItems;

  const ShapingView({super.key, required this.initialItems});

  @override
  State<ShapingView> createState() => _ShapingViewState();
}

class _ShapingViewState extends State<ShapingView> {
  late List<CartItemModal> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = widget.initialItems;
  }

  void _incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  double get _subtotal =>
      cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  double get _discount => _subtotal * 0.20;
  double get _total => _subtotal - _discount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart",
          style: textStyleFonts16(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ListView(
              children: cartItems.map((item) {
                int index = cartItems.indexOf(item);
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${item.name}",
                                maxLines: 2,
                                style: textStyleFonts16(context),
                              ),
                              hSpace(mHeight: 10),
                              Text(
                                "${item.description}",
                                maxLines: 1,
                                style: textStyleFonts14(context),
                              ),
                              hSpace(mHeight: 10),
                              Text(
                                "₹${item.price}",
                                maxLines: 1,
                                style: textStyleFonts14(context),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () => _incrementQuantity(index),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "+",
                                        style: textStyleFonts16(context),
                                      ),
                                    ),
                                  ),
                                ),
                                hSpace(mHeight: 10),
                                Text(
                                  "${item.quantity}",
                                  style: textStyleFonts18(context),
                                ),
                                hSpace(mHeight: 10),
                                GestureDetector(
                                  onTap: () => _decrementQuantity(index),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "-",
                                        style: textStyleFonts20(context),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            wSpace(),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            Card(
              child: SizedBox(
                height: 250,
                width: 400,
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        "Selected Items:",
                        style: textStyleFonts14(context,
                            colors: const Color(0xff9a9998)),
                      ),
                      trailing: Text(
                        "${cartItems.length}",
                        style: textStyleFonts16(context),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "Subtotal:",
                        style: textStyleFonts14(context,
                            colors: const Color(0xff9a9998)),
                      ),
                      trailing: Text(
                        "\$${_subtotal.toStringAsFixed(2)}",
                        style: textStyleFonts16(context),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "Discount (20%):",
                        style: textStyleFonts14(context,
                            colors: const Color(0xff9a9998)),
                      ),
                      trailing: Text(
                        "\$${_discount.toStringAsFixed(2)}",
                        style: textStyleFonts16(context),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: Text(
                        "Total:",
                        style: textStyleFonts14(context,
                            colors: const Color(0xff9a9998)),
                      ),
                      trailing: Text(
                        "\$${_total.toStringAsFixed(2)}",
                        style: textStyleFonts28(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
