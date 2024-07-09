import 'package:e_commerece_clon/ui/desbord/splash_view.dart';
import 'package:e_commerece_clon/provider/card_item_provider.dart';
import 'package:e_commerece_clon/provider/product_like.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider(),)
      // Add more providers as needed
    ],
    child: const MyApp(), // Your main application widget
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [
        SystemUiOverlay.top,
        SystemUiOverlay.bottom,
      ],
    );

    // Set the system navigation bar color to transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeValue? ThemeData.dark(): ThemeData.light(),
      home: const SplashView(),
    );
    },);
  }
}
