import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/common.dart';
import 'package:food_delivery/screens/account_dart.dart';
import 'package:food_delivery/screens/favorite_page.dart';
import 'package:food_delivery/screens/home_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int selectedIndex = 0;
  void onItemTap(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  List<Widget> bodyOptions = [HomePage(), FavoritePage(), AccountPage()];
  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget? appBar;
    if (Platform.isAndroid) {
      appBar = AppBar(
        title: Text('Luqma'),
        // backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
        //elevation: 0, // اللي بيفصل بين الappbar and Scaffold
      );
    } else if (Platform.isIOS) {
      appBar = CupertinoNavigationBar(middle: Text('Luqma'));
    } else {
      appBar = null;
    }
    return SafeArea(
      child: Scaffold(
        // appBar,
        appBar: AppBar(
          title: Text('Luqma'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          //elevation: 0, // اللي بيفصل بين الappbar and Scaffold
        ),
        drawer: Drawer(),
        body: bodyOptions[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
          currentIndex: selectedIndex,
          onTap: (index) => onItemTap(index),
          selectedItemColor: context.colorScheme.primary,
        ),
      ),
    );
  }
}
