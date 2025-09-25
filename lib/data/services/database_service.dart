import 'dart:developer';

import 'package:daily_diary_sqflite_flutter/data/models/diary.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Future<Database> myDatabase() async {
    final Database myDatabase = await openDatabase(
      join(await getDatabasesPath(), "diary_database.db"),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE diary(id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'date TEXT,'
          ' month TEXT,'
          ' year TEXT,'
          ' title TEXT,'
          ' body TEXT'
          ')',
        );
      },
      version: 1,
    );

    return myDatabase;
  }

  Future<void> addDiary(Diary diary) async {
    final db = await myDatabase();
    final addedId = await db.insert("diary", diary.toMap());
    log("Diary added at id $addedId");
  }

  Future<List<Diary>> getDiaries() async {
    List<Diary> diaryList = [];
    final db = await myDatabase();

    final data = await db.query("diary");

    for (var i in data) {
      diaryList.add(Diary.fromMap(i));
    }

    return diaryList;
  }

  Future<void> updateDiary(Diary diary) async {
    final db = await myDatabase();

    final updatedResultId = await db.update(
      "diary",
      diary.toMap(),
      where: "id = ?",
      whereArgs: [diary.id],
    );

    log("Updated the diary at id $updatedResultId");
  }

  deleteDiary(Diary diary) async {
    final db = await myDatabase();

    final deletedId = await db.delete(
      'diary',
      where: "id = ?",
      whereArgs: [diary.id],
    );

    log("Deleted diary at $deletedId");
  }
}
