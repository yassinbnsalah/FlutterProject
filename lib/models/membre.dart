class Membre {
  int? id;
  late String name;
  String? prename;
  String? phone;

  Membre({
    this.id,
    required this.name,
    this.prename,
    this.phone,
  });

  Membre.fromMap(dynamic obj) {
    this.id = obj['id'];
    this.name = obj['name'];
    this.prename = obj['prename'];
    this.phone = obj['phone'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'prename': prename,
      'phone': phone,
    };
    return map;
  }

  @override
  String toString() {
    return name + " " + prename! + " :" + phone!;
  }
}
