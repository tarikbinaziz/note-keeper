// import 'dart:io';
//
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DatabaseHelper{
//
// static late DatabaseHelper databaseHelper;  //singleton variable
// DatabaseHelper._createInstance();  // named constructor to create instance of class
//
// factory DatabaseHelper(){
//   if(databaseHelper==null){
//     databaseHelper=DatabaseHelper._createInstance();
//   }
//   return databaseHelper;
// }
//   initialDatabase() async{
//
//   // select path
//   Directory directory=await getApplicationDocumentsDirectory();
//   String path=directory.path+"note_table.db";
//
//   // open database
//     openDatabase(path,version: 1,onCreate: _onCreate);
//
//   }
// void _onCreate( Database db, int version)async{
//
//   db.execute(sql);
//
// }
//
// }