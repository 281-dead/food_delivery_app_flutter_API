import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/controller/cart_controller.dart';
import 'package:hc_e_commerce_food_delivery/controller/popular_product_controller.dart';
import 'package:hc_e_commerce_food_delivery/pages/cart/cart_page.dart';
import 'package:hc_e_commerce_food_delivery/routes/routes_helper.dart';
import 'package:hc_e_commerce_food_delivery/utils/app_constants.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';

import 'package:hc_e_commerce_food_delivery/widgets/expandable_text.dart';

import '../../utils/colors.dart';

import '../../widgets/app_icons.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  PopularFoodDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

    return Scaffold(
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: Dimension.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOAD_IMG +
                      product.img),
                ),
              ),
            ),
          ),
          //icon widget
          Positioned(
              left: Dimension.width20,
              right: Dimension.width20,
              top: Dimension.height45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if(page == "cartPage"){
                          Get.toNamed(RoutesHelper.getCartPage());
                        }else{
                          Get.toNamed(RoutesHelper.getInitial());
                        }

                      },
                      child: AppIcon(size: Dimension.size50,icon: Icons.arrow_back_ios_rounded)),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                    onTap: (){
                      if(controller.totalItems  >= 1)
                      Get.toNamed(RoutesHelper.getCartPage());
                    },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    width: Dimension.width20,
                                    height: Dimension.width20,
                                    child: AppIcon(
                                      icon: Icons.circle,
                                      iconColor: Colors.transparent,
                                      backgroundcolor: AppColors.mainColor,
                                      size: Dimension.size20,
                                    ),
                                  ),
                                )
                              : Container(),
                          Positioned(
                            right: 3,
                           top:0,
                            child: BigText(
                              size: Dimension.font12,
                              text: controller
                                  .totalItems
                                  .toString(),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              )),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            top: Dimension.popularFoodImgSize - Dimension.width20,
            bottom: 0,
            child: Container(
              height: Dimension.screenHeight - Dimension.popularFoodImgSize,
              padding: EdgeInsets.all(Dimension.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimension.width30),
                  topLeft: Radius.circular(Dimension.width30),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: product.name,
                    size: Dimension.font26,
                  ),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      SmallText(text: product.stars.toString()),
                      SizedBox(width: Dimension.width10),
                      SmallText(text: "1280"),
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
                  SizedBox(height: Dimension.height20),
                  BigText(
                    text: "Introduce",
                    size: Dimension.font20,
                  ),
                  SizedBox(height: Dimension.height20),
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                    text: product.description,
                  ))),
                ],
              ),
            ),
          ),
          //expandable text  widget
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
          padding: EdgeInsets.only(
            left: Dimension.width30,
            right: Dimension.width30,
          ),
          height: Dimension.bottomHeightBar,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimension.width30),
              topLeft: Radius.circular(Dimension.width30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(Dimension.width10),
                height: Dimension.height60,
                width: Dimension.width100,
                decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(Icons.remove, color: AppColors.signColor),
                    ),
                    BigText(text: popularProduct.inCartItem.toString()),
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(Icons.add, color: AppColors.signColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  popularProduct.addItem(product);
                },
                child: Container(
                  margin: EdgeInsets.only(right: Dimension.width10),
                  padding: EdgeInsets.all(Dimension.width10),
                  height: Dimension.height60,
                  width: Dimension.width200,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BigText(
                        //size: Dimension.font16,
                        text: "\$${product.price} | Add to cart",
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
