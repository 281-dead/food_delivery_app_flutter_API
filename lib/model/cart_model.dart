import 'products_model.dart';
class CartModel {
  int? id;
  String? name;
  int? price;
  int? quantity;
  String? img;
  bool? isExit;
  String? time;
  ProductsModel? product;

  CartModel(
      {this.id,
        this.name,
        this.price,
        this.quantity,
        this.img,
        this.isExit,
        this.time,
        this.product,
      });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity=json['quantity'];
    img = json['img'];
    isExit = json['isExit'];
    time = json['time'];
    product = ProductsModel.fromJson(json['product']);
  }

}
