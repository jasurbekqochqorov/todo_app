import 'package:flutter/cupertino.dart';
import 'package:homework12/data/models/task_model_constants.dart';
import 'package:homework12/data/models/task_models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


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
    const isType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER DEFAULT 0';

    await db.execute('''CREATE TABLE ${TaskModelConstants.tableName}(
      ${TaskModelConstants.id},
      ${TaskModelConstants.title},
      ${TaskModelConstants.description},
      ${TaskModelConstants.deadline},
      ${TaskModelConstants.status},
      ${TaskModelConstants.category},
      ${TaskModelConstants.priority},
      )''');
  }

  static Future<TaskModels> insertTask(TaskModels taskModels) async{
    debugPrint("Initial id:${taskModels.id}");
    final db=await databaseInstance.database;
    int savedTaskId=await db.insert(TaskModelConstants.tableName,taskModels.toJson());
    debugPrint("saved id:$savedTaskId");
    return taskModels.copyWith(id: savedTaskId);
  }
  
  static Future<List<TaskModels>> getAllTask() async{
    final db=await databaseInstance.database;
    String orderBy="${TaskModelConstants.id} DESC";
    
    List json=await db.query(TaskModelConstants.tableName,orderBy: orderBy);
    return json.map((e) => TaskModels.fromJson(e)).toList();
  }

}