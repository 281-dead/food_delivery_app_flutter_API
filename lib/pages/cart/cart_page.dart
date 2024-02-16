import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import 'package:hc_e_commerce_food_delivery/widgets/app_icons.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimension.height60,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  size: Dimension.iconSize24,
                  backgroundcolor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                 SizedBox(width: Dimension.screenWidth /2),
                AppIcon(
                  icon: Icons.home,
                  size: Dimension.iconSize24,
                  backgroundcolor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  size: Dimension.iconSize24,
                  backgroundcolor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
