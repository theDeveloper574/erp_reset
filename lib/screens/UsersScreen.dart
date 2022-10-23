import 'package:flutter/material.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/Users.dart';
import 'package:makeupshop/style/color.dart';

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

  List type = [];
  // ignore: unused_field
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
  // ignore: unused_field
  String _data = "";

  List<String> contactFromApi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new BuildMyDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: appBarColor,
        title: Text('Users'),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Container(
        color: appBarColor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: background,
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
    final String locationApiUrl = 'https://food.erp.live/connector/api/user';

    print("GetSellMethod RUnssss");
    print("++++++++++++++_____________+++++++++++++++");
    print("Bearer" + " $accessToken");

    final response = await http.get(Uri.parse(locationApiUrl), headers: {
      "Authorization": "Bearer" + " $accessToken",
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

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
