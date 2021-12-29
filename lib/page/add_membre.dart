// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myproject/Data/membreOperation.dart';
import 'package:myproject/models/membre.dart';
import 'package:myproject/page/liste_membre.dart';

class AddMembrePage extends StatefulWidget {
  AddMembrePage({Key? key}) : super(key: key);

  @override
  _AddMembrePageState createState() => _AddMembrePageState();
}

class _AddMembrePageState extends State<AddMembrePage> {
  final _namecontroller = TextEditingController();
  final _prenamecontroller = TextEditingController();
  final _phonecontroller = TextEditingController();

  MembreOperation membreOperation = MembreOperation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFLite Tutorial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _namecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _prenamecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'prename'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _phonecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'phone'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final membre = Membre(
            name: _namecontroller.text,
            prename: _prenamecontroller.text,
            phone: _phonecontroller.text,
          );
          membreOperation.createMembre(membre);
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MemberListe()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
