import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/models/task.dart';
import 'package:udemy_flutter/modules/archive_tasks/archive_task.dart';
import 'package:udemy_flutter/modules/new_tasks/new_task_screen.dart';
import 'package:udemy_flutter/modules/todo_tasks/todo_task.dart';
import 'package:udemy_flutter/shared/network/local/TodoDbHelper.dart';

class HomeLayoutController extends GetxController {
  List<Map> _taskMap = [];
  List<Map> get taskMap => _taskMap;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final screens = [NewTaskScreen(), ToDoTaskScreen(), ArchiveTaskScreen()];
  final appbar_title = ["New Tasks", "Todo Tasks", "Archive Tasks"];
  RxBool isOpenBottomSheet = false.obs;
  Icon _favIcon = Icon(Icons.edit);
  Icon get favIcon => _favIcon;

  TodoDbHelper dbHelper = TodoDbHelper.db;

  bool _isloading = true;
  bool get isloading => _isloading;

  @override
  void onInit() async {
    super.onInit();
    await dbHelper.createDatabase();
    getDatabasesPath().then((value) => print(value + "/todo.db"));
    getalltasks();
  }

  getalltasks() async {
    _isloading = true;
    _taskMap = await dbHelper.GetDataFromDatabase();
    print("lenght of all products ${_taskMap.length}");
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

  Future insertTask(
      {required String title,
      required String date,
      required String time}) async {
    await dbHelper.insertTaskToDatabase(title: title, date: date, time: time);
    _taskMap = await dbHelper.GetDataFromDatabase();
    update();
  }

//Todo: add task by model
  Future insertTaskByModel(Task model) async {
    await dbHelper.insertTaskByModel(model);
    _taskMap = await dbHelper.GetDataFromDatabase();
    update();
  }
}
