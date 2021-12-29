// ignore_for_file: empty_constructor_bodies, non_constant_identifier_names, duplicate_ignore, file_names, unnecessary_this

class Composant {
  int? id;
  late String name;
  int? quantity;
  int? famille_id;

  Composant({this.id, required this.name, this.quantity, this.famille_id});
  Composant.fromMap(dynamic obj) {
    this.id = obj['id'];
    this.name = obj['name'];
    this.quantity = obj['quantity'];
    this.famille_id = int.parse(obj['famille_id']);
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'quantity': quantity,
      'famille_id': famille_id,
    };

    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return name + " quantity " + quantity.toString();
  }
}
