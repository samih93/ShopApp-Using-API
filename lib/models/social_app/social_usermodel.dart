class SocialUserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? uId;

  SocialUserModel({this.name, this.email, this.phone, this.image, this.uId});

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    uId = json['uId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'uId': uId
    };
  }
}
