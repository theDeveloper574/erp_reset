import 'package:flutter/material.dart';

import 'package:makeupshop/Models/Users.dart';
import 'package:makeupshop/Models/todoModel.dart';
import 'package:easy_localization/easy_localization.dart';

class UserDetail extends StatefulWidget {
  UsersModel _userModel;
  int index;
  UserDetail(this._userModel, this.index);
  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final _items = <String, Todo>{};
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12))),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        print('aabbababbaabba');
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 10,
                          top: 0,
                        ),
                        // width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.03),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          widget._userModel.data[widget.index].createdAt == null
                              ? Text('')
                              : Text(
                                  DateFormat('yyyy-MM-dd hh:mm').format(widget
                                      ._userModel.data[widget.index].createdAt),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Name:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            widget._userModel.data[widget.index].surname ??
                                "" +
                                    " " +
                                    widget._userModel.data[widget.index]
                                        .firstName ??
                                "" +
                                    " " +
                                    widget._userModel.data[widget.index]
                                        .lastName ??
                                "",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.03),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'User Name:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            widget._userModel.data[widget.index].username ?? "",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            widget._userModel.data[widget.index].email ?? "",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.03),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Allow Login:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            widget._userModel.data[widget.index].allowLogin
                                    .toString() ??
                                "",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            widget._userModel.data[widget.index].status ?? "",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.03),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Type:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            widget._userModel.data[widget.index].userType ?? "",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.black.withOpacity(0.03),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Contact No:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            widget._userModel.data[widget.index].contactNo ??
                                "",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.03),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Gender:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            widget._userModel.data[widget.index].gender ?? "",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.black.withOpacity(0.03),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Marital Status:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            widget._userModel.data[widget.index]
                                    .maritalStatus ??
                                "",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.03),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Address:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          Text(
                            widget._userModel.data[widget.index].address ?? "",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                  ],
                ),
              ),
              // Positioned(
              //     top: -35,
              //     left: 15,
              //     child: ClipRRect(
              //       borderRadius: BorderRadius.circular(10),
              //       child: InkWell(
              //         onTap: () {
              //           print('/////////////////////');
              //           // Navigator.push(
              //           //     context,
              //           //     MaterialPageRoute(
              //           //         builder: (context) => ProductIamge(widget
              //           //             ._userModel
              //           //             .data[widget.index]
              //           //             .imageUrl)));
              //         },
              //         child: Container(
              //           width: 100,
              //           height: 100,
              //           child: Image.network(
              //             widget._userModel.data[widget.index].imageUrl,
              //             fit: BoxFit.fill,
              //           ),
              //         ),
              //       ),
              //     )),
            ],
          ),
        ],
      ),
    );
  }
}
