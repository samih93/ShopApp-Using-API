class SocialUserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? coverimage;
  String? bio;
  String? uId;

  SocialUserModel(
      {this.name,
      this.email,
      this.phone,
      this.image,
      this.coverimage,
      this.bio,
      this.uId});

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    coverimage = json['coverimage'];
    bio = json['bio'];
    uId = json['uId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'coverimage': coverimage,
      'bio': bio,
      'uId': uId
    };
  }
}
