import 'dart:convert';

Note clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Note.fromMap(jsonData);
}

String clientToJson(Note data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Note {
  int id;
  String note;
  int page;

  Note({this.id, this.note, this.page});

  factory Note.fromMap(Map<String, dynamic> json) =>
      new Note(id: json["id"], note: json["note"], page: json["page"]);

  Map<String, dynamic> toMap() => {"id": id, "note": note, "page": page};
}
