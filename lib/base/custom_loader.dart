import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/controller/auth_controller.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Dimension.height20 * 5,
        width: Dimension.height20 * 5,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(Dimension.radius20 * 5 / 2),
        //   color: AppColors.mainColor,
        // ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: AppColors.mainColor,
        ),
      ),
    );
  }
}
