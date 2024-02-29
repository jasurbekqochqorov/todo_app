import 'package:flutter/cupertino.dart';
import 'package:homework12/data/models/category/category_model_constants.dart';
import 'package:homework12/data/models/task/task_model_constants.dart';
import 'package:homework12/data/models/task/task_models.dart';
import 'package:homework12/data/models/task/task_status.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../category/category_model.dart';


class LocalDatabase{
  static final databaseInstance=LocalDatabase._();
  LocalDatabase._();

  factory LocalDatabase(){
    return databaseInstance;
  }

  Database? _database;

  Future<Database> get database async{
    if(_database!=null){
      return _database!;
    }
    else{
      _database=await _init("todo.db");
      return  _database!;
    }
  }
  Future<Database> _init(String databaseName) async{
    String internalPath=await getDatabasesPath();
    String path=join(internalPath,databaseName);
    return await openDatabase(
      path,
      version: 1,
    onCreate: _onCreate,
    );

  }

  Future<void> _onCreate(Database db,int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER DEFAULT 0';

    await db.execute('''CREATE TABLE ${TaskModelConstants.tableName} (
      ${TaskModelConstants.id} $idType,
      ${TaskModelConstants.title} $textType,
      ${TaskModelConstants.description} $textType,
      ${TaskModelConstants.deadline} $textType,
      ${TaskModelConstants.status} $textType,
      ${TaskModelConstants.category} $textType,
      ${TaskModelConstants.priority} $intType
      )''');

    await db.execute('''CREATE TABLE ${CategoryModelConstants.tableName} (
      ${CategoryModelConstants.id} $idType,
      ${CategoryModelConstants.title} $textType,
      ${CategoryModelConstants.iconPath} $textType,
      ${CategoryModelConstants.color} $textType
      )''');
  }
  // -------------------------tasks----------------
  static Future<TaskModels> insertTask(TaskModels taskModels) async{
    debugPrint("Initial id:${taskModels.id}");
    final db=await databaseInstance.database;
    int savedTaskId=await db.insert(TaskModelConstants.tableName,taskModels.toJson());
    debugPrint("saved id:$savedTaskId");
    debugPrint("Initial id:${taskModels.id}");
    return taskModels.copyWith(id: savedTaskId);
  }
  
  static Future<List<TaskModels>> getAllTask() async{
    final db=await databaseInstance.database;
    String orderBy="${TaskModelConstants.id} DESC";
    
    List json=await db.query(TaskModelConstants.tableName,orderBy: orderBy);
    return json.map((e) => TaskModels.fromJson(e)).toList();
  }

  static Future<int> deleteTask(int id) async {
    final db=await databaseInstance.database;
    int deletedId=await db.delete(
      TaskModelConstants.tableName,
      where:"${TaskModelConstants.id} = ?",
      whereArgs: [id],
    );
    return deletedId;
  }


  static Future<int> updateTask(TaskModels taskModels,int id) async {
    final db=await databaseInstance.database;
    int updatedId=await db.update(
        TaskModelConstants.tableName,
       taskModels.toJson(),
        where:"${TaskModelConstants.id} = ?",
        whereArgs: [id]);

    return updatedId;
  }

  static Future<int> updateTaskStatus({
    required String newStatus,
    required int  taskId,
}) async {
    final db=await databaseInstance.database;
    int updatedId=await db.update(
      TaskModelConstants.tableName,
      {
        TaskModelConstants.status:newStatus
      },
      where:"${TaskModelConstants.id} = ?",
    whereArgs: [taskId]);

    return updatedId;
  }

  static Future<List<TaskModels>> searchTasks(String query)async{
    final db=await databaseInstance.database;
    var json=await db.query(
      TaskModelConstants.tableName,
      where:"${TaskModelConstants.title} LIKE ?",
      whereArgs: ["$query%"]
    );
    return json.map((e) => TaskModels.fromJson(e)).toList();
}


// --------------------------------categories------------------
  static Future<CategoryModel> insertCategory(CategoryModel categoryModel) async{
    debugPrint("Initial id:${categoryModel.id}");
    final db=await databaseInstance.database;
    int savedTaskId=await db.insert(CategoryModelConstants.tableName,categoryModel.toJson());
    debugPrint("saved id:$savedTaskId");
    debugPrint("Initial id:${categoryModel.id}");
    return categoryModel.copyWith(id: savedTaskId);
  }

  static Future<List<CategoryModel>> getAllCategory() async{
    final db=await databaseInstance.database;
    String orderBy="${CategoryModelConstants.id} DESC";
    List json=await db.query(CategoryModelConstants.tableName,orderBy: orderBy);
    return json.map((e) => CategoryModel.fromJson(e)).toList();
  }

}