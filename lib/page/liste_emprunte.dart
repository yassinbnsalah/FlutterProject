// ignore_for_file: avoid_print, prefer_const_constructors, unnecessary_new, unused_local_variable

import 'package:flutter/material.dart';
import 'package:myproject/Data/emprunteOperation.dart';
import 'package:myproject/Data/membreOperation.dart';
import 'package:myproject/Widget/navigation_drawer.dart';
import 'package:myproject/models/Emprunte.dart';
import 'package:myproject/page/add_emprunte.dart';
import 'package:myproject/page/recherche_page.dart';

class EmpruntePage extends StatefulWidget {
  EmpruntePage({Key? key}) : super(key: key);

  @override
  _EmpruntePageState createState() => _EmpruntePageState();
}

class _EmpruntePageState extends State<EmpruntePage> {
  EmprunteOperation emprunteOperation = EmprunteOperation();
  MembreOperation membreOperation = MembreOperation();
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
      body: FutureBuilder(
          future: emprunteOperation.getAllEmprunte(),
          builder: (context, AsyncSnapshot<List<Emprunte>> snapshot) {
            if (snapshot.hasError) print('hey ${snapshot.error}');
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, int position) {
                      return Card(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading:
                                    Icon(Icons.settings_input_composite_sharp),
                                title: Text(snapshot
                                        .data![position].membre_name +
                                    " get " +
                                    snapshot.data![position].composant_name),
                                subtitle: Text("quantity :" +
                                    snapshot.data![position].quantity
                                        .toString()),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    TextButton(
                                      child: const Text('DELETE'),
                                      onPressed: () async {
                                        emprunteOperation.deleteEmprunteID(
                                            snapshot.data![position].id!);
                                        await Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EmpruntePage()));
                                      },
                                    ),
                                  ])
                            ]),
                      );
                    })
                : new Center(
                    child: Text('You have no emprunte'),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddEmpruntePage()),
          );
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
