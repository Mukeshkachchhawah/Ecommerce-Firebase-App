import 'package:e_commerece_clon/modal/cart_item_modal.dart';
import 'package:e_commerece_clon/modal/category_modal.dart';
import 'package:e_commerece_clon/provider/card_item_provider.dart';
import 'package:e_commerece_clon/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsView extends StatefulWidget {
  final String imagePath;
  final String productName;
  final String productDesc;
  final double amount;

  const ProductDetailsView(
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
  bool isSelectedCard = false;

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 300,
                width: double.infinity,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      selectedColor.withOpacity(0.1), BlendMode.plus),
                  child: Image.network(
                    widget.imagePath,
                    fit: BoxFit.fill,
                  ),
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
            const Text(
                "kjdf kshfksd hfkdsfk djfk  dsjflkjfj dlskf jsdfdsf jdslfjldsjf dlsfj dlsfj dsdkf jldkfjldsfjldsjf lsdfj dlsjflf jlsdjf sdfjsdlfjdsljflsdjfldsfjsdlfjsdfj dslkfldskfjsldkf sdjfldskf jldjfldsjf lds fj dlsfjldsfj l"),
            hSpace(mHeight: 20),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (isSelectedCard) {
                          context.read<CartProvider>().removeFromCart(
                              CartItemModal(
                                  id: generateProductId(),
                                  name: widget.productName,
                                  description: widget.productDesc,
                                  price: widget.amount,
                                  imgPath: widget.imagePath,
                                  quantity: 1));
                          isSelectedCard = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Item removed from cart"),
                            ),
                          );
                        } else {
                          context.read<CartProvider>().addToCart(CartItemModal(
                              id: generateProductId(),
                              name: widget.productName,
                              description: widget.productDesc,
                              price: widget.amount,
                              imgPath: widget.imagePath,
                              quantity: 1));
                          isSelectedCard = true;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Item added to cart"),
                            ),
                          );
                        }
                      });
                    },
                    child: Text(
                        isSelectedCard ? "Remove from Cart" : "Add to Cart")))
          ],
        ),
      ),
    );
  }

  String generateProductId() {
    return widget.productName.hashCode.toString();
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
