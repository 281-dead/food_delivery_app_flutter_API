import 'package:get/get.dart';
import 'package:hc_e_commerce_food_delivery/data/repository/recommended_product_repo.dart';
import 'package:hc_e_commerce_food_delivery/model/products_model.dart';

class RecommendedProductController extends GetxController{
    final RecommendedProductRepo recommendedProductRepo;
    RecommendedProductController({required this.recommendedProductRepo});

     bool _isLoaded = false;
     bool get isloaded => _isLoaded;

     List<dynamic> _recommendedProductList =[];
     List<dynamic> get recommededProductList => _recommendedProductList;

     Future<void> getRecommendedProductList()async{
       Response response = await recommendedProductRepo.getRecommededProductList();
       if(response.statusCode == 200){
         _recommendedProductList = [];
          _recommendedProductList.addAll(Products.fromJson(response.body).products);
         _isLoaded = true;
         update();
       }else{
         print("error");
       }

     }

}