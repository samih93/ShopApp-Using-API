import 'package:flutter/material.dart';
import 'package:udemy_flutter/modules/archive_tasks/archive_task.dart';
import 'package:udemy_flutter/modules/new_tasks/new_task_screen.dart';
import 'package:udemy_flutter/modules/todo_tasks/todo_task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';
import 'package:intl/intl.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;
  final screens = [NewTaskScreen(), ToDoTaskScreen(), ArchiveTaskScreen()];
  final appbar_title = ["New Tasks", "Todo Tasks", "Archive Tasks"];

  late Database database;
  bool isOpenBottomSheet = false;
  Icon favIcon = Icon(Icons.edit);

  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  var titlecontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var timecontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text(appbar_title[_currentIndex]),
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
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
        child: favIcon,
        onPressed: () {
          if (isOpenBottomSheet) {
            if (formkey.currentState!.validate()) {
              Navigator.pop(context);
              isOpenBottomSheet = false;
              setState(() {
                favIcon = Icon(Icons.edit);
              });
            }
          } else {
            scaffoldkey.currentState!.showBottomSheet((context) => Container(
                  color: Colors.grey.shade200,
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
                                        firstDate: DateTime.parse('2010-01-01'),
                                        lastDate: DateTime.parse('2030-01-01'))
                                    .then((value) =>
                                        //Todo: handle date to string
                                        datecontroller.text = value.toString());
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
                              prefixIcon: Icon(Icons.watch_later_outlined),
                              ontap: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) => timecontroller.text =
                                        value!.format(context).toString());
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
                ));
            isOpenBottomSheet = true;
            setState(() {
              favIcon = Icon(Icons.add);
            });
          }
        },
      ),
    );
  }

  void createDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print("database created");
        database
            .execute(
                "Create Table tasks(id Integer PRIMARY KEY,title TEXT,date TEXT , time TEXT , status TEXT)")
            .then((value) => print('table created'))
            .catchError((onError) => print(onError.toString()));
      },
      onOpen: (database) {
        print('database opened');
      },
    );
  }

  void insertToDatabase() {
    database
        .transaction((txn) => txn.rawInsert(
            'insert into tasks(title,date,time,status) values("first task","12-12-2021","5 min","status")'))
        .then((value) => print('inserted successfully'))
        .catchError((error) {
      print(error.toString());
    });
  }
}
