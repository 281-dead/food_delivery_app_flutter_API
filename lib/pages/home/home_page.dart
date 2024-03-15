import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/pages/account/account_page.dart';
import 'package:hc_e_commerce_food_delivery/pages/auth/sign_in_page.dart';
import 'package:hc_e_commerce_food_delivery/pages/auth/sign_up_page.dart';
import 'package:hc_e_commerce_food_delivery/pages/cart/cart_history_page.dart';
import 'package:hc_e_commerce_food_delivery/pages/home/main_food_page.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  var page = [
    const MainFoodPage(),
    const Center(child: Text("History page")),
    const CartHistoryPage(),
    const AccountPage(),
  ];

  onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            label: "home",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "delivery",
            icon: Icon(Icons.delivery_dining_outlined),
          ),
          BottomNavigationBarItem(
            label: "history",
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: "contact",
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
