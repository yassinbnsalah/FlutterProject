// ignore_for_file: unused_field, prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myproject/Data/composantOperation.dart';
import 'package:myproject/Data/familleOperation.dart';
import 'package:myproject/Widget/famille_dropdown.dart';
import 'package:myproject/Widget/navigation_drawer.dart';
import 'package:myproject/models/Composant.dart';
import 'package:myproject/models/Famille.dart';
import 'package:myproject/page/composant_page.dart';

class AddCompsantPage extends StatefulWidget {
  AddCompsantPage({Key? key}) : super(key: key);

  @override
  _AddCompsantPageState createState() => _AddCompsantPageState();
}

class _AddCompsantPageState extends State<AddCompsantPage> {
  final _nameController = TextEditingController();
  final _quntityController = TextEditingController();
  FamilleOperations familleOperations = FamilleOperations();
  ComposantOperation composantOperation = ComposantOperation();
  late Famille _selectedFamille;
  callback(selectedFamille) {
    setState(() {
      _selectedFamille = selectedFamille;
      print(_selectedFamille.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text("Add Composant page"),
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
                controller: _nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _quntityController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'quantity'),
              ),
            ),
            FutureBuilder<List<Famille>>(
              future: familleOperations.getAllFamilles(),
              builder: (context, snapshots) {
                return snapshots.hasData
                    ? FamilleDropdown(snapshots.data, callback)
                    : Text('No familles');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final contact = Composant(
              name: _nameController.text,
              quantity: int.parse(_quntityController.text),
              famille_id: _selectedFamille.id);
          composantOperation.createComposant(contact);
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ComposantPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
