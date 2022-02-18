import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/ProductsModel.dart';
import 'package:makeupshop/Models/Users.dart';
import 'package:makeupshop/Models/searchProductModel.dart';

import 'package:makeupshop/Models/todoModel.dart';
import 'package:makeupshop/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ProfitLossContainer extends StatefulWidget {
  UsersModel _usersModel;
  int index;

  ProfitLossContainer(
    this._usersModel,
    this.index,
  );

  @override
  _ProfitLossContainerState createState() => _ProfitLossContainerState();
}

class _ProfitLossContainerState extends State<ProfitLossContainer> {
  @override
  Widget build(BuildContext context) {
    final _items = <String, Todo>{};

    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Date:'),
                        Text(
                          widget._usersModel.data[widget.index].createdAt
                              .toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ID:'),
                        Text(
                          widget._usersModel.data[widget.index].id.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Name'),
                        Text(
                          "${widget._usersModel.data[widget.index].surname}" +
                              " ${widget._usersModel.data[widget.index].firstName}" +
                              " ${widget._usersModel.data[widget.index].lastName}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('User Name'),
                        widget._usersModel.data[widget.index].username == null
                            ? Text('')
                            : Text(
                                widget._usersModel.data[widget.index].username,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Email'),
                        widget._usersModel.data[widget.index].email == null
                            ? Text('')
                            : Text(
                                widget._usersModel.data[widget.index].email,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('User Type'),
                        widget._usersModel.data[widget.index].userType == null
                            ? Text('')
                            : Text(
                                widget._usersModel.data[widget.index].userType,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Language'),
                        widget._usersModel.data[widget.index].language == null
                            ? Text('')
                            : Text(
                                widget._usersModel.data[widget.index].language,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Business Id'),
                        widget._usersModel.data[widget.index].businessId == null
                            ? Text('')
                            : Text(
                                widget._usersModel.data[widget.index].businessId
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
