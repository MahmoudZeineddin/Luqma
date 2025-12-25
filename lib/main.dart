import 'package:flutter/material.dart';
import 'package:food_delivery/screens/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luqma -Food Delivery App',
      theme: ThemeData(primaryColor: Colors.red),
      home: const BottomNavBarPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
