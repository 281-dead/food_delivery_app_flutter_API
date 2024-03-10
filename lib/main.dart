import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/controller/cart_controller.dart';
import 'package:hc_e_commerce_food_delivery/controller/popular_product_controller.dart';
import 'package:hc_e_commerce_food_delivery/controller/recommended_product_controller.dart';
import 'package:hc_e_commerce_food_delivery/pages/auth/sign_in_page.dart';
import 'package:hc_e_commerce_food_delivery/pages/auth/sign_up_page.dart';
import 'package:hc_e_commerce_food_delivery/routes/routes_helper.dart';

import 'helper/dependecies.dart' as dep;

Future<void> main() async {
  //Đảm bảo tải lên dependencies(phụ thuộc) trong không khi đợi
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: SignInPage(),
          // home: SignInPage(),
          // initialRoute: RoutesHelper.getSplashPage(),
          // getPages: RoutesHelper.route,
        );
      });
    });
  }
}
