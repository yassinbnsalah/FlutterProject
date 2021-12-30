// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myproject/Widget/drawer_item.dart';
import 'package:myproject/page/add_famille.dart';
import 'package:myproject/page/add_membre.dart';
import 'package:myproject/page/composant_page.dart';
import 'package:myproject/page/famille_list.dart';
import 'package:myproject/page/landing_page.dart';
import 'package:myproject/page/liste_emprunte.dart';
import 'package:myproject/page/liste_membre.dart';
import 'package:myproject/page/liste_retour.dart';
import 'package:myproject/page/signin_page.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.65;
    double menuContainerHeight = mediaQuery.height / 2;
    return Drawer(
        child: Material(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
              child: Column(
                children: [
                  Container(
                    height: mediaQuery.height * 0.25,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            'https://www.iirld.com/work/img/admin.png',
                            width: sidebarSize / 2,
                          ),
                          Text(
                            "admin",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Divider(
                    thickness: 1,
                    height: 10,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DrawerItem(
                      name: "famille",
                      icon: Icons.family_restroom,
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FamillePage()));
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  DrawerItem(
                      name: "Composant",
                      icon: Icons.electrical_services,
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ComposantPage()));
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  DrawerItem(
                      name: "Members",
                      icon: Icons.person,
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MemberListe()));
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  DrawerItem(
                      name: "emprunte",
                      icon: Icons.stacked_bar_chart,
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EmpruntePage()));
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  DrawerItem(
                      name: "Retour",
                      icon: Icons.backup,
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RetourPage()));
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  const Divider(
                    thickness: 1,
                    height: 10,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DrawerItem(
                      name: "Logout",
                      icon: Icons.logout,
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInPage()));
                      }),
                ],
              ),
            )));
  }

  Widget headerWidget() {
    return Text("data");
  }
}
