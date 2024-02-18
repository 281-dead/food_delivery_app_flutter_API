import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/pages/home/home_page.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import '../../controller/popular_product_controller.dart';
import '../../controller/recommended_product_controller.dart';
import '../../routes/routes_helper.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashScreeen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> loadDependencies() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();
    loadDependencies();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(
        const Duration(seconds: 3),
        () =>
            Get.offNamed(RoutesHelper.getInitial(), preventDuplicates: false));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(
                  child: Image.asset(
                "assets/image/logo part 1.png",
                width: Dimension.sizeSplash,
              ))),
          Center(
            child: Image.asset(
              "assets/image/logo part 2.png",
              width: Dimension.sizeSplash,
            ),
          ),
        ],
      ),
    );
  }
}
