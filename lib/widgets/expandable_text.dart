//doan text co the mo rong
import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import 'package:hc_e_commerce_food_delivery/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
   ExpandableTextWidget({Key ?key , required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {

  late String firstHalf;
  late String secondHalf;

  bool  hiddenText = true;

  double textHeight = Dimension.screenHeight / 5.3;

  tapShowMore(){
    setState(() {
      hiddenText = !hiddenText;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length > textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    }else{
      firstHalf = widget.text.toString();
      secondHalf = "";
    }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ? SmallText(text: (firstHalf),size: Dimension.font16,color: AppColors.paraColor,) : Column(
        children: [
            SmallText(height: 1.8,text: hiddenText ?  (firstHalf + "...") : (firstHalf + secondHalf),size: Dimension.font16,color: AppColors.paraColor),
          InkWell(
            onTap: ()=> tapShowMore(),
            child: Row(
              children: [
                SmallText(text: hiddenText ? "Show more" : "Show less" , color: AppColors.mainColor),
                Icon(hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up_rounded ,color: AppColors.mainColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
