import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText({Key? key,
    this.color = const Color(0xFFccc7c5)
    ,this.size = 0,
    this.height = 1.2,
    required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimension.font12 : size,
        height:height,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
