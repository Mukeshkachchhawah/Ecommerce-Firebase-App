import 'package:e_commerece_clon/ui/screens/fovirute/favorite_product_view.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.blue,
          ),
          /*  ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteProductsView(),
                  ));
            },
            leading: Icon(Icons.favorite_outline),
            title: Text("Favorite"),
          ) */
        ],
      ),
    );
  }
}
