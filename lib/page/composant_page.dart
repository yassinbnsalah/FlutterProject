// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, unnecessary_new, prefer_const_constructors, prefer_typing_uninitialized_variables, empty_constructor_bodies, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:myproject/Data/composantOperation.dart';
import 'package:myproject/Data/familleOperation.dart';
import 'package:myproject/Widget/contact_list.dart';
import 'package:myproject/Widget/famille_dropdown.dart';
import 'package:myproject/Widget/navigation_drawer.dart';
import 'package:myproject/models/Composant.dart';
import 'package:myproject/models/Famille.dart';
import 'package:myproject/page/add_composant.dart';
import 'package:myproject/page/recherche_page.dart';

class ComposantPage extends StatefulWidget {
  ComposantPage({Key? key}) : super(key: key);

  @override
  _ComposantPageState createState() => _ComposantPageState();
}

class _ComposantPageState extends State<ComposantPage> {
  late List<Composant> comp = [];
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

  //composantOperation.getAllCompsants().then((value) => { comp = value });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text("Composant page"),
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
            future: composantOperation.getAllCompsants(),
            builder: (context, AsyncSnapshot<List<Composant>> snapshot) {
              if (snapshot.hasError) print('hey ${snapshot.error}');
              print(comp);
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
                              title: Text(snapshot.data![position].name),
                              subtitle: Text("Quantity :" +
                                  snapshot.data![position].quantity.toString()),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Text('delete of ' +
                                          snapshot.data![position].name),
                                      content: Text(
                                          " are you sure to delete this item " +
                                              snapshot.data![position].name),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            composantOperation
                                                .deleteComposantID(snapshot
                                                    .data![position].id!);
                                            await Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ComposantPage()));
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  child: const Text('DELETE'),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ));
                      })
                  : new Center(
                      child: Text('You have no composant'),
                    );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddCompsantPage()),
            );
          },
          child: Icon(Icons.add),
        ));
  }
}
