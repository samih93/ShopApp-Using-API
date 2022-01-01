class PostModel {
  String? name;
  String? image;
  String? uId;
  String? postdate;
  String? text;
  String? postImage;

  PostModel({
    this.name,
    this.image,
    this.uId,
    this.postdate,
    this.text,
    this.postImage,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    uId = json['uId'];
    postdate = json['postdate'];
    text = json['text'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'uId': uId,
      'postdate': postdate,
      'text': text,
      'postImage': postImage,
    };
  }
}
