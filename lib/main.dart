// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myproject/page/add_composant.dart';
import 'package:myproject/page/add_famille.dart';
import 'package:myproject/page/landing_page.dart';
import 'package:myproject/page/signin_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Project KBR';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: SignInPage(),
      );
}
