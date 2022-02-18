import 'package:flutter/material.dart';

class CardTitle extends StatefulWidget {
  String itemTitle;
  String id;

  CardTitle(this.itemTitle, this.id);
  @override
  _CardTitleState createState() => _CardTitleState();
}

class _CardTitleState extends State<CardTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.itemTitle}',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        Row(
          children: [
            Text('Batch #'),
            Text(
              "${widget.id}",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
