// ignore_for_file: type_init_formals, avoid_unnecessary_containers, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myproject/Data/composantOperation.dart';
import 'package:myproject/models/Composant.dart';

class ComposantList extends StatelessWidget {
  List<Composant>? composants;
  ComposantOperation composantOperation = ComposantOperation();
  ComposantList(List<Composant> this.composants, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: composants!.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key('${composants![index].id}'),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          ' ${composants![index].id} ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' ${composants![index].name}  ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        /* Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditContactPage(
                                            contact: contacts[index],
                                          )));
                            },
                            color: Colors.orange,
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
                        ),*/
                      ],
                    ),
                  )),
            ),
            onDismissed: (direction) {
              composantOperation.deleteComposant(composants![index]);
            },
          );
        },
      ),
    );
  }
}
