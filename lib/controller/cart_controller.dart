import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/data/repository/cart_repo.dart';
import 'package:hc_e_commerce_food_delivery/model/cart_model.dart';
import 'package:hc_e_commerce_food_delivery/model/products_model.dart';

import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  //get item in cart
  List<CartModel> get getCartItem {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

//total item in cart
  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  //add item to cart
  void addItem(int quantity, ProductsModel product) {
    var totalQuantity = 0;
    if (items.containsKey(product.id)) {
      items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          quantity: value.quantity! + quantity,
          img: value.img,
          isExit: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            quantity: quantity,
            img: product.img,
            isExit: true,
            time: DateTime.now().toString(),
            product: product,
          );
        });
      } else {
        Get.snackbar(
            "Item count", "you should at least  add an item  in the cart",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
    update();
  }

  //check itemm exit in cart
  bool existInCart(ProductsModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  //get the quantity in the cart
  int getQuantity(ProductsModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  //total Amount
  int get totalAmount{
    var totalAmount = 0;
    _items.forEach((key, value) {
      totalAmount += value.product!.price! * value.quantity!;
    });
    return totalAmount;
  }
}
