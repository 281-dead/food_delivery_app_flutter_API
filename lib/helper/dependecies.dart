import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/controller/cart_controller.dart';
import 'package:hc_e_commerce_food_delivery/controller/popular_product_controller.dart';
import 'package:hc_e_commerce_food_delivery/controller/recommended_product_controller.dart';
import 'package:hc_e_commerce_food_delivery/data/api/api_client.dart';
import 'package:hc_e_commerce_food_delivery/data/repository/cart_repo.dart';
import 'package:hc_e_commerce_food_delivery/data/repository/popular_product_repo.dart';
import 'package:hc_e_commerce_food_delivery/data/repository/recommended_product_repo.dart';
import 'package:hc_e_commerce_food_delivery/utils/app_constants.dart';

Future<void> init() async{
  //create api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));


  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());


  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));

}