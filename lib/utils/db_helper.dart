import 'dart:io';
import 'package:note_keeper/model/note_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  DatabaseHelper._createInstantiate();
  static  DatabaseHelper? _databaseHelper;
  static  Database? _database;
  String tableName = "note_table";
  String colId = "id";
  String colTitle = "title";
  String colDes = "des";
  String colPriority = "priority";
  String colDate = "date";

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstantiate();
    }
    return _databaseHelper!;
  }

  Future<Database> get database async{

    if(_database==null){
      _database=await initializeDatabase();
    }
    return _database!;

  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "notes.db";
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _onCreate);
    return notesDatabase;
  }

  void _onCreate(Database db, int newVersion) {
    db.execute(
        "CREATE TABLE $tableName($colId INTERGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,$colDes TEXT,$colPriority INTEGER,$colDate TEXT)");
  }
  //fetch data
Future<List<Map<String,dynamic>>>fetchNote()async{
    Database db=await this.database;
    var result=db.query(tableName,orderBy: "$colPriority ASC");
    return result;
}

//insert data
Future<int>insertNote(NoteModel note)async{
    Database db=await this.database;
    var result=db.insert(tableName,note.toMap());
    return result;
}

//update data
Future<int>updateNote(NoteModel note)async{
    Database db=await this.database;
    var result=db.update(tableName,note.toMap(),where: "$colId= ?",whereArgs:[note.id] );
    return result;
}

//delete data
Future<int>deleteNote(int id)async{
    Database db=await this.database;
    var result=db.rawDelete("DELETE FROM $tableName WHERE $colId=$id" );
    return result;
}


//get the number of notes
Future<int?>getCount()async{
    Database db=await this.database;
    List<Map<String,dynamic>> x = await db.rawQuery("SELECT COUNT (*) from $tableName");
    int? result=Sqflite.firstIntValue(x);
    return result;
}

Future <List<NoteModel>> getNoteList() async{
    var noteMapList= await fetchNote();
    var count=noteMapList.length;
   var noteList=<NoteModel>[];
   for(int i=0; i<count;i++){
     noteList.add(NoteModel.fromMapObject(noteMapList[i]));

   }
   return noteList;

}

}
