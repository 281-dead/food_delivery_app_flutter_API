import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/pages/auth/sign_in_page.dart';
import 'package:hc_e_commerce_food_delivery/pages/auth/sign_up_page.dart';
import 'package:hc_e_commerce_food_delivery/pages/cart/cart_page.dart';
import 'package:hc_e_commerce_food_delivery/pages/food/popular_food_detail.dart';
import 'package:hc_e_commerce_food_delivery/pages/food/recomended_food_detail.dart';
import 'package:hc_e_commerce_food_delivery/pages/home/home_page.dart';
import 'package:hc_e_commerce_food_delivery/pages/home/splash_page.dart';

class RoutesHelper {
  static const String initial = "/";
  static const String splash = "/splash-page";
  static const String popular = "/popular-food";
  static const String recommended = "/recommended-food";
  static const String cart = "/cart-page";
  static const String signup = "/sign-up-page";
  static const String signin = "/sign-in-page";

  static String getInitial() => '$initial';
  static String getSplashPage() => '$splash';
  static String getSignInPage() => '$signin';
  static String getSignUpPage() => '$signup';
  static String getPopularFood(int pageId, String page) =>
      '$popular?pageId=$pageId&page=$page';

  static String getRecommendFood(int pageId, String page) =>
      '$recommended?pageId=$pageId&page=$page';

  static String getCartPage() => '$cart';

  static List<GetPage> route = [
    //home page
    GetPage(
      name: initial,
      page: () => const HomePage(),
    ),

    //splash page
    GetPage(
      name: splash,
      page: () => const SplashScreeen(),
    ),
    //Sign In Page
    GetPage(name: signin, page: () => const SignInPage()),
    //Sign Up Page
    GetPage(name: signup, page: () => const SignUpPage()),
    //popular detail Page
    GetPage(
        name: popular,
        page: () {
          var pageId = int.parse(Get.parameters['pageId']!);
          var page = Get.parameters['page'];
          return PopularFoodDetail(pageId: pageId, page: page!);
        },
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 300)),

    //recommended  detail page
    GetPage(
      name: recommended,
      page: () {
        var page = Get.parameters['page'];
        var pageId = int.parse(Get.parameters['pageId']!);
        return RecommendedFoodDetail(pageId: pageId, page: page!);
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    //cart
    GetPage(
      name: cart,
      page: () => CartPage(),
      transition: Transition.downToUp,
      transitionDuration: Duration(milliseconds: 300),
    ),
  ];
}
