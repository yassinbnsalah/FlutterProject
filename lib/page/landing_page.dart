// ignore_for_file: prefer_const_literals_to_create_immutables, deprecated_member_use, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:myproject/Widget/navigation_drawer.dart';
import 'package:myproject/page/add_composant.dart';
import 'package:myproject/page/add_emprunte.dart';
import 'package:myproject/page/add_famille.dart';
import 'package:myproject/page/add_membre.dart';
import 'package:myproject/page/add_retour.dart';
import 'package:myproject/page/composant_page.dart';
import 'package:myproject/page/liste_emprunte.dart';
import 'package:myproject/page/liste_membre.dart';
import 'package:myproject/page/liste_retour.dart';
import 'package:myproject/page/recherche_page.dart';
import 'package:myproject/page/signin_page.dart';

class Landingpage extends StatefulWidget {
  Landingpage({Key? key}) : super(key: key);

  @override
  _LandingpageState createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  int selectedPage = 0;

  final _pageOptions = [ComposantPage(), EmpruntePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text("Home page"),
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
        body: Center());
  }
}
