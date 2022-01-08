import 'package:get/get.dart';
import 'package:udemy_flutter/layout/news_app/news_layoutController.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout_controller.dart';
import 'package:udemy_flutter/layout/social_app/social_layout_controller.dart';
import 'package:udemy_flutter/layout/todo_app/todo_layoutcontroller.dart';
import 'package:udemy_flutter/modules/social_app/social_login/social_login.dart';
import 'package:udemy_flutter/modules/social_app/social_login/social_login_controller.dart';
import 'package:udemy_flutter/modules/social_app/social_register/social_register_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    //NOTE:  implement dependencies
    Get.lazyPut(() => TodoLayoutController());
    Get.lazyPut(() => NewsLayoutController());
    Get.lazyPut(() => ShopLayoutController());
    //Get.lazyPut(() => SocialLayoutController());

    //Get.lazyPut(() => ProfileController());
  }
}
