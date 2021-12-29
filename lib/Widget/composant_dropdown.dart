// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:myproject/models/Composant.dart';

class ComposantDropdown extends StatefulWidget {
  List<Composant>? composants;
  Function(Composant) callback;

  ComposantDropdown(this.composants, this.callback, {Key? key})
      : super(key: key);

  @override
  _ComposantDropdownState createState() => _ComposantDropdownState();
}

class _ComposantDropdownState extends State<ComposantDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Composant>(
        hint: Text('select Composant'),
        onChanged: (Composant? value) {
          setState(() {
            widget.callback(value!);
          });
        },
        items: widget.composants!.map((composant) {
          return DropdownMenuItem(
            value: composant,
            child: Text(composant.name),
          );
        }).toList());
  }
}
