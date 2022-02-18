import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  TextEditingController taxrate;
  String text;
  int amount;
  CustomTextFormField(this.taxrate, this.text);
  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      decoration: BoxDecoration(
          // border: Border.all(
          //     color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(9),
          color: Colors.white),
      child: TextFormField(
        onChanged: (value) {},
        controller: widget.taxrate,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            hintText: widget.text,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9))),
      ),
    );
  }
}
