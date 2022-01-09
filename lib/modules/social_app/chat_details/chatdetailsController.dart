import 'package:get/get.dart';

class ChatDetailsController extends GetxController {
  var messageText = "".obs;

  void ontypingmessage(value) {
    messageText.value = value;
    update();
  }
}
