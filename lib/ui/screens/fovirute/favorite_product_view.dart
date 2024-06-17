import 'package:e_commerece_clon/ui/provider/product_like.dart';
import 'package:e_commerece_clon/ui/screens/home/product_details_view.dart';
import 'package:e_commerece_clon/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProductsView extends StatefulWidget {
  const FavoriteProductsView({super.key});

  @override
  State<FavoriteProductsView> createState() => _FavoriteProductsViewState();
}

class _FavoriteProductsViewState extends State<FavoriteProductsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Products',
          style: textStyleFonts16(context),
        ),
        centerTitle: true,
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, child) {
          final favoriteProducts = favoriteProvider.favoriteProducts;

          if (favoriteProducts.isEmpty) {
            return Center(
                child: Text(
              'No favorite products found',
              style: textStyleFonts14(context),
            ));
          }

          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 10 / 16,
            ),
            itemCount: favoriteProducts.length,
            itemBuilder: (BuildContext context, int index) {
              var product = favoriteProducts[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsView(
                        imagePath: product['image'],
                        productName: product['name'],
                        productDesc: product['description'],
                        amount: product['amount'],
                      ),
                    ),
                  );
                },
                child: Card(
                  color: const Color(0xffffffff),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                print("product id ${product}");
                                // product dislike and remove list this product
                                favoriteProvider.removeFavorite(product['id']);
                              },
                              icon:
                                  const Icon(Icons.favorite, color: Colors.red),
                            ),
                          ],
                        ),
                        Container(
                          height: 140,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xffe6e6e6),
                            image: DecorationImage(
                              image: NetworkImage(product['image']),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        hSpace(mHeight: 10),
                        Flexible(
                          child: Text(
                            product['name'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        hSpace(mHeight: 10),
                        Row(
                          children: [
                            const Text("⭐"),
                            wSpace(mWidth: 5),
                            Text(
                              " (712 reviews)",
                              style: textStyleFonts11(context,
                                  colors: const Color(0xff9a9998)),
                            ),
                          ],
                        ),
                        hSpace(mHeight: 10),
                        Text(
                          "₹${product['amount']} /-",
                          style: textStyleFonts18(context),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
