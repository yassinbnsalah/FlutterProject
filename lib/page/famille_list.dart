// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, deprecated_member_use, prefer_final_fields, prefer_collection_literals, unused_field, unused_local_variable, avoid_function_literals_in_foreach_calls, avoid_print, void_checks

import 'package:flutter/material.dart';
import 'package:myproject/Data/database.dart';
import 'package:myproject/Data/familleOperation.dart';
import 'package:myproject/Widget/navigation_drawer.dart';
import 'package:myproject/models/Famille.dart';
import 'package:myproject/page/add_famille.dart';
import 'package:myproject/page/recherche_page.dart';

class FamillePage extends StatefulWidget {
  FamillePage({Key? key}) : super(key: key);

  @override
  _FamillePageState createState() => _FamillePageState();
}

class _FamillePageState extends State<FamillePage> {
  FamilleOperations familleOperations = FamilleOperations();
  final _familleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text("Famille page"),
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
            future: familleOperations.getAllFamilles(),
            builder: (context, AsyncSnapshot<List<Famille>> snapshot) {
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
                              title: Text(
                                  snapshot.data![position].id.toString() +
                                      ":" +
                                      snapshot.data![position].name),
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
                                            familleOperations.deleteFamilleID(
                                                snapshot.data![position].id!);
                                            await Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        FamillePage()));
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  child: const Text('DELETE'),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Text('Update famille ' +
                                          snapshot.data![position].name),
                                      content: TextFormField(
                                        controller: _familleController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Familly name'),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                            child: const Text('OK'),
                                            onPressed: () async {
                                              familleOperations.updateFamille(
                                                  snapshot.data![position].id!,
                                                  _familleController.text);
                                              await Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          FamillePage()));
                                            }),
                                      ],
                                    ),
                                  ),
                                  child: const Text('update'),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ));
                      })
                  : new Center(
                      child: Text('You have no Famille'),
                    );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('ADD FAMILLY'),
              content: TextFormField(
                controller: _familleController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Familly name'),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                    child: const Text('ADD'),
                    onPressed: () async {
                      final category = Famille(name: _familleController.text);
                      familleOperations.createFamille(category);
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FamillePage()));
                    }),
              ],
            ),
          ),
          child: Icon(Icons.add),
        ));
  }
}
