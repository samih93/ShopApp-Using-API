import 'package:get/get.dart';
import 'package:udemy_flutter/Controller/BMIController.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BMIController());

    //Get.lazyPut(() => ProfileController());
  }
}
