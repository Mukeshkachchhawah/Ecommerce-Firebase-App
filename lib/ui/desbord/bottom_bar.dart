import 'package:e_commerece_clon/ui/screens/profile/notification.dart';
import 'package:e_commerece_clon/ui/screens/fovirute/favorite_product_view.dart';
import 'package:e_commerece_clon/ui/screens/home/home_page_view.dart';
import 'package:e_commerece_clon/ui/screens/shoping/shaping_view.dart';
import 'package:e_commerece_clon/ui/screens/profile/user_profile_view.dart';
import 'package:flutter/material.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  var _myIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePageView(),
      const FavoriteProductsView(),
      const ShapingView(),
      const UserProfileView()
    ];
    return Scaffold(
      //   backgroundColor: Colors.blue,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Fixed
          //  showSelectedLabels: false,
          backgroundColor: Colors.white,
          currentIndex: _myIndex,
          selectedItemColor: const Color(0xffaa14f0),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedIconTheme: const IconThemeData(color: Color(0xffa8a7a6)),
          onTap: (index) {
            setState(() {
              _myIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            // add bottom bar

            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_outline,
                ),
                label: "Notification"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: "shaping"),

            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Person"),
          ]),
      body: pages[_myIndex],
    );
  }
}
