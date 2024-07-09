import 'dart:async';

import 'package:e_commerece_clon/ui/desbord/bottom_bar.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
            context,

            
            MaterialPageRoute(
              builder: (context) => const BottomBarView(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Icon(
          Icons.shopping_cart_checkout,
          size: 100,
        ),
      ),
    );
  }
}
