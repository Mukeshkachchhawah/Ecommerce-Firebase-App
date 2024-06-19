import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerece_clon/compont/drawer.dart';
import 'package:e_commerece_clon/ui/provider/product_like.dart';
import 'package:e_commerece_clon/modal/category_modal.dart';
import 'package:e_commerece_clon/ui/screens/home/category_view.dart';
import 'package:e_commerece_clon/ui/screens/home/product_details_view.dart';
import 'package:e_commerece_clon/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          "Home",
          style: textStyleFonts16(context),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              customBanner(),
              hSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: textStyleFonts16(context),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryView(),
                            ));
                      },
                      child: Text(
                        "See All",
                        style: textStyleFonts14(context),
                      ))
                ],
              ),
              hSpace(),
              category(),
              hSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Products",
                    style: textStyleFonts16(context),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: textStyleFonts14(context),
                      ))
                ],
              ),
              productItem(),
              hSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Products",
                    style: textStyleFonts16(context),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: textStyleFonts14(context),
                      ))
                ],
              ),
              latestProducts(),
              hSpace(mHeight: 100)
            ],
          ),
        ),
      ),
    );
  }

  customBanner() {
    return Card(
      color: const Color(0xffaa14f0),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 150,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
            ),
            wSpace(),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "30% discount on all home decoration products",
                    style: textStyleFonts20(context,
                        colors: const Color(0xffffffff)),
                  ),
                  hSpace(),
                  SizedBox(
                      height: 40,
                      width: 180,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xffe4abff))),
                          onPressed: () {},
                          child: Text(
                            "Get Now",
                            style: textStyleFonts14(context,
                                colors: const Color(0xffffffff)),
                          )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  category() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: CategoryList().category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var cat = CategoryList().category[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF000001)),
                child: Center(
                    child: Text(
                  "$cat",
                  style: const TextStyle(color: Colors.white),
                ))),
          );
        },
      ),
    );
  }

  Widget productItem() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('product').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final data = snapshot.data!.docs;

        return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 10 / 18),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              var itemData = data[index];

              return Card(
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
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_outline)),
                        ],
                      ),
                      Container(
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xffe6e6e6),
                            image: DecorationImage(
                                image: NetworkImage("${itemData['image']}"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      hSpace(mHeight: 10),
                      Flexible(
                        child: Text(
                          "hfhsdkjfhsdfksdfkdsjfsdkfhsdkfhdhfdskjfh dfsdfsdfsdfdsjfdsjfhdjkfhdkjfhsdkfhdkfdfdfdfjd ${itemData["name"]}",
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
                        "₹${itemData["amount"]} /-",
                        style: textStyleFonts18(context),
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
              );
            });
      },
    );
  }

  Widget latestProducts() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('product').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final data = snapshot.data!.docs;

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              var itemData = data[index];
              String productId = itemData.id;
              bool isFavorite =
                  context.watch<FavoriteProvider>().isFavorite(productId);

              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.46,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsView(
                            imagePath: itemData['image'],
                            productName: itemData['name'],
                            productDesc: itemData['description'],
                            //  amount: itemData['amount'],
                            amount:
                                double.parse(itemData['amount'].toString())),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (isFavorite) {
                                context
                                    .read<FavoriteProvider>()
                                    .removeFavorite(productId);
                              } else {
                                context
                                    .read<FavoriteProvider>()
                                    .addFavorite(productId, {
                                  'id': productId,
                                  'name': itemData['name'],
                                  'amount': itemData['amount'],
                                  'image': itemData['image'],
                                  'description': itemData['description'],
                                });
                              }
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: isFavorite ? Colors.red : null,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  color: const Color(0xffe6e6e6),
                                  image: DecorationImage(
                                    image: NetworkImage(itemData['image']),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              hSpace(mHeight: 10),
                              Text(
                                itemData['name'],
                                maxLines: 2,
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
                                "₹${itemData['amount']} /-",
                                style: textStyleFonts18(context),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
