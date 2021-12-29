// ignore_for_file: prefer_const_declarations, unused_local_variable, unnecessary_string_interpolations, avoid_print, import_of_legacy_library_into_null_safe

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProjectDataBase {
  static final ProjectDataBase instance = ProjectDataBase._init();
  static Database? _database;
  ProjectDataBase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('ProjectFlutter1.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE FAMILLE (
      id Integer PRIMARY KEY AUTOINCREMENT , 
      name text NOT NULL
);''');
    await db.execute('''
    CREATE TABLE COMPOSANT (
     id Integer primary key AUTOINCREMENT , 
      name text NOT NULL ,
      quantity Integer NOT NULL , 
      famille_id text NOT NULL , 
      FOREIGN KEY(famille_id) REFERENCES FAMILLE(id) );  ''');
    await db.execute('''
    CREATE TABLE MEMBRE ( 
      id Integer primary key AUTOINCREMENT , 
      name text Not Null , 
      prename text Not Null , 
      phone text Not Null 
    );
    ''');
    await db.execute(''' 
    CREATE TABLE EMPRUNTE (
      id integer primary key AUTOINCREMENT , 
      composant_name text not null , 
      quantity integer not null , 
      membre_name text not null 
    );
    ''');
    await db.execute('''
    CREATE TABLE RETOUR_EMPRUNTE(
      id integer primary key AUTOINCREMENT, 
      message text not null , 
      date_retour text not null , 
      etat text not null
    );
    ''');
    print("done");
  }

  Future close() async {
    final db = await instance.database;
  }
}
