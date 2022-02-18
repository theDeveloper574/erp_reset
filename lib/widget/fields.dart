import 'package:flutter/material.dart';

class CustomeFields extends StatelessWidget {
  String hintText;
  TextEditingController _controller;
  Icon suffixIcon;
  Icon prefixIcon;
  bool _obsecureText = false;

  CustomeFields(this.hintText, this._controller, this.suffixIcon,
      this.prefixIcon, this._obsecureText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        obscureText: _obsecureText,
        controller: _controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(8.0),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
