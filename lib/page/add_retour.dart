// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:myproject/Data/emprunteOperation.dart';
import 'package:myproject/Data/retourOperation.dart';
import 'package:myproject/Widget/emprunte_retour_dropdown.dart';
import 'package:myproject/Widget/navigation_drawer.dart';
import 'package:myproject/models/Emprunte.dart';
import 'package:myproject/models/Retour.dart';

class AddRetourPage extends StatefulWidget {
  AddRetourPage({Key? key}) : super(key: key);

  @override
  _AddRetourPageState createState() => _AddRetourPageState();
}

class _AddRetourPageState extends State<AddRetourPage> {
  EmprunteOperation emprunteOperation = EmprunteOperation();
  final _retourController = TextEditingController();
  RetourOperation retourOperation = RetourOperation();
  DateTime _dateTime = DateTime.now();
  late Emprunte _selectedemprunte;
  callback(selectedemprunte) {
    setState(() {
      _selectedemprunte = selectedemprunte;

      print(_selectedemprunte.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text("Add Retour page"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder<List<Emprunte>>(
                  future: emprunteOperation.getAllEmprunte(),
                  builder: (context, snapshots) {
                    return snapshots.hasData
                        ? EmprunteRetour(snapshots.data, callback)
                        : Text('No membres');
                  },
                )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _retourController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Retour'),
              ),
            ),
            Text('${_dateTime.day}-${_dateTime.month}-${_dateTime.year}'),
            IconButton(
              icon: Icon(Icons.calendar_today),
              tooltip: 'Tap to open date picker',
              onPressed: () async {
                DateTime? _newDate = await showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: DateTime(2015, 8),
                    lastDate: DateTime(2101));
                if (_newDate != null) {
                  setState(() {
                    _dateTime = _newDate;
                  });
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final retour = Retour(
              id_emprunte: _selectedemprunte.id,
              message: _selectedemprunte.toString(),
              date_retour: _dateTime.day.toString() +
                  '/' +
                  _dateTime.month.toString() +
                  '/' +
                  _dateTime.year.toString(),
              etat: _retourController.text);
          retourOperation.createRetour(retour);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
