import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/todo_app/todo_layoutcontroller.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';

class ArchiveTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoLayoutController>(
      init: Get.find<TodoLayoutController>(),
      builder: (todoController) => tasksBuilder(
          tasks: todoController.archivetaskMap, message: "no Tasks Archived"),
    );
  }
}
