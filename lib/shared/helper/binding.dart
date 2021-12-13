import 'package:get/get.dart';
import 'package:udemy_flutter/layout/home_layoutcontroller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeLayoutController());

    //Get.lazyPut(() => ProfileController());
  }
}
