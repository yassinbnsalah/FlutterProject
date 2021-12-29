// ignore_for_file: non_constant_identifier_names, unused_local_variable, file_names, unnecessary_this

class Famille {
  late int? id;
  late String name;

  Famille({
    this.id,
    required this.name,
  });

  Famille.fromMap(dynamic obj) {
    this.id = obj['id'];
    this.name = obj['name'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
    };

    return map;
  }
}
