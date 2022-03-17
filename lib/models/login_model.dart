class ShopLoginModel {
  bool? status;
  String? message;
  UserData? userData;

  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    userData = json["data"] != null ? UserData.fromJson(json["data"]) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.image,
    this.points,
    this.credit,
    this.token,
  });
  //named constructure
  UserData.fromJson(Map<String, dynamic> json) {
    if (json == null) return;

    this.id = json["id"];
    this.name = json["name"];
    this.phone = json["phone"];
    this.email = json["email"];
    this.image = json["image"];
    this.points = json["points"];
    this.token = json["token"];
  }
}
