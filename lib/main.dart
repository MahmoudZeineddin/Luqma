import 'package:flutter/material.dart';
import 'package:food_delivery/screens/bottom_navbar.dart';
import 'package:food_delivery/screens/food_details_page.dart';

void main() {
  // WidgetsFlutterBinding();
  // حتي يكون الخيار اللي تحت متاح لكل الأجهزة
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.portraitUp,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luqma -Food Delivery App',
      theme: ThemeData(
        useMaterial3: true,
        // primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          primary: Colors.deepOrange, // لضمان أن اللون الأساسي هو الأحمر
        ),
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

      routes: {
        '/': (context) => const BottomNavBarPage(),
        FoodDetailsPage.routeName: (context) => FoodDetailsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
