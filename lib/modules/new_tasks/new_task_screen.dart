import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/todo_app/todo_layoutcontroller.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';

class NewTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoLayoutController>(
        init: Get.find<TodoLayoutController>(),
        builder: (todoController) => tasksBuilder(
            tasks: todoController.newtaskMap,
            message: "No Tasks yet, Add more Tasks"));
  }
}
