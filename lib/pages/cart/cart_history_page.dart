import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/controller/cart_controller.dart';
import 'package:hc_e_commerce_food_delivery/routes/routes_helper.dart';
import 'package:hc_e_commerce_food_delivery/utils/app_constants.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import 'package:hc_e_commerce_food_delivery/widgets/big_text.dart';
import 'package:hc_e_commerce_food_delivery/widgets/small_text.dart';
import 'package:intl/intl.dart';

import '../../base/no_data_page.dart';
import '../../model/cart_model.dart';

class CartHistoryPage extends StatefulWidget {
  const CartHistoryPage({super.key});

  @override
  State<CartHistoryPage> createState() => _CartHistoryPageState();
}

class _CartHistoryPageState extends State<CartHistoryPage> {
  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistory().reversed.toList();
    Map<String, int> cartItemInPerOrder = Map();
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemInPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemInPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemInPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartItemsOrderTimeToList() {
      return cartItemInPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOderTimeToList() {
      return cartItemInPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOder = cartItemsOrderTimeToList();

    var listCounter = 0;

    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();
      if (index < getCartHistoryList.length) {
        DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss")
            .parse(getCartHistoryList[listCounter].time!);
        var inputDate = DateTime.parse(parseDate.toString());
        var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
        outputDate = outputFormat.format(inputDate);
      }
      return BigText(text: outputDate, size: Dimension.font20);
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(
              top: Dimension.height10 * 5,
              bottom: Dimension.height20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Your Cart History", color: Colors.white),
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: Dimension.size30,
                )
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController) {
            var cartLength = _cartController.getCartHistory();
            return cartLength.isNotEmpty
                ? Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: Dimension.height20,
                        left: Dimension.width20,
                        right: Dimension.width20,
                      ),
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView(
                          children: [
                            for (int i = 0; i < itemsPerOder.length; i++)
                              Container(
                                margin:
                                    EdgeInsets.only(bottom: Dimension.height20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    timeWidget(listCounter),
                                    //function is called immediately()
                                    SizedBox(height: Dimension.height10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Wrap(
                                          direction: Axis.horizontal,
                                          children: List.generate(
                                              itemsPerOder[i], (index) {
                                            if (listCounter <
                                                getCartHistoryList.length) {
                                              listCounter++;
                                            }
                                            return index <= 2
                                                ? Container(
                                                    height: Dimension.height80,
                                                    width: Dimension.width80,
                                                    margin: EdgeInsets.only(
                                                      right: Dimension.width5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(Dimension
                                                                  .radius20 /
                                                              2),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                          AppConstants
                                                                  .BASE_URL +
                                                              AppConstants
                                                                  .UPLOAD_IMG +
                                                              getCartHistoryList[
                                                                      listCounter -
                                                                          1]
                                                                  .img!,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container();
                                          }),
                                        ),
                                        Container(
                                          height: Dimension.height80,
                                          width: Dimension.width80,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              SmallText(text: "Total"),
                                              BigText(
                                                text:
                                                    itemsPerOder[i].toString() +
                                                        " items",
                                                color: AppColors.titleColor,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  var orderTime =
                                                      cartOderTimeToList();
                                                  Map<int, CartModel> moreOder =
                                                      {};
                                                  for (int j = 0;
                                                      j <
                                                          getCartHistoryList
                                                              .length;
                                                      j++) {
                                                    if (getCartHistoryList[j]
                                                            .time ==
                                                        orderTime[i]) {
                                                      moreOder.putIfAbsent(
                                                        getCartHistoryList[j]
                                                            .id!,
                                                        () =>
                                                            CartModel.fromJson(
                                                          jsonDecode(
                                                            jsonEncode(
                                                                getCartHistoryList[
                                                                    j]),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  }
                                                  Get.find<CartController>()
                                                      .setItem = moreOder;
                                                  Get.find<CartController>()
                                                      .addToCartList();
                                                  Get.toNamed(RoutesHelper
                                                      .getCartPage());
                                                },
                                                child: Container(
                                                  width: double.maxFinite,
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        Dimension.height5,
                                                    vertical:
                                                        Dimension.height10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(Dimension
                                                                  .radius15 /
                                                              2),
                                                      border: Border.all(
                                                        width: 1,
                                                        color:
                                                            AppColors.mainColor,
                                                      )),
                                                  child: SmallText(
                                                      text: "one more",
                                                      color:
                                                          AppColors.mainColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: Dimension.screenHeight / 1.5,
                    child: const NoDataPage(
                        text: "You have no data in the history cart",
                        imgPath: "assets/image/empty_box.png"),
                  );
          }),
        ],
      ),
    );
  }
}
