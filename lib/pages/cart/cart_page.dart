import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/controller/cart_controller.dart';
import 'package:hc_e_commerce_food_delivery/controller/popular_product_controller.dart';
import 'package:hc_e_commerce_food_delivery/pages/home/main_food_page.dart';
import 'package:hc_e_commerce_food_delivery/utils/app_constants.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import 'package:hc_e_commerce_food_delivery/widgets/app_icons.dart';
import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/widgets/big_text.dart';
import 'package:hc_e_commerce_food_delivery/widgets/small_text.dart';
import 'package:hc_e_commerce_food_delivery/routes/routes_helper.dart';

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
                GestureDetector(
              onTap: (){
                Get.toNamed(RoutesHelper.getInitial());
              },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    size: Dimension.iconSize24,
                    backgroundcolor: AppColors.mainColor,
                    iconColor: Colors.white,
                  ),
                ),
                SizedBox(width: Dimension.screenWidth / 2),
                GestureDetector(
                  onTap: (){
                    Get.to(()=> MainFoodPage());
                  },
                  child: AppIcon(
                    icon: Icons.home,
                    size: Dimension.iconSize24,
                    backgroundcolor: AppColors.mainColor,
                    iconColor: Colors.white,
                  ),
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
          Positioned(
            top: Dimension.height20 * 5,
            left: Dimension.width20,
            right: Dimension.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimension.height20),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child:GetBuilder<CartController>(builder: (cart){
                  return  ListView.builder(
                      itemCount:cart.getCartItem.length ,
                      itemBuilder: (_, index) {
                        return Container(
                          width: double.maxFinite,
                          height: Dimension.height20 * 5,
                          margin: EdgeInsets.only(bottom: Dimension.height10),
                          child: Row(
                            children: [
                              Container(
                                width: Dimension.width20 * 5,
                                height: Dimension.height20 * 5,
                                decoration: BoxDecoration(
                                  image:  DecorationImage(
                                    image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_IMG + cart.getCartItem[index].img.toString()),
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(Dimension.radius20),
                                  color: Colors.white,
                                ),
                              ),

                              Expanded(child: Container(
                                margin: EdgeInsets.only(left: Dimension.width10),
                                height: Dimension.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(text: cart.getCartItem[index].name!,color: Colors.black54,),
                                    SmallText(text: "Spicy"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(text: "\$${cart.getCartItem[index].price}",color: Colors.redAccent,),
                                        Container(
                                          padding: EdgeInsets.all(Dimension.width10),
                                          height: Dimension.height45,
                                          width: Dimension.width100,
                                          // decoration: BoxDecoration(
                                          //   color: AppColors.buttonBackgroundColor,
                                          //   borderRadius: BorderRadius.circular(Dimension.radius20),
                                          // ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {

                                                },
                                                child: Icon(Icons.remove, color: AppColors.signColor),
                                              ),
                                              BigText(text: cart.getCartItem[index].quantity.toString()),
                                              GestureDetector(
                                                onTap: () {

                                                },
                                                child: Icon(Icons.add, color: AppColors.signColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                            ],
                          ),
                        );
                      });
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
