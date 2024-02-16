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

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

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
          );
        });
      } else {
        Get.snackbar(
            "Item count", "you should at least  add an item  in the cart",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
  }

  bool existInCart(ProductsModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

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
}
