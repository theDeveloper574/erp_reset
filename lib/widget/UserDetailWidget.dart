import 'package:flutter/material.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';

class CustomeUserNameDetail extends StatefulWidget {
  @override
  _CustomeUserNameDetailState createState() => _CustomeUserNameDetailState();
}

class _CustomeUserNameDetailState extends State<CustomeUserNameDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            "asset/user_thum_menu.png",
          ),
          radius: 30,
          backgroundColor: Colors.black,
        ),
        title: Text(
          "Welcome!",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          '$userName $lastName',
          // widget
          //     .userInfoModel.data.firstName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
