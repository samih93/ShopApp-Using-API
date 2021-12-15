import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/todo_app/todo_layoutcontroller.dart';
import 'package:udemy_flutter/models/task.dart';
import 'package:udemy_flutter/modules/archive_tasks/archive_task.dart';
import 'package:udemy_flutter/modules/new_tasks/new_task_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:intl/intl.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';

class TodoLayout extends StatelessWidget {
  @override
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  var titlecontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var timecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoLayoutController>(
      init: TodoLayoutController(),
      builder: (todocontroller) => Scaffold(
        key: scaffoldkey,
        appBar: AppBar(
          title: Text(todocontroller.appbar_title[todocontroller.currentIndex]),
        ),
        body: todocontroller.isloading
            ? Center(child: CircularProgressIndicator())
            : todocontroller.screens[todocontroller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: todocontroller.currentIndex,
          onTap: (index) {
            todocontroller.onchangeIndex(index);
          },
          items: todocontroller.bottomItems,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: todocontroller.favIcon,
          onPressed: () {
            if (todocontroller.isOpenBottomSheet.value) {
              if (formkey.currentState!.validate()) {
                todocontroller
                    .insertTaskByModel(
                        model: new Task(
                            title: titlecontroller.text,
                            date: datecontroller.text,
                            time: timecontroller.text,
                            status: "new"))
                    // .insertTask(
                    //     title: titlecontroller.text,
                    //     date: datecontroller.text,
                    //     time: timecontroller.text)
                    .then((value) {
                  Navigator.pop(context);
                  todocontroller.isOpenBottomSheet.value = false;
                  todocontroller.onchangefavIcon(Icon(Icons.edit));
                });
              }
            } else {
              scaffoldkey.currentState!
                  .showBottomSheet(
                      (context) => Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Form(
                                key: formkey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    defaultTextFormField(
                                        controller: titlecontroller,
                                        inputtype: TextInputType.text,
                                        prefixIcon: Icon(Icons.title),
                                        ontap: () {},
                                        onvalidate: (value) {
                                          if (value!.isEmpty) {
                                            return "title must not be empty";
                                          }
                                        },
                                        text: "Task Name"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    defaultTextFormField(
                                        controller: datecontroller,
                                        inputtype: TextInputType.datetime,
                                        prefixIcon: Icon(Icons.date_range),
                                        ontap: () {
                                          showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.parse(
                                                      '2010-01-01'),
                                                  lastDate: DateTime.parse(
                                                      '2030-01-01'))
                                              .then((value) {
                                            //Todo: handle date to string
                                            //print(DateFormat.yMMMd().format(value!));
                                            datecontroller.text =
                                                DateFormat.yMMMd()
                                                    .format(value!);
                                          });
                                        },
                                        onvalidate: (value) {
                                          if (value!.isEmpty) {
                                            return "date must not be empty";
                                          }
                                        },
                                        text: "date"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    defaultTextFormField(
                                        controller: timecontroller,
                                        inputtype: TextInputType.number,
                                        prefixIcon:
                                            Icon(Icons.watch_later_outlined),
                                        ontap: () {
                                          showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now())
                                              .then((value) =>
                                                  timecontroller.text = value!
                                                      .format(context)
                                                      .toString());
                                        },
                                        onvalidate: (value) {
                                          if (value!.isEmpty) {
                                            return "time must not be empty";
                                          }
                                        },
                                        text: "time")
                                  ],
                                ),
                              ),
                            ),
                          ),
                      elevation: 30,
                      backgroundColor: Colors.white)
                  .closed
                  .then((value) {
                // Navigator.pop(context); no need cs i close it by hand
                todocontroller.isOpenBottomSheet.value = false;
                todocontroller.onchangefavIcon(Icon(Icons.edit));
              });

              todocontroller.isOpenBottomSheet.value = true;
              todocontroller.onchangefavIcon(Icon(Icons.add));
            }
          },
        ),
      ),
    );
  }
}
