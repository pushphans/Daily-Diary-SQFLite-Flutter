import 'package:daily_diary_sqflite_flutter/data/models/diary.dart';
import 'package:daily_diary_sqflite_flutter/presentation/providers/database_provider.dart';
import 'package:daily_diary_sqflite_flutter/utils/widgets/my_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void openDeleteDialog(Diary diary) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Sure to Delete?"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("This diary will be deleted permanently. You sure to delete?"),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),

                  SizedBox(width: 5),

                  TextButton(
                    onPressed: () async {
                      Provider.of<DatabaseProvider>(
                        context,
                        listen: false,
                      ).deleteDiary(diary);
                      Navigator.pop(context);
                    },
                    child: Text("Yes"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    Provider.of<DatabaseProvider>(context, listen: false).getDiaries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Expanded(
              flex: 1,
              child: Text(
                "My Diary📖",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Consumer<DatabaseProvider>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.myDiaryList.length,
                  itemBuilder: (context, index) {
                    Diary unit = value.myDiaryList[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MyTile(
                        date: unit.date,
                        month: unit.month,
                        year: unit.year,
                        title: unit.title,
                        body: unit.body,
                        onLongPress: () {
                          openDeleteDialog(unit);
                        },

                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/update',
                            arguments: unit,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
