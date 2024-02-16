import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/controller/cart_controller.dart';
import 'package:hc_e_commerce_food_delivery/data/repository/popular_product_repo.dart';
import 'package:hc_e_commerce_food_delivery/model/cart_model.dart';
import 'package:hc_e_commerce_food_delivery/model/products_model.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  late CartController _cart;
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  int _quantity = 0;

  int get quantity => _quantity;

  int _inCartItem = 0;

  int get inCartItem => _inCartItem + _quantity;

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Products.fromJson(response.body).products);
      _isLoaded = true;
      update(); // like this setState
    } else {
      print("error");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      //print("increment: " + _quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
      //print("decrement: " + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItem + quantity) < 0) {
      Get.snackbar("Item Count", "You can't reduce more!",
          backgroundColor: AppColors.mainColor, colorText: Color(0xFFFFFFFF));
      if(_inCartItem > 0){
        _quantity = -_inCartItem;
        return _quantity;
     }
      return 0;
    } else if ((_inCartItem + quantity) > 15) {
      Get.snackbar("Item Count", "You can't add more!",
          backgroundColor: AppColors.mainColor, colorText: Color(0xFFFFFFFF));
      return 15;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductsModel product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
    var isExist = false;
    isExist = cart.existInCart(product);
    if (isExist) {
      _inCartItem = cart.getQuantity(product);
    }
    print('In cart item : ' + _inCartItem.toString());
  }

  void addItem(ProductsModel product) {
    _cart.addItem(_quantity, product);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("this id product: " +
          value.id.toString() +
          " and quantity: " +
          value.quantity.toString());
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }
}
