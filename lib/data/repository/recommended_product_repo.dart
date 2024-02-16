import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/data/api/api_client.dart';
import 'package:hc_e_commerce_food_delivery/utils/app_constants.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommededProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENED_PRODUCT_URI);
  }
}
