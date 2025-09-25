import 'package:daily_diary_sqflite_flutter/presentation/pages/add_page.dart';
import 'package:daily_diary_sqflite_flutter/presentation/pages/home.dart';
import 'package:daily_diary_sqflite_flutter/utils/widgets/my_bottombar.dart';
import 'package:flutter/material.dart';

class PageList extends StatefulWidget {
  const PageList({super.key});

  @override
  State<PageList> createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  int selectedIndex = 0;

  void changeSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = [Home(), AddPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: SafeArea(
        child: MyBottomBar(onTabChanged: changeSelectedIndex),
      ),
    );
  }
}
