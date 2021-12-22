import 'package:get/get.dart';
import 'package:udemy_flutter/layout/news_app/news_layoutController.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout_controller.dart';
import 'package:udemy_flutter/layout/todo_app/todo_layoutcontroller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // implement dependencies
    Get.lazyPut(() => TodoLayoutController());
    Get.lazyPut(() => NewsLayoutController());
    Get.lazyPut(() => ShopLayoutController());

    //Get.lazyPut(() => ProfileController());
  }
}
