import 'package:e_commerece_clon/modal/cart_item_modal.dart';
import 'package:e_commerece_clon/ui/provider/card_item_provider.dart';
import 'package:e_commerece_clon/ui/provider/product_like.dart';
import 'package:e_commerece_clon/ui/screens/shoping/shaping_view.dart';
import 'package:e_commerece_clon/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../modal/category_modal.dart';

class ProductDetailsView extends StatefulWidget {
  final String imagePath;
  final String productName;
  final String productDesc;
  final double amount;

  ProductDetailsView(
      {super.key,
      required this.imagePath,
      required this.productName,
      required this.productDesc,
      required this.amount});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  Color selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
/*     var mData = context.watch<CartProvider>().addToCart(CartItemModal(
        name: "name", description: "description", price: 12325, quantity: 1)); */

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: textStyleFonts16(context),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 300,
                width: double.infinity,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      selectedColor.withOpacity(0.5), BlendMode.srcATop),
                  child: Image.network(widget.imagePath),
                )),
            hSpace(mHeight: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //  "dfjsd ljfsdlkfjlkj",
                        widget.productName,
                        style: textStyleFonts16(context),
                      ),
                      hSpace(),
                      Text(
                        widget.productDesc,
                        style: textStyleFonts14(context,
                            colors: const Color(0xFFDBDBD8)),
                      ),
                      hSpace(),
                      const Text("⭐⭐⭐⭐⭐"),
                    ],
                  ),
                ),
                Text(
                  "₹${widget.amount}",
                  style: textStyleFonts20(context),
                )
              ],
            ),
            hSpace(mHeight: 20),
            Text(
              "Color",
              style: textStyleFonts16(context),
            ),
            hSpace(),
            selectColor(),
            hSpace(),
            Text(
              "About",
              style: textStyleFonts16(context),
            ),
            hSpace(),
            Text(
                "kjdf kshfksd hfkdsfk djfk  dsjflkjfj dlskf jsdfdsf jdslfjldsjf dlsfj dlsfj dsdkf jldkfjldsfjldsjf lsdfj dlsjflf jlsdjf sdfjsdlfjdsljflsdjfldsfjsdlfjsdfj dslkfldskfjsldkf sdjfldskf jldjfldsjf lds fj dlsfjldsfj l"),
            hSpace(mHeight: 20),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      context.read<CartProvider>().addToCart(CartItemModal(
                          name: widget.productName,
                          description: widget.productDesc,
                          price: widget.amount,
                          //  price: double.parse(widget.amount.toString()),
                          quantity: 1));
                    },
                    child: Text("Add To Cart")))
          ],
        ),
      ),
    );
  }

  selectColor() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: ColorList().colorOptions.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Color color = ColorList().colorOptions[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedColor = color;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: color,
              ),
              width: 40,
              height: 40,
            ),
          );
        },
      ),
    );
  }
}
