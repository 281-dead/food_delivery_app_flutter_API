import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;

  const AppTextField(
      {Key? key,
      required this.textController,
      required this.hintText,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimension.width20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimension.radius15 * 2),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 7,
              offset: const Offset(1, 10),
              color: Colors.grey.withOpacity(0.2),
            )
          ]),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: AppColors.mainColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimension.radius30),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimension.radius30),
              borderSide: const BorderSide(
                width: 1.0,
                color: Colors.white,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimension.radius30),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
