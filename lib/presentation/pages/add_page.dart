import 'package:daily_diary_sqflite_flutter/data/models/diary.dart';
import 'package:daily_diary_sqflite_flutter/presentation/providers/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final dateController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  void addDiary() async {
    final date = dateController.text.trim();
    final month = monthController.text.trim();
    final year = yearController.text.trim();
    final title = titleController.text.trim();
    final body = bodyController.text.trim();

    Diary newDiary = Diary(
      date: date.isEmpty ? null : date,
      month: month.isEmpty ? null : month,
      year: year.isEmpty ? null : year,
      title: title,
      body: body,
    );

    await Provider.of<DatabaseProvider>(
      context,
      listen: false,
    ).addDiary(newDiary);

    dateController.clear();
    monthController.clear();
    yearController.clear();
    titleController.clear();
    bodyController.clear();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Diary successfully added")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add new note to your diary..",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          IconButton(onPressed: addDiary, icon: Icon(Icons.check, size: 30)),
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
