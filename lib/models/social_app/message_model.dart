class SocialMessageModel {
  String? senderId;
  String? receiverId;
  String? messageDate;
  String? text;

  SocialMessageModel({
    this.senderId,
    this.receiverId,
    this.messageDate,
    this.text,
  });

  SocialMessageModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    messageDate = json['messageDate'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'messageDate': messageDate,
      'text': text,
    };
  }
}
