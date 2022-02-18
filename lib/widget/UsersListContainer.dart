import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:makeupshop/Models/Users.dart';

import 'package:makeupshop/Models/todoModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:makeupshop/widget/userDetail.dart';

// ignore: must_be_immutable
class UserListContainer extends StatefulWidget {
  UsersModel _usersModel;
  int index;

  UserListContainer(
    this._usersModel,
    this.index,
  );

  @override
  _UserListContainerState createState() => _UserListContainerState();
}

class _UserListContainerState extends State<UserListContainer> {
  @override
  Widget build(BuildContext context) {
    final _items = <String, Todo>{};

    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          print('NNNNNNNNNN');
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return FractionallySizedBox(
                  heightFactor: 0.8,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(60))),
                      child: UserDetail(widget._usersModel, widget.index)),
                );
              });
        },
        child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Row(
              children: [
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
                            DateFormat('yyyy-MM-dd hh:mm').format(widget
                                ._usersModel.data[widget.index].createdAt),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
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
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('User Name'),
                          Text(
                            (widget._usersModel.data[widget.index].surname ??
                                    "") +
                                " " +
                                (widget._usersModel.data[widget.index]
                                        .firstName ??
                                    "") +
                                " " +
                                (widget._usersModel.data[widget.index]
                                        .lastName ??
                                    ""),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
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
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Type'),
                          widget._usersModel.data[widget.index].userType == null
                              ? Text('')
                              : Text(
                                  widget
                                      ._usersModel.data[widget.index].userType,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Business Id'),
                          widget._usersModel.data[widget.index].businessId ==
                                  null
                              ? Text('')
                              : Text(
                                  widget
                                      ._usersModel.data[widget.index].businessId
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                  color: Colors.green[400],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Text(
                                    'Detail',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                  Icon(Icons.forward_outlined,
                                      color: Colors.white)
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
