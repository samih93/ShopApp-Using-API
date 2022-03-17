import 'package:get/get.dart';
import 'package:udemy_flutter/layout/shop_layout_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    //NOTE:  implement dependencies
    Get.lazyPut(() => ShopLayoutController());
    //Get.lazyPut(() => SocialLayoutController());

    //Get.lazyPut(() => ProfileController());
  }
}
