import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/controller/popular_product_controller.dart';
import 'package:hc_e_commerce_food_delivery/controller/recommended_product_controller.dart';
import 'package:hc_e_commerce_food_delivery/pages/cart/cart_page.dart';
import 'package:hc_e_commerce_food_delivery/pages/food/popular_food_detail.dart';
import 'package:hc_e_commerce_food_delivery/pages/food/recomended_food_detail.dart';
import 'package:hc_e_commerce_food_delivery/pages/home/food_page_body.dart';
import 'package:hc_e_commerce_food_delivery/pages/home/main_food_page.dart';
import 'package:get/get.dart';
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
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainFoodPage(),
      initialRoute: RoutesHelper.getInitial(),
      getPages: RoutesHelper.route,
    );

  }
}

