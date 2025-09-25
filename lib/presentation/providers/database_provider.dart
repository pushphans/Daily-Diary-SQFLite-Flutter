import 'dart:developer';

import 'package:daily_diary_sqflite_flutter/data/models/diary.dart';
import 'package:daily_diary_sqflite_flutter/data/services/database_service.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  final dbService = DatabaseService();
  List<Diary> myDiaryList = [];
  bool isLoading = false;

  Future<void> addDiary(Diary diary) async {
    isLoading = true;
    try {
      await dbService.addDiary(diary);
      await getDiaries();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getDiaries() async {
    isLoading = true;
    try {
      myDiaryList = await dbService.getDiaries();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateDiary(Diary diary) async {
    isLoading = true;
    try {
      await dbService.updateDiary(diary);
      await getDiaries();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteDiary(Diary diary) async {
    isLoading = true;
    try {
      await dbService.deleteDiary(diary);
      await getDiaries();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
