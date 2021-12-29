class SocialUserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;

  SocialUserModel({this.name, this.email, this.phone, this.uId});

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'phone': phone, 'uId': uId};
  }
}
