import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import 'package:hc_e_commerce_food_delivery/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
   IconAndTextWidget({
     Key? key,
    required this.icon,
     required this.text,
     required this.iconColor
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,),
        SizedBox(width: Dimension.width5,),
        SmallText(text: text,),
      ],
    );
  }
}
