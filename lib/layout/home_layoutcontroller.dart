import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/modules/archive_tasks/archive_task.dart';
import 'package:udemy_flutter/modules/new_tasks/new_task_screen.dart';
import 'package:udemy_flutter/modules/todo_tasks/todo_task.dart';

class HomeLayoutController extends GetxController {
  late Database database;
  List<Map> _taskMap = [];
  List<Map> get taskMap => _taskMap;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final screens = [NewTaskScreen(), ToDoTaskScreen(), ArchiveTaskScreen()];
  final appbar_title = ["New Tasks", "Todo Tasks", "Archive Tasks"];
  RxBool isOpenBottomSheet = false.obs;
  Icon _favIcon = Icon(Icons.edit);
  Icon get favIcon => _favIcon;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await createDatabase();
    getDatabasesPath().then((value) => print(value + "/todo.db"));
    _taskMap = await GetDataFromDatabase();
    update();
    print(_taskMap);
  }

  void onchangeIndex(int index) {
    _currentIndex = index;
    update();
  }

  void onchangefavIcon(Icon icon) {
    _favIcon = icon;
    update;
  }

  Future createDatabase() async {
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

  Future insertToDatabase(
      {required String title,
      required String date,
      required String time}) async {
    database.transaction((txn) => txn
            .rawInsert(
                'insert into tasks(title,date,time,status) values("$title","$date","$time","status")')
            .then((value) async {
          print('inserted successfully');
          _taskMap = await GetDataFromDatabase();
          update();
        }).catchError((error) {
          print(error.toString());
        }));
  }

  Future<List<Map>> GetDataFromDatabase() async {
    return await database.rawQuery('select * from tasks');
  }
}
