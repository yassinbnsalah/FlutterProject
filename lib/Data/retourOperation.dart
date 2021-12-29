// ignore_for_file: unused_import, file_names

import 'package:myproject/Data/database.dart';
import 'package:myproject/models/Retour.dart';

class RetourOperation {
  late RetourOperation retourOperation;
  final dbProvider = ProjectDataBase.instance;

  createRetour(Retour retour) async {
    final db = await dbProvider.database;
    db.insert('RETOUR_EMPRUNTE', retour.toMap());
    //print(retour.toMap());
    print("retour inserted successfully");
    db.execute('DELETE FROM EMPRUNTE WHERE id = ${retour.id_emprunte}');
    print("delete emprunt success");
    List<Map<String, dynamic>> allRows = await db.query('RETOUR_EMPRUNTE');
    print(allRows.toList());
  }

  Future<List<Retour>> getAllRetour() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('RETOUR_EMPRUNTE');
    print(allRows.toList());
    List<Retour> retours =
        allRows.map((retour) => Retour.fromMap(retour)).toList();
    print(retours.toString());
    return retours;
  }
}
