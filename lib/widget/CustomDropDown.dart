import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  List listItem;
  Object _itemValue;
  String text;
  CustomDropDown(this.listItem, this._itemValue, this.text);
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(9),
          color: Colors.white),
      child: DropdownButton(
        isExpanded: true,
        underline: SizedBox(),
        hint: Text(widget.text),
        icon: Icon(Icons.arrow_drop_down_outlined),
        value: widget._itemValue,
        onChanged: (value) {
          setState(() {
            widget._itemValue = value;
          });
        },
        items: widget.listItem.map((value) {
          return DropdownMenuItem(value: value, child: Text(value));
        }).toList(),
      ),
    );
  }
}
