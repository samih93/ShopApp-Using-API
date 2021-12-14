import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/home_layoutcontroller.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:udemy_flutter/shared/constants.dart';

class NewTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLayoutController>(
        init: Get.find<HomeLayoutController>(),
        builder: (homeController) =>
            tasksBuilder(tasks: homeController.newtaskMap));
  }
}
