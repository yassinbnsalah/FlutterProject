// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:myproject/models/Famille.dart';

class FamilleDropdown extends StatefulWidget {
  List<Famille>? familles;
  Function(Famille) callback;
  FamilleDropdown(
    this.familles,
    this.callback, {
    Key? key,
  }) : super(key: key);

  @override
  _FamilleDropdownState createState() => _FamilleDropdownState();
}

class _FamilleDropdownState extends State<FamilleDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Famille>(
        hint: Text('Select Famille'),
        onChanged: (Famille? value) {
          setState(() {
            widget.callback(value!);
          });
        },
        items: widget.familles!.map((famille) {
          return DropdownMenuItem(
            value: famille,
            child: Text(famille.name),
          );
        }).toList());
  }
}
