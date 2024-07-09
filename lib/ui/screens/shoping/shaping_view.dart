import 'package:e_commerece_clon/ui/screens/shoping/shoping_view_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:e_commerece_clon/provider/card_item_provider.dart';
import 'package:e_commerece_clon/utils/ui_helper.dart';

class ShapingView extends StatelessWidget {
  const ShapingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShapingViewModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Cart",
            style: textStyleFonts16(context),
          ),
        ),
        body: Consumer2<CartProvider, ShapingViewModel>(
          builder: (context, cartProvider, viewModel, _) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartProvider.cartItems[index];
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              context.read<CartProvider>().removeFromCart(item);
                            },
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          SlidableAction(
                            onPressed: (context) {},
                            icon: Icons.share,
                            label: 'Share',
                          )
                        ],
                      ),
                      child: Card(
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
                                        onTap: () => cartProvider
                                            .incrementQuantity(index),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(100),
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
                                        onTap: () => cartProvider
                                            .decrementQuantity(index),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(100),
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
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(item.imgPath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Card(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.26,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Selected Items: ",
                                style: textStyleFonts14(context,
                                  ),
                              ),
                              Text(
                                "${cartProvider.cartItems.length}",
                                style: textStyleFonts16(context),
                              ),
                            ],
                          ),
                          hSpace(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal:",
                                style: textStyleFonts14(context,
                                    ),
                              ),
                              Text(
                                "₹ ${cartProvider.subtotal.toStringAsFixed(2)}",
                                style: textStyleFonts16(context),
                              ),
                            ],
                          ),
                          hSpace(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount (%20):",
                                style: textStyleFonts14(context,
                                  ),
                              ),
                              Text(
                                "₹ ${cartProvider.discount.toStringAsFixed(2)}",
                                style: textStyleFonts16(context),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total:",
                                style: textStyleFonts14(context,
                                 ),
                              ),
                              Text(
                                "₹ ${cartProvider.total.toStringAsFixed(2)}",
                                style: textStyleFonts20(context),
                              ),
                            ],
                          ),
                          hSpace(),
                          OutlinedButton(
                            onPressed: () => viewModel.pay(cartProvider),
                            child: const Text("Add To Cart"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
