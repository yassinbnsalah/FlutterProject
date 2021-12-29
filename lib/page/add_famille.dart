// ignore_for_file: unused_field, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myproject/Data/familleOperation.dart';
import 'package:myproject/Widget/navigation_drawer.dart';
import 'package:myproject/models/Famille.dart';
import 'package:myproject/page/famille_list.dart';

class AddFamillePage extends StatefulWidget {
  AddFamillePage({Key? key}) : super(key: key);

  @override
  _AddFamillePageState createState() => _AddFamillePageState();
}

class _AddFamillePageState extends State<AddFamillePage> {
  final _familleController = TextEditingController();
  FamilleOperations familleoperation = FamilleOperations();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text("Home page"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _familleController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Familly name'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final category = Famille(name: _familleController.text);
          familleoperation.createFamille(category);
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FamillePage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
