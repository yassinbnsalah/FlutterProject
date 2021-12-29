// ignore_for_file: non_constant_identifier_names, unused_import, file_names, unnecessary_this, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:myproject/Data/composantOperation.dart';
import 'package:myproject/Data/database.dart';
import 'package:myproject/Data/membreOperation.dart';
import 'package:myproject/models/Composant.dart';

class Emprunte {
  int? id;
  late int composant_id;
  int? quantity;
  int? membre_id;
  late String membre_name = 'not defined';
  late String date_retour;
  late String composant_name = 'not defined';
  Emprunte({
    this.id,
    required this.composant_name,
    this.quantity,
    required this.membre_name,
    /* required this.date_retour*/
  });
  Emprunte.fromMap(dynamic obj) {
    this.id = obj['id'];
    this.composant_name = obj['composant_name'];
    this.quantity = obj['quantity'];
    this.membre_name = obj['membre_name'];
    // this.date_retour = obj['date_retour'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'composant_name': composant_name,
      'quantity': quantity,
      'membre_name': membre_name,
      // 'date_retour': date_retour
    };
    return map;
  }

  void updatename() async {
    ComposantOperation composantOperation = ComposantOperation();
    composantOperation.FirstComposantname().then((value) {
      this.composant_name = value;
    });
    print("after is after " + this.composant_name);
  }

  @override
  String toString() {
    //updatename();

    print("composant name " + composant_name);
    return this.membre_name +
        " get " +
        this.quantity.toString() +
        ' of ' +
        this.composant_name;
  }
}
