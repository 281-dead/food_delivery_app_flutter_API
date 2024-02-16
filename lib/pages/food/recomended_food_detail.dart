import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/controller/cart_controller.dart';
import 'package:hc_e_commerce_food_delivery/controller/popular_product_controller.dart';
import 'package:hc_e_commerce_food_delivery/controller/recommended_product_controller.dart';
import 'package:hc_e_commerce_food_delivery/routes/routes_helper.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import 'package:hc_e_commerce_food_delivery/widgets/expandable_text.dart';
import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/widgets/small_text.dart';
import '../../utils/app_constants.dart';
import '../../widgets/app_icons.dart';
import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommededProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimension.height80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      AppIcon(icon: Icons.shopping_cart_outlined),
                      Get.find<PopularProductController>().totalItems >= 1
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
                          text: Get.find<PopularProductController>()
                              .totalItems
                              .toString(),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimension.height20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.only(
                      top: Dimension.height5, bottom: Dimension.height5),
                  width: double.maxFinite,
                  child: Center(
                      child:
                          BigText(text: product.name, size: Dimension.font26)),
                )),
            pinned: true,
            expandedHeight: 300,
            backgroundColor: Colors.orangeAccent,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_IMG + product.img,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: Dimension.width10,
                    left: Dimension.width10,
                    bottom: Dimension.height20,
                  ),
                  child: ExpandableTextWidget(
                    text: product.description,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (controller) {
        return Container(
          height: Dimension.height120,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                      icon: Icons.remove,
                      backgroundcolor: AppColors.mainColor,
                      iconColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: Dimension.width30),
                  BigText(
                      text: "\$ ${product.price} X ${controller.inCartItem}"),
                  SizedBox(width: Dimension.width30),
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                      icon: Icons.add,
                      backgroundcolor: AppColors.mainColor,
                      iconColor: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  left: Dimension.width30,
                  right: Dimension.width30,
                ),
                height: Dimension.bottomHeightBar - Dimension.height10,
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
                        width: Dimension.width80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20),
                        ),
                        child: Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: AppColors.mainColor,
                            ),
                          ),
                        )),
                    //add cart item
                    Container(
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
                          GestureDetector(
                            onTap: () {
                              controller.addItem(product);
                            },
                            child: BigText(
                              text: "\$${product.price} | Add to cart",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
