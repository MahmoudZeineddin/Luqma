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
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0, // اللي بيفصل بين الappbar and Scaffold
        ),
        dividerTheme: DividerThemeData(
          thickness: .5,
          indent: 25,
          endIndent: 25,
        ),
        fontFamily: 'OpenSans',
      ),
      home: const BottomNavBarPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
