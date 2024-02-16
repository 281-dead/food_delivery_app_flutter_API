import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';

class BigText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  //TextOverFlow.ellipsis: la . neu dong van ban bi tran
   BigText({Key? key, this.color = const Color(0xFF332d2b),this.overFlow = TextOverflow.ellipsis,this.size = 0, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: size==0  ? Dimension.font20 : size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
