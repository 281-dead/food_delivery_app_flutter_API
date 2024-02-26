import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/base/no_data_page.dart';
import 'package:hc_e_commerce_food_delivery/controller/cart_controller.dart';
import 'package:hc_e_commerce_food_delivery/controller/popular_product_controller.dart';
import 'package:hc_e_commerce_food_delivery/controller/recommended_product_controller.dart';
import 'package:hc_e_commerce_food_delivery/routes/routes_helper.dart';
import 'package:hc_e_commerce_food_delivery/utils/app_constants.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import 'package:hc_e_commerce_food_delivery/widgets/app_icons.dart';
import 'package:hc_e_commerce_food_delivery/widgets/big_text.dart';
import 'package:hc_e_commerce_food_delivery/widgets/small_text.dart';

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
                  onTap: () {
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
                  onTap: () {
                    Get.toNamed(RoutesHelper.getInitial());
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
          GetBuilder<CartController>(builder: (_cartControlller) {
            return _cartControlller.getItems.isNotEmpty
                ? Positioned(
                    top: Dimension.height20 * 5,
                    left: Dimension.width20,
                    right: Dimension.width20,
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: Dimension.height20),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(builder: (cart) {
                          var _cartList = cart.getCartItem;
                          return ListView.builder(
                              itemCount: _cartList.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  width: double.maxFinite,
                                  height: Dimension.height20 * 5,
                                  margin: EdgeInsets.only(
                                      bottom: Dimension.height10),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          var popularIndex = Get.find<
                                                  PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartList[index].product);
                                          if (popularIndex >= 0) {
                                            Get.toNamed(
                                                RoutesHelper.getPopularFood(
                                                    popularIndex, "cartPage"));
                                          } else {
                                            var recommendedIndex = Get.find<
                                                    RecommendedProductController>()
                                                .recommededProductList
                                                .indexOf(
                                                    _cartList[index].product);
                                            if (recommendedIndex < 0) {
                                              Get.snackbar("History Product",
                                                  "Product reviews are not available for history products",
                                                  backgroundColor:
                                                      AppColors.mainColor,
                                                  colorText: Colors.white);
                                            } else {
                                              Get.toNamed(
                                                  RoutesHelper.getRecommendFood(
                                                      recommendedIndex,
                                                      "cartPage"));
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: Dimension.width20 * 5,
                                          height: Dimension.height20 * 5,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                AppConstants.BASE_URL +
                                                    AppConstants.UPLOAD_IMG +
                                                    cart.getCartItem[index].img
                                                        .toString(),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                Dimension.radius20),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        margin: EdgeInsets.only(
                                            left: Dimension.width10),
                                        height: Dimension.height20 * 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                              text:
                                                  cart.getCartItem[index].name!,
                                              color: Colors.black54,
                                            ),
                                            SmallText(text: "Spicy"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                  text:
                                                      "\$${cart.getCartItem[index].price}",
                                                  color: Colors.redAccent,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(
                                                      Dimension.width10),
                                                  height: Dimension.height45,
                                                  width: Dimension.width100,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          cart.addItem(
                                                              -1,
                                                              _cartList[index]
                                                                  .product!);
                                                        },
                                                        child: Icon(
                                                            Icons.remove,
                                                            color: AppColors
                                                                .signColor),
                                                      ),
                                                      BigText(
                                                          text: _cartList[index]
                                                              .quantity
                                                              .toString()),
                                                      GestureDetector(
                                                        onTap: () {
                                                          cart.addItem(
                                                              1,
                                                              _cartList[index]
                                                                  .product!);
                                                        },
                                                        child: Icon(Icons.add,
                                                            color: AppColors
                                                                .signColor),
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
                  )
                : NoDataPage(text: "Your cart is empty!");
          }),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
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
          child: cartController.getItems.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Dimension.width100,
                      padding: EdgeInsets.all(Dimension.width5),
                      decoration: BoxDecoration(
                        color: AppColors.buttonBackgroundColor,
                        borderRadius: BorderRadius.circular(Dimension.radius15),
                      ),
                      child: BigText(
                        text: "\$ ${cartController.totalAmount}",
                        size: Dimension.font26,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cartController
                            .addToHistory(); //payment, Delete the products in the cart and then move to the cart history page.
                      },
                      child: Container(
                        padding: EdgeInsets.all(Dimension.width10),
                        height: Dimension.height60,
                        width: Dimension.width180,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20),
                        ),
                        child: Center(
                          child: BigText(
                            //size: Dimension.font16,
                            text: "Check out",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        );
      }),
    );
  }
}
