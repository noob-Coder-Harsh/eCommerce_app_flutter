import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/providers/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navbar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_)=> FavoriteProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const NavbarPage()
      ),
    );
  }
}
