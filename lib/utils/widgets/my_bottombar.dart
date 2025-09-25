import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomBar extends StatefulWidget {
  Function(int) onTabChanged;
  MyBottomBar({super.key, required this.onTabChanged});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: GNav(
        activeColor: Colors.grey.shade900,
        tabBackgroundColor: Colors.grey.shade400,
        tabBorderRadius: 20,
        mainAxisAlignment: MainAxisAlignment.center,

        onTabChange: (value) {
          widget.onTabChanged(value);
        },

        tabs: [
          GButton(icon: Icons.book, text: "Diary"),

          GButton(icon: Icons.add, text: "Add"),
        ],
      ),
    );
  }
}
