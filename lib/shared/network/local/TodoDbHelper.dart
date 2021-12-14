import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:udemy_flutter/models/task.dart';
import 'package:udemy_flutter/shared/constants.dart';

class TodoDbHelper {
  TodoDbHelper._();
  static final TodoDbHelper db = TodoDbHelper._();
  late Database database;

  Future createDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version) {
        print("database created");
        db
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

  Future<List<Map>> insertTaskToDatabase(
      {required String title,
      required String date,
      required String time}) async {
    database.transaction((txn) => txn
            .rawInsert(
                'insert into tasks(title,date,time,status) values("$title","$date","$time","new")')
            .then((value) async {
          print('inserted successfully');
        }).catchError((error) {
          print(error.toString());
        }));

    return await GetDataFromDatabase();
  }

    insertTaskByModel(Task model) async {
    var dbclient = await database;
    await dbclient.insert(taskTable, model.toJson());
    print("model.json " + model.toJson());
  }


  Future<List<Map>> GetDataFromDatabase() async {
    return await database.rawQuery('select * from tasks');
  }
}
