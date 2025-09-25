import 'package:flutter/material.dart';

class MyTile extends StatefulWidget {
  final String? date;
  final String? month;
  final String? year;

  final String title;
  final String body;

  Function()? onLongPress;
  Function()? onTap;

  MyTile({
    super.key,
    this.date,
    this.month,
    this.year,
    required this.title,
    required this.body,
    required this.onLongPress,
    required this.onTap,
  });

  @override
  State<MyTile> createState() => _MyTileState();
}

class _MyTileState extends State<MyTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.onLongPress,
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),

        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red.shade400,
                ),
                child: Column(
                  children: [
                    Text(widget.month ?? "🥱"),

                    Text(
                      widget.date ?? "🥱",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(widget.year ?? "🥱"),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),

                  SizedBox(height: 5),
                  Text(
                    widget.body,
                    maxLines: 2,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
