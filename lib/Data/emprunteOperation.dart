// ignore_for_file: file_names, avoid_print

import 'package:myproject/Data/database.dart';
import 'package:myproject/models/Emprunte.dart';

class EmprunteOperation {
  late EmprunteOperation emprunteOperation;
  final dbProvider = ProjectDataBase.instance;

  createEmprunte(Emprunte emprunte) async {
    final db = await dbProvider.database;
    db.insert('EMPRUNTE', emprunte.toMap());
    print("emprunte insert successfuly");
    List<Map<String, dynamic>> allRows = await db.query('EMPRUNTE');

    print(allRows.toList());
  }

  Future<List<Emprunte>> getAllEmprunte() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('EMPRUNTE');
    print("allRows");
    print(allRows);

    List<Emprunte> empruntes =
        allRows.map((emprunte) => Emprunte.fromMap(emprunte)).toList();
    print(empruntes.toString());
    return empruntes;
  }

  deleteEmprunteID(int id) async {
    final db = await dbProvider.database;
    await db.execute('''
    delete from EMPRUNTE WHERE ID = ${id} ''');
    print("done");
  }
}
