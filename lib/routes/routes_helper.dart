import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/pages/food/popular_food_detail.dart';
import 'package:hc_e_commerce_food_delivery/pages/food/recomended_food_detail.dart';
import 'package:hc_e_commerce_food_delivery/pages/home/main_food_page.dart';

class RoutesHelper {
  static const String initial = "/";
  static const String popular = "/popular-food";
  static const String recommended = "/recommended-food";

  static String  getInitial() => '$initial';

  static String  getPopularFood(int pageId) => '$popular?pageId=$pageId';

  static String  getRecommendFood(int pageId) => '$recommended?pageId=$pageId';


  static List<GetPage> route = [
    //home page
    GetPage(name: initial,
      page: () => MainFoodPage(),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 300),),
    //popular detail Page
    GetPage(name: popular,
      page: () {
      var pageId = int.parse(Get.parameters['pageId']!);
       return PopularFoodDetail(pageId: pageId);
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300)),

    //recommended  detail page
    GetPage(name: recommended,
      page: () {
      var pageId = int.parse(Get.parameters['pageId']!);
      return RecommendedFoodDetail(pageId: pageId);
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),),

  ];

}