import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactScreen extends StatefulWidget {
  String accessToken;
  double subTotal;
  ContactScreen(this.accessToken, this.subTotal);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Object _itemValue;
  Object _itemValue1;
  // ignore: unused_field
  Object _itemValue2;
  var listItem = ['supplier', 'customer'];
  var list2 = ["A", "B", "C"];
  var list3 = ["X", "Y", "Z"];
  Object currentItemSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Contact"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.00,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.white),
              child: DropdownButton(
                isExpanded: true,
                underline: SizedBox(),
                hint: Text('Tax Rate'),
                icon: Icon(Icons.arrow_drop_down_outlined),
                value: _itemValue,
                onChanged: (value) {
                  setState(() {
                    _itemValue = value;
                  });
                },
                items: listItem.map((value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: 20.00,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.white),
              child: DropdownButton(
                isExpanded: true,
                underline: SizedBox(),
                hint: Text('Tax Rate'),
                icon: Icon(Icons.arrow_drop_down_outlined),
                value: _itemValue1,
                onChanged: (value) {
                  setState(() {
                    _itemValue1 = value;
                  });
                },
                items: _itemValue == "item1"
                    ? list2.map((value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList()
                    : list3.map((value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
