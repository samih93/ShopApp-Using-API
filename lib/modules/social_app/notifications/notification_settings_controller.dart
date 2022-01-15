import 'package:get/get.dart';
import 'package:udemy_flutter/shared/network/local/cashhelper.dart';

class NotificationSettingsController extends GetxController {
  var isGetLikesNotification = false.obs;

  NotificationSettingsController() {
    isGetLikesNotification.value =
        CashHelper.getData(key: 'isGetLikesNotification') ?? false;
    print(isGetLikesNotification.value);
  }

  onchageLikesNotification(bool value) {
    isGetLikesNotification.value = value;
    CashHelper.saveData(key: "isGetLikesNotification", value: value);
    update();
  }
}
