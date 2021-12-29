// ignore_for_file: file_names, avoid_print, unnecessary_brace_in_string_interps

import 'package:myproject/Data/database.dart';
import 'package:myproject/models/Famille.dart';

class FamilleOperations {
  late FamilleOperations familleoperation;

  final dbProvider = ProjectDataBase.instance;
  createFamille(Famille famille) async {
    final db = await dbProvider.database;
    db.insert('FAMILLE', famille.toMap());

    List<Map<String, dynamic>> allRows = await db.query('FAMILLE');
    List<Famille> familles =
        allRows.map((famille) => Famille.fromMap(famille)).toList();
    print(familles);
  }

  Future<List<Famille>> getAllFamilles() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('FAMILLE');

    List<Famille> familles =
        allRows.map((famille) => Famille.fromMap(famille)).toList();
    return familles;
  }

  deleteFamilleID(int id) async {
    final db = await dbProvider.database;
    await db.execute('''
    delete from FAMILLE WHERE ID = ${id} ''');
    print("done");
  }

  updateFamille(int id, String name) async {
    final db = await dbProvider.database;
    await db.execute('''
    update FAMILLE
    set name = "${name}"
    where ID = ${id}
    ''');
    print("done");
  }
}
