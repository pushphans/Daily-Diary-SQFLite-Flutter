import 'package:daily_diary_sqflite_flutter/presentation/providers/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/diary.dart';

class UpdatePage extends StatefulWidget {
  final Diary diary;
  const UpdatePage({super.key, required this.diary});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late final dateController = TextEditingController(text: widget.diary.date);
  late final monthController = TextEditingController(text: widget.diary.month);
  late final yearController = TextEditingController(text: widget.diary.year);
  late final titleController = TextEditingController(text: widget.diary.title);
  late final bodyController = TextEditingController(text: widget.diary.body);

  void updateDiary() async {
    final Diary diary = Diary(
      id: widget.diary.id,
      date: dateController.text.isEmpty ? "🥱" : dateController.text,
      month: monthController.text.isEmpty ? "🥱" : monthController.text.trim(),
      year: yearController.text.isEmpty ? "🥱" : yearController.text.trim(),
      title: titleController.text.trim(),
      body: bodyController.text.trim(),
    );

    await Provider.of<DatabaseProvider>(
      context,
      listen: false,
    ).updateDiary(diary);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Updated successfully..")));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update your note..",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          IconButton(onPressed: updateDiary, icon: Icon(Icons.check, size: 30)),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                        labelText: "Date",
                        labelStyle: TextStyle(color: Colors.grey.shade200),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 5),

                  Expanded(
                    child: TextField(
                      controller: monthController,
                      decoration: InputDecoration(
                        labelText: "Month",
                        labelStyle: TextStyle(color: Colors.grey.shade200),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 5),

                  Expanded(
                    child: TextField(
                      controller: yearController,
                      decoration: InputDecoration(
                        labelText: "Year",
                        labelStyle: TextStyle(color: Colors.grey.shade200),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: titleController,
              minLines: 1,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "Write your title here",
                labelStyle: TextStyle(color: Colors.grey.shade200),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: bodyController,
              minLines: 1,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "Write your diary here",
                labelStyle: TextStyle(color: Colors.grey.shade200),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
