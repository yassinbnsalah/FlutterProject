// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:myproject/Data/retourOperation.dart';
import 'package:myproject/Widget/navigation_drawer.dart';
import 'package:myproject/models/Retour.dart';
import 'package:myproject/page/add_retour.dart';
import 'package:myproject/page/recherche_page.dart';

class RetourPage extends StatefulWidget {
  RetourPage({Key? key}) : super(key: key);

  @override
  _RetourPageState createState() => _RetourPageState();
}

class _RetourPageState extends State<RetourPage> {
  RetourOperation retourOperation = RetourOperation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text("Retour page"),
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
          future: retourOperation.getAllRetour(),
          builder: (context, AsyncSnapshot<List<Retour>> snapshot) {
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
                            leading: Icon(Icons.settings_input_composite_sharp),
                            title: Text(snapshot.data![position].message +
                                " : " +
                                snapshot.data![position].date_retour +
                                " etat de retour " +
                                snapshot.data![position].etat),
                          ),
                        ],
                      ));
                    })
                : new Center(child: Text("data"));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddRetourPage()),
            );
          },
          child: Icon(Icons.add),
        ));
  }
}
