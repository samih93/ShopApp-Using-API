import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/home_layoutcontroller.dart';
import 'package:udemy_flutter/modules/archive_tasks/archive_task.dart';
import 'package:udemy_flutter/modules/new_tasks/new_task_screen.dart';
import 'package:udemy_flutter/modules/todo_tasks/todo_task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:intl/intl.dart';
import 'package:udemy_flutter/shared/constants.dart';

class HomeLayout extends StatelessWidget {
  @override
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  var titlecontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var timecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLayoutController>(
      init: HomeLayoutController(),
      builder: (homecontroller) => Scaffold(
        key: scaffoldkey,
        appBar: AppBar(
          title: Text(homecontroller.appbar_title[homecontroller.currentIndex]),
        ),
        body: homecontroller.isloading
            ? Center(child: CircularProgressIndicator())
            : homecontroller.screens[homecontroller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: homecontroller.currentIndex,
          onTap: (index) {
            homecontroller.onchangeIndex(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Task"),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline), label: "Done"),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined),
              label: "Archive",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: homecontroller.favIcon,
          onPressed: () {
            if (homecontroller.isOpenBottomSheet.value) {
              if (formkey.currentState!.validate()) {
                homecontroller
                    .insertTask(
                        title: titlecontroller.text,
                        date: datecontroller.text,
                        time: timecontroller.text)
                    .then((value) {
                  Navigator.pop(context);
                  homecontroller.isOpenBottomSheet.value = false;
                  homecontroller.onchangefavIcon(Icon(Icons.edit));
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
                homecontroller.isOpenBottomSheet.value = false;
                homecontroller.onchangefavIcon(Icon(Icons.edit));
              });

              homecontroller.isOpenBottomSheet.value = true;
              homecontroller.onchangefavIcon(Icon(Icons.add));
            }
          },
        ),
      ),
    );
  }
}
