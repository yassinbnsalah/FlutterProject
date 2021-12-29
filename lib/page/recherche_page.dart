// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_function_literals_in_foreach_calls, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, prefer_collection_literals, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:myproject/Data/composantOperation.dart';
import 'package:myproject/models/Composant.dart';
import 'package:myproject/page/composant_page.dart';

class RecherchePage extends StatefulWidget {
  RecherchePage({Key? key}) : super(key: key);

  @override
  _RecherchePageState createState() => _RecherchePageState();
}

class _RecherchePageState extends State<RecherchePage> {
  TextEditingController tesearch = TextEditingController();
  ComposantOperation composantOperation = ComposantOperation();
  List<Composant> allComposant = [];
  List<Composant> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    composantOperation.getAllCompsants().then((composant) {
      setState(() {
        allComposant = composant;
        items = allComposant;
      });
    });
  }

  void filterSearch(String query) async {
    // print(allComposant.toString());
    print(query);
    var dummySearchList = allComposant;
    if (query.isNotEmpty) {
      List<Composant> dummyListData = [];

      dummySearchList.forEach((item) {
        print('---------------------item-------------------');
        print(item.name);
        //Composant composant = Composant.fromMap(item);

        //print(item.toString());
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
          print(dummyListData.first.toString());
        }
      });
      setState(() {
        items = [];
        items.addAll(dummyListData);
      });
      // print(items);
      return;
    } else {
      setState(() {
        items = [];
        items = allComposant;
      });
      print("empty");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
            cursorColor: Colors.white,
            controller: tesearch,
            showCursor: true,
            onChanged: (value) {
              setState(() {
                filterSearch(value);
              });
            },
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(filled: true, hintText: "search here")),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    // Composant composant = Composant.fromMap(items[i]);
                    return Card(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.settings_input_composite_sharp),
                          title: Text(items[i].toString()),
                          //subtitle:
                          //   Text("Quantity :" + items[i].quantity.toString()),
                        ),
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text('delete of ' + items[i].name),
                                  content: Text(
                                      " are you sure to delete this item " +
                                          items[i].name),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        composantOperation
                                            .deleteComposantID(items[i].id!);
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
                        ),*/
                      ],
                    ));
                  }))
        ],
      ),
    );
  }
}
