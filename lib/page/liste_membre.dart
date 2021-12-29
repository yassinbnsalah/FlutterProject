// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:myproject/Data/membreOperation.dart';
import 'package:myproject/Widget/navigation_drawer.dart';
import 'package:myproject/models/membre.dart';
import 'package:myproject/page/add_membre.dart';
import 'package:myproject/page/recherche_page.dart';

class MemberListe extends StatefulWidget {
  MemberListe({Key? key}) : super(key: key);

  @override
  _MemberListeState createState() => _MemberListeState();
}

class _MemberListeState extends State<MemberListe> {
  MembreOperation membreOperation = MembreOperation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text("Member page"),
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
            future: membreOperation.getAllMembres(),
            builder: (context, AsyncSnapshot<List<Membre>> snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, position) {
                        return Card(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.account_circle),
                              title: Text(snapshot.data![position].prename! +
                                  " " +
                                  snapshot.data![position].name),
                              subtitle: Text(snapshot.data![position].phone!),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  child: const Text('DELETE'),
                                  onPressed: () async {
                                    membreOperation.deleteMembreID(
                                        snapshot.data![position].id!);
                                    await Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MemberListe()));
                                  },
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  child: const Text('UPDATE'),
                                  onPressed: () {/* ... */},
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ));
                      })
                  : new Center(
                      child: Text("no members here"),
                    );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddMembrePage()),
            );
          },
          child: Icon(Icons.add),
        ));
  }
}
