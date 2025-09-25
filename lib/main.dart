import 'package:daily_diary_sqflite_flutter/data/models/diary.dart';
import 'package:daily_diary_sqflite_flutter/presentation/pages/add_page.dart';
import 'package:daily_diary_sqflite_flutter/presentation/pages/home.dart';
import 'package:daily_diary_sqflite_flutter/presentation/pages/update_page.dart';
import 'package:daily_diary_sqflite_flutter/presentation/providers/database_provider.dart';
import 'package:daily_diary_sqflite_flutter/utils/page_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DatabaseProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.dark()),

      home: PageList(),
      routes: {'/home': (context) => Home(), '/add': (context) => AddPage()},

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/update':
            {
              Diary diary = settings.arguments as Diary;
              return MaterialPageRoute(
                builder: (context) => UpdatePage(diary: diary),
              );
            }
        }
      },
    );
  }
}
