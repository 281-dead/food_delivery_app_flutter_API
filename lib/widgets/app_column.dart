import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/controller/popular_product_controller.dart';
import 'package:hc_e_commerce_food_delivery/model/products_model.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import 'package:hc_e_commerce_food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final int index;
  const AppColumn({Key? key,required this.index}) :super(key: key);

  @override
  Widget build(BuildContext context ) {
    return GetBuilder<PopularProductController>(builder: (productPopular) {
      ProductsModel product = productPopular.popularProductList[this.index];
      return Column(
        children: [
          BigText(text: product.name!),
          SizedBox(
            height: Dimension.height10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    size: Dimension.size15,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              SmallText(text: product.stars!.toString()),
              SizedBox(width: Dimension.width10),
              SmallText(text: product.price!.toString()),
              SizedBox(width: Dimension.width20),
              SmallText(text: "comments"),
            ],
          ),
          SizedBox(height: Dimension.height20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1,
              ),
              IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.mainColor,
              ),
              IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColors.iconColor2,
              ),
            ],
          ),
        ],
      );
    });
    ;
  }
}
