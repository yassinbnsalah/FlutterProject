// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:myproject/models/membre.dart';

class MemberDropdown extends StatefulWidget {
  List<Membre>? membres;
  Function(Membre) callback;
  MemberDropdown(this.membres, this.callback, {Key? key}) : super(key: key);

  @override
  _MemberDropdownState createState() => _MemberDropdownState();
}

class _MemberDropdownState extends State<MemberDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Membre>(
        hint: Text('select member'),
        onChanged: (Membre? value) {
          setState(() {
            widget.callback(value!);
          });
        },
        items: widget.membres!.map((member) {
          return DropdownMenuItem(
              value: member, child: Text(member.toString()));
        }).toList());
  }
}
