// ignore_for_file: avoid_print, prefer_const_constructors, unnecessary_new, curly_braces_in_flow_control_structures, unused_local_variable, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:myproject/Data/composantOperation.dart';
import 'package:myproject/Data/emprunteOperation.dart';
import 'package:myproject/Data/membreOperation.dart';
import 'package:myproject/Widget/composant_dropdown.dart';
import 'package:myproject/Widget/member_dropdown.dart';
import 'package:myproject/Widget/navigation_drawer.dart';
import 'package:myproject/models/Composant.dart';
import 'package:myproject/models/Emprunte.dart';
import 'package:myproject/models/membre.dart';
import 'package:myproject/page/landing_page.dart';
import 'package:myproject/page/liste_emprunte.dart';
import 'package:myproject/page/recherche_page.dart';

class AddEmpruntePage extends StatefulWidget {
  AddEmpruntePage({Key? key}) : super(key: key);

  @override
  _AddEmpruntePageState createState() => _AddEmpruntePageState();
}

class _AddEmpruntePageState extends State<AddEmpruntePage> {
  final _quntityController = TextEditingController();
  final _composantController = TextEditingController();
  String _selectedDate = 'Tap to select date';
  DateTime _dateTime = DateTime.now();
  ComposantOperation composantOperation = ComposantOperation();
  MembreOperation membreOperation = MembreOperation();
  EmprunteOperation emprunteOperation = EmprunteOperation();
  late Composant _selectedComposant;
  late Membre _selectedMember;
  callback(selectedComposant) {
    setState(() {
      _selectedComposant = selectedComposant;

      print(_selectedComposant.name);
    });
  }

  callback2(selectedMember) {
    setState(() {
      _selectedMember = selectedMember;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text("emprunte page"),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RecherchePage()));
              },
              icon: Icon(Icons.search))
        ],
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder<List<Composant>>(
                  future: composantOperation.getAllCompsants(),
                  builder: (context, snapshots) {
                    return snapshots.hasData
                        ? ComposantDropdown(snapshots.data, callback)
                        : Text('No composants');
                  },
                )),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder<List<Membre>>(
                  future: membreOperation.getAllMembres(),
                  builder: (context, snapshots) {
                    return snapshots.hasData
                        ? MemberDropdown(snapshots.data, callback2)
                        : Text('No membres');
                  },
                )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _quntityController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'quantity'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final emprunte = Emprunte(
            composant_name: _selectedComposant.name,
            quantity: int.parse(_quntityController.text),
            membre_name: _selectedMember.toString(),
            /* date_retour: _dateTime.day.toString() +
                  '/' +
                  _dateTime.month.toString() +
                  '/' +
                  _dateTime.year.toString()*/
          );
          emprunteOperation.createEmprunte(emprunte);
          print(_dateTime.toString());
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EmpruntePage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
