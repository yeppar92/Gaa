
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHandler{

  static final DatabaseHandler databaseHandler = DatabaseHandler._internal();
  static Database? database;

  DatabaseHandler._internal();



  factory DatabaseHandler(){
   return databaseHandler;
  }



  Future<Database?> openDB() async{
   database = await openDatabase(
     join(await getDatabasesPath(),'gaa.db')



   );
   return database;

  }

}