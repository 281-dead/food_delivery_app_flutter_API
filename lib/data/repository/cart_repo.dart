
import 'dart:convert';

import 'package:hc_e_commerce_food_delivery/data/api/api_client.dart';
import 'package:hc_e_commerce_food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/cart_model.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

   void addToCartList(List<CartModel> cartList){
      cart = [];
      cartList.forEach((element) {
        return cart.add(jsonEncode(element));
      });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // print(sharedPreferences.getStringList("Cart-list"));
     getCartList();
  }

  List<CartModel> getCartList(){
     List<String> cart = [];
     if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      cart  = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print('inside getCartList' + cart.toString());

     }
     List<CartModel> cartList = [];
     cart.forEach((element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

     return cartList;
  }

}