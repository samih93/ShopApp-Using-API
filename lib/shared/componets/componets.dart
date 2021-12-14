import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/home_layoutcontroller.dart';

Widget defaultButton(
        {double width = double.infinity,
        Color background = Colors.blue,
        VoidCallback? onpress,
        required String text,
        double radius = 0,
        double height = 40,
        bool? isUppercase}) =>
    Container(
      width: width,
      child: MaterialButton(
        height: height,
        onPressed: onpress,
        child: Text(
          (isUppercase != null && isUppercase) ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType inputtype,
  Function(String?)? onfieldsubmit,
  VoidCallback? ontap,
  String? Function(String?)? onvalidate,
  String? text,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool obscure = false,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: inputtype,
        onFieldSubmitted: onfieldsubmit,
        onTap: ontap,
        obscureText: obscure,
        // onChanged: (String value) {
        //   print(value);
        // },
        decoration: InputDecoration(
          labelText: text,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(),
        ),
        validator: onvalidate);

Widget buildTaskItem(Map map) => GetBuilder<HomeLayoutController>(
      init: Get.find<HomeLayoutController>(),
      builder: (homecontroller) => Dismissible(
        key: Key(map['id']),
        onDismissed: (direction) {
          homecontroller.deleteTask(taskId: map['id'].toString());
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                child: Text(
                  "${map['time']}",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${map['title']}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${map['date']}",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    homecontroller.updatestatusTask(
                        taskId: map["id"].toString(), status: "done");
                  },
                  icon: Icon(Icons.check_box, color: Colors.green)),
              IconButton(
                  onPressed: () {
                    homecontroller.updatestatusTask(
                        taskId: map["id"].toString(), status: "archive");
                  },
                  icon: Icon(Icons.archive, color: Colors.black45)),
            ],
          ),
        ),
      ),
    );

// circular indicator then show list of tasks or archived taks or finished task
Widget tasksBuilder({required List<Map> tasks}) => tasks.length == 0
    ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu, size: 60, color: Colors.grey),
            SizedBox(
              height: 10,
            ),
            Text(
              "No Tasks Archived",
              style: TextStyle(fontSize: 23, color: Colors.grey),
            ),
          ],
        ),
      )
    : ListView.separated(
        itemBuilder: (context, index) => buildTaskItem(tasks[index]),
        separatorBuilder: (context, index) => Container(
              color: Colors.grey,
              width: double.infinity,
              height: 1,
            ),
        itemCount: tasks.length);
