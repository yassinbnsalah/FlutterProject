// ignore_for_file: file_names, avoid_print, unnecessary_brace_in_string_interps, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:myproject/Data/database.dart';
import 'package:myproject/models/Composant.dart';
import 'package:myproject/models/Famille.dart';

class ComposantOperation {
  late ComposantOperation composantOperation;
  final dbProvider = ProjectDataBase.instance;

  createComposant(Composant composant) async {
    final db = await dbProvider.database;
    db.insert('COMPOSANT', composant.toMap());
    print('composant inserted');
    List<Map<String, dynamic>> allRows = await db.query('COMPOSANT');
    print(allRows);
    List<Composant> composants =
        allRows.map((composant) => Composant.fromMap(composant)).toList();
    print(composants.toString());
  }

  updateComposant(Composant composant) async {
    final db = await dbProvider.database;
    db.update('COMPOSANT', composant.toMap(),
        where: "id=?", whereArgs: [composant.id]);
  }

  deleteComposant(Composant composant) async {
    final db = await dbProvider.database;
    await db.delete('COMPOSANT', where: 'id=?', whereArgs: [composant.id]);
  }

  Future<List<Composant>> getAllCompsants() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('COMPOSANT');
    print(allRows.first);
    var firstrow = allRows.first;

    List<Composant> composants =
        allRows.map((composant) => Composant.fromMap(composant)).toList();
    //print(composants.length);
    return composants;
  }

  Future<String> FirstComposantname() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('COMPOSANT');

    var firstrow = allRows.first;

    List<Composant> composants =
        allRows.map((composant) => Composant.fromMap(composant)).toList();
    //print(composants.length);
    return composants.first.name;
  }

  deleteComposantID(int id) async {
    final db = await dbProvider.database;
    await db.execute('''
    delete from COMPOSANT WHERE ID = ${id} ''');
    print("done");
  }

  Future<String> getComposantById(int id) async {
    final db = await dbProvider.database;
    List<Map<String, Object?>> allRows = await db.rawQuery('''
    SELECT COMPOSANT.NAME FROM COMPOSANT
    WHERE COMPOSANT.id = ${id} 
    ''');
    List<Composant> composants =
        allRows.map((composant) => Composant.fromMap(composant)).toList();
    return composants.first.name;
  }

  Future<List<Composant>> getAllContactsByCategory(Famille famille) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.rawQuery('''
    SELECT * FROM COMPOSANT 
    WHERE contact.famille_id = ${famille.id}
    ''');
    List<Composant> composants =
        allRows.map((composant) => Composant.fromMap(composant)).toList();
    return composants;
  }

  Future<List<Composant>> searchContacts(String keyword) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db
        .query('contact', where: 'name LIKE ?', whereArgs: ['%$keyword%']);
    List<Composant> composants =
        allRows.map((composant) => Composant.fromMap(composant)).toList();
    return composants;
  }
}
