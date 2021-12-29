// ignore_for_file: unused_local_variable, file_names, avoid_print, unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'package:myproject/Data/database.dart';
import 'package:myproject/models/membre.dart';

class MembreOperation {
  late MembreOperation membreOperation;
  final dbProvider = ProjectDataBase.instance;

  createMembre(Membre membre) async {
    final db = await dbProvider.database;
    db.insert('MEMBRE', membre.toMap());
    print("membre inserted");
    List<Map<String, dynamic>> allRows = await db.query('MEMBRE');
    print(allRows);
  }

  deleteMembre(Membre membre) async {
    final db = await dbProvider.database;
    await db.delete('MEMBRE', where: 'id = ?', whereArgs: [membre.id]);
  }

  deleteMembreID(int id) async {
    final db = await dbProvider.database;
    await db.execute('''
    delete from MEMBRE WHERE ID = ${id} ''');
    print("done");
  }

  Future<Membre> GetMember(String name) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> Rows =
        await db.query('MEMBRE', where: 'name = ?', whereArgs: [name]);
    Membre firstmembre =
        Rows.map((membre) => Membre.fromMap(membre)).toList().first;

    return firstmembre;
  }

  Future<List<Membre>> getAllMembres() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('MEMBRE');
    print(allRows);
    List<Membre> membres =
        allRows.map((membre) => Membre.fromMap(membre)).toList();
    return membres;
  }
}
