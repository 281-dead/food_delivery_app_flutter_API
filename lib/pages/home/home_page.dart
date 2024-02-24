import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hc_e_commerce_food_delivery/pages/cart/cart_history_page.dart';
import 'package:hc_e_commerce_food_delivery/pages/home/main_food_page.dart';
import 'package:hc_e_commerce_food_delivery/routes/routes_helper.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  var page = [
    MainFoodPage(),
    Container(child: Center(child: Text('Page 1'))),
    CartHistoryPage(),
    Container(child: Center(child: Text('Page 3'))),

  ];

  onTapped(int index){
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex.toString());
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
        unselectedItemColor: Colors.orangeAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const[
           BottomNavigationBarItem( label: "home",icon:Icon( Icons.home),),
           BottomNavigationBarItem(label: "delivery",icon:Icon( Icons.delivery_dining),),
          BottomNavigationBarItem(label: "history",icon:Icon( Icons.shopping_cart),),
          BottomNavigationBarItem(label: "contact",icon:Icon( Icons.person),),
        ],
      ),
    );
  }
}
