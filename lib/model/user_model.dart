class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? orderCount;

  UserModel({
    required int id,
    required String name,
    required String email,
    required String phone,
    required int orderCount,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['f_name'];
    email = json['email'];
    phone = json['phone'];
    orderCount = json['order_count'];
  }
}
