import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/models/social_app/message_model.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';

class ChatDetailsController extends GetxController {
  var messageText = "".obs;

  void ontypingmessage(value) {
    messageText.value = value;
    update();
  }

  // NOTE :------------------ send Message ---------------------------------------

  var isSendMessageSuccess = false.obs;

  void sendMessage(
      {required String receiverId,
      required String messageDate,
      required String text}) {
    isSendMessageSuccess.value = false;
    SocialMessageModel model = SocialMessageModel(
        senderId: uId,
        receiverId: receiverId,
        text: text,
        messageDate: messageDate);

    // NOTE write message in user sender
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toJson())
        .then((value) {
      isSendMessageSuccess.value = true;
      update();
    }).catchError((error) {
      print(error.toString());
    });

    // NOTE write message in user received

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(uId)
        .collection('messages')
        .add(model.toJson())
        .then((value) {
      isSendMessageSuccess.value = true;
      update();
    }).catchError((error) {
      print(error.toString());
    });
  }

  // NOTE : -------------- get Messages-----------------

  List<SocialMessageModel> _listOfMessages = [];
  List<SocialMessageModel> get listOfMessages => _listOfMessages;

  var isGetMessageSuccess = false.obs;

  void getMessages({required String receiverId}) {
    isGetMessageSuccess.value = false;
    update();

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('messageDate')
        .snapshots()
        // ! Stream => of type Stream<QureySnapshot>  get data and still open to receive new updates
        // ! get => of type Future<QuerySnapshot> get data one time
        .listen((event) {
      _listOfMessages = []; // ! cz listen get old and new data
      update();
      event.docs.forEach((element) {
        _listOfMessages.add(SocialMessageModel.fromJson(element.data()));
        update();
      });
    });
    isGetMessageSuccess.value = true;
    update();
  }
}
