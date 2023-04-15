import 'dart:io';
import 'package:note_keeper/model/note_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //singletone object create
  static late DatabaseHelper databaseHelper;
  static late Database _database;

  String tableName = "note_table";
  String colId = "id";
  String colTitle = "title";
  String colDes = "des";
  String colPriority = "priority";
  String colDate = "date";

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    databaseHelper ??= DatabaseHelper._createInstance();
    return databaseHelper;
  }

  //Database create
  Future<Database> get database async{
    _database ??= await initializeDatabase();
    return _database;

  }

  // Database create and open
  initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "note.db";

    openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int newVersion) {
    db.execute(
        "CREATE TABLE $tableName($colId INTEGER PRIMARY KEY AUTOINCREAMENT, $colPriority INTEGER,$colDate TEXT,$colDes TEXT,$colTitle TEXT)");
  }
  
  Future<List<Map<String, dynamic>>>fetchNote()async{
    Database db= await this.database;
    var result=db.query(tableName,orderBy: "$colId ASC");
    return result;
  }

  Future<Future<int>>insetNote(NoteModel note)async{
    Database db= await this.database;
    var result=db.insert(tableName,note.toMap());
    return result;
  }
  Future<Future<int>>updateNote(NoteModel note)async{
    Database db= await this.database;
    var result=db.update(tableName,note.toMap(),where: "$colId= ?",whereArgs:[ note.id]);
    return result;
  }

  Future<Future<int>>deleteNote(int id)async{
    Database db= await this.database;
    var result=db.rawDelete("DELETE FROM $tableName,WHERE $colId=$id");
    return result;
  }
  
  
}
