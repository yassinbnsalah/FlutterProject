import 'package:flutter/material.dart';
import 'package:myproject/models/Emprunte.dart';

class EmprunteRetour extends StatefulWidget {
  List<Emprunte>? empruntes;
  Function(Emprunte) callback;
  EmprunteRetour(this.empruntes, this.callback, {Key? key}) : super(key: key);

  @override
  _EmprunteRetourState createState() => _EmprunteRetourState();
}

class _EmprunteRetourState extends State<EmprunteRetour> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Emprunte>(
      hint: Text('select emprunte'),
      onChanged: (Emprunte? value) {
        setState(() {
          widget.callback(value!);
        });
      },
      items: widget.empruntes!.map((emprunte) {
        return DropdownMenuItem(
            value: emprunte, child: Text(emprunte.toString()));
      }).toList(),
    );
  }
}
