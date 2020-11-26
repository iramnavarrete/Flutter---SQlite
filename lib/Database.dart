import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import 'Notes.dart';
class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "notes.db");
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Notes ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "
          "note TEXT,"
          "page INTEGER"
          ")");
    });
  }

   newNoteByPage(Note note) async {
    final db = await database;
    var res = await db.insert("Notes", note.toMap());
    return res;
  }

  Future<List<Note>> getNoteByPage(int page) async {
    final db = await database;
    var res = await db.query("Notes", where: "page = ?", whereArgs: [page]);
    List<Note> list =
    res.isNotEmpty ? res.map((c) => Note.fromMap(c)).toList() : [];
    return list;
  }

  deleteNote(int id) async {
    final db = await database;
    db.delete("Notes", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Notes");
  }

}