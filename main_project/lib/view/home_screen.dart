import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_project/controller/cart_controller.dart';
import 'package:main_project/view/cart_screen.dart';
import 'package:main_project/view/category_screen.dart';
import 'package:main_project/view/product_view.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  ScreenHomeState createState() => ScreenHomeState();
}

class ScreenHomeState extends State<ScreenHome> {
  int currentIndex = 0;

  final CartController cartController = Get.put(CartController());

  final List<Widget> _pages = [
    const ScreenProducts(),
    const ScreenCategory(),
    ScreenCart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}