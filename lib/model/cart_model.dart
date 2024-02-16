
class CartModel {
  int? id;
  String? name;
  int? price;
  int? quantity;
  String? img;
  bool? isExit;
  String? time;

  CartModel(
      {this.id,
        this.name,
        this.price,
        this.quantity,
        this.img,
        this.isExit,
        this.time
      });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity=json['quantity'];
    img = json['img'];
    isExit = json['isExit'];
    time = json['time'];
  }

}
