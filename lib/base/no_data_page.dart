import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String imgPath;

  const NoDataPage(
      {Key? key,
      required this.text,
      this.imgPath = "assets/image/empty_cart.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          imgPath,
          height: Dimension.screenHeight * 0.22,
          width: Dimension.screenWidth * 0.22,
          color: AppColors.signColor,
        ),
        SizedBox(
          height: Dimension.screenHeight * 0.03,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Dimension.screenHeight * 0.0175,
            color: Theme.of(context).disabledColor,
          ),
        )
      ],
    );
  }
}
