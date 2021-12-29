// ignore_for_file: non_constant_identifier_names, file_names, unnecessary_this

class Retour {
  late int? id;
  late String message;
  int? id_emprunte;
  late String date_retour;
  late String etat;
  Retour(
      {this.id,
      required this.id_emprunte,
      required this.message,
      required this.date_retour,
      required this.etat});

  Retour.fromMap(dynamic obj) {
    this.id = obj['id'];
    this.message = obj['message'];
    this.date_retour = obj['date_retour'];
    this.etat = obj['etat'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'message': message,
      'date_retour': date_retour,
      'etat': etat
    };
    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.message +
        ":" +
        this.date_retour +
        " etat de retour " +
        this.etat;
  }
}
