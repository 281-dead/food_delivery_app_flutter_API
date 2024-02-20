import 'products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  int? quantity;
  String? img;
  bool? isExist;
  String? time;
  ProductsModel? product;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.img,
    this.isExist,
    this.time,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    img = json['img'];
    isExist = json['isExist'];
    time = json['time'];
    product = ProductsModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "quantity": this.quantity,
      "img": this.img,
      "isExist": this.isExist,
      "time": this.time,
      "product" : this.product!.toJson(),
    };
  }
}
