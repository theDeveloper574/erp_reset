import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:makeupshop/Models/ContactModel.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/Users.dart';
import 'package:makeupshop/Models/sellModel.dart';

import 'package:makeupshop/api/GloballyApi.dart';

import 'package:makeupshop/widget/ListViewPayment.dart';

import 'package:makeupshop/widget/MyDrawer.dart';

import 'package:http/http.dart' as http;
import 'package:makeupshop/widget/UsersListContainer.dart';
import '../main.dart';

// ignore: must_be_immutable
class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController paymentAmount = TextEditingController();

  // ignore: non_constant_identifier_names
  var DueAmount;
  // LocationModel _listSells;
  UsersModel _usersModel;

  // LocationModel listlocation;
  List type = [];
  Object _itemVal;
  List<String> paymentMethodList = [
    'Cash',
    'Card',
    'Bank Transfer',
    'Easy Paisa',
  ];
  bool issearch = false;
  bool istype = false;
  @override
  void initState() {
    super.initState();
    onPress(accessToken);
  }

  TextEditingController searchTextEditingController = TextEditingController();
  String _data = "";

  List<String> contactFromApi = [];
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new BuildMyDrawer(),
      body: SafeArea(
        child: Container(
          color: Color(0xff031344),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context, false);
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Icon(
                                  Icons.arrow_back_sharp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Users",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/bgColor.png'),
                            fit: BoxFit.fill),
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                child: _usersModel == null
                                    ? Center(child: CircularProgressIndicator())
                                    : ListView.builder(
                                        itemCount: _usersModel.data.length <= 3
                                            ? _usersModel.data.length
                                            : _usersModel.data.length +
                                                3 -
                                                _usersModel.data.length,
                                        itemBuilder: (context, index) {
                                          return UserListContainer(
                                              _usersModel, index);
                                        }))),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Reading Due Amount value in sharedPref

  onPress(String accessToken) async {
    final UsersModel sells = await getSellMethod(accessToken);

    setState(() {
      _usersModel = sells;
    });
    if (_usersModel == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
    } else {
      _usersModel.data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      // _usersModel.data.first.ac
    }
  }

  Future<UsersModel> getSellMethod(String accessToken) async {
    final String locationApiUrl =
        'https://erp.live/connector/api/user?service_staff=0';

    print("GetSellMethod RUnssss");
    print("++++++++++++++_____________+++++++++++++++");
    print("Bearer" + " $accessToken");

    final response = await http.get(Uri.parse(locationApiUrl), headers: {
      "Authorization": "Bearer" + " $accessToken",
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    print("thissss is status code+++++++++++++++++++");
    print(response.statusCode);

    if (response.statusCode == 200) {
      final String responseString = response.body;

      return usersModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }
}
