import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  String text;
  Color color;
  Color backgroundColor;
  CustomeButton(this.text, this.color, this.backgroundColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color,
            // spreadRadius: 5.0,
            offset: Offset(0, 6),
            blurRadius: 5,
          )
        ],
        borderRadius: BorderRadius.circular(10),
        // color: Color(0xff23bf5a),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
