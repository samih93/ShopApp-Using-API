import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/models/task.dart';
import 'package:udemy_flutter/modules/archive_tasks/archive_task.dart';
import 'package:udemy_flutter/modules/done_tasks/done_task.dart';
import 'package:udemy_flutter/modules/new_tasks/new_task_screen.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';
import 'package:udemy_flutter/shared/network/local/TodoDbHelper.dart';
import 'package:uuid/uuid.dart';

class HomeLayoutController extends GetxController {
  List<Map> _newtaskMap = [];
  List<Map> get newtaskMap => _newtaskMap;
  List<Map> _donetaskMap = [];
  List<Map> get donetaskMap => _donetaskMap;
  List<Map> _archivetaskMap = [];
  List<Map> get archivetaskMap => _archivetaskMap;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final screens = [NewTaskScreen(), DoneTaskScreen(), ArchiveTaskScreen()];
  final appbar_title = ["New Tasks", "Todo Tasks", "Archive Tasks"];
  RxBool isOpenBottomSheet = false.obs;
  Icon _favIcon = Icon(Icons.edit);
  Icon get favIcon => _favIcon;

  TodoDbHelper dbHelper = TodoDbHelper.db;

  bool _isloading = true;
  bool get isloading => _isloading;

  DateFormat format = DateFormat("dd-MM-yyyy");

  @override
  void onInit() async {
    super.onInit();
    await dbHelper.createDatabase();
    getDatabasesPath().then((value) => print(value + "/todo.db"));
    getalltasks();
  }

// Future<List<Map>> insertTaskToDatabase(
//       {required String title,
//       required String date,
//       required String time}) async {
//     database.transaction((txn) => txn
//             .rawInsert(
//                 'insert into $taskTable(title,date,time,status) values("$title","$date","$time","new")')
//             .then((value) async {
//           print('inserted successfully');
//         }).catchError((error) {
//           print(error.toString());
//         }));

//     return await GetDataFromDatabase();
//   }

  getalltasks() async {
    _newtaskMap = [];
    _donetaskMap = [];
    _archivetaskMap = [];
    _isloading = true;
    dbHelper.database.rawQuery('select * from tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == "new")
          _newtaskMap.add(element);
        else if (element['status'] == "done")
          _donetaskMap.add(element);
        else if (element['status'] == "archive") _archivetaskMap.add(element);
      });
      _newtaskMap.length != 0
          ? _newtaskMap.sort((a, b) {
              return a['date'].compareTo(b['date']);
            })
          : [];
      print("N  " + _newtaskMap.length.toString());
      print("D  " + _donetaskMap.length.toString());
      print("A  " + _archivetaskMap.length.toString());
    });

    _isloading = false;
    update();
  }

  void onchangeIndex(int index) {
    _currentIndex = index;
    update();
  }

  void onchangefavIcon(Icon icon) {
    _favIcon = icon;
    update();
  }

//  add task by model
  insertTaskByModel({required Task model}) async {
    var dbclient = await dbHelper.database;
    var uuid = Uuid();
    model.id = uuid.v1();
    print(model.toJson());
    await dbclient.insert(taskTable, model.toJson());
    getalltasks();
  }

  updatestatusTask({required String taskId, required String status}) async {
    var dbclient = await dbHelper.database;
    await dbclient.rawUpdate(
        "UPDATE  $taskTable SET status= '$status' where  id='$taskId'");
    print("Updated");
    getalltasks();
  }

  deleteTask({required String taskId}) async {
    var dbclient = await dbHelper.database;
    await dbclient.rawDelete("DELETE FROM  $taskTable where  id='$taskId'");
    print("deleted");
    getalltasks();
  }
}
