import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/data/api/api_client.dart';
import 'package:hc_e_commerce_food_delivery/utils/app_constants.dart';
class PopularProductRepo extends GetxService{
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
      return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}