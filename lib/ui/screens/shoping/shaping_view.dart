import 'package:e_commerece_clon/ui/provider/card_item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerece_clon/utils/ui_helper.dart';
import 'package:e_commerece_clon/modal/cart_item_modal.dart';

class ShapingView extends StatelessWidget {
  const ShapingView({
    super.key,
  });

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
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, _) => Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ListView.builder(
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartProvider.cartItems[index];
                  return CartItemWidget(item: item, index: index);
                },
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
                          "${cartProvider.cartItems.length}",
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
                          "\$${cartProvider.subtotal.toStringAsFixed(2)}",
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
                          "\$${cartProvider.discount.toStringAsFixed(2)}",
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
                          "\$${cartProvider.total.toStringAsFixed(2)}",
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
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItemModal item;
  final int index;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

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
                      onTap: () => cartProvider.incrementQuantity(index),
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
                      onTap: () => cartProvider.decrementQuantity(index),
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
  }
}
