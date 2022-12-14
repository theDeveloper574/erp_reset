import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:makeupshop/Models/ExpensesModel.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';

import 'package:http/http.dart' as http;
import 'package:makeupshop/api/GloballyApi.dart';
import 'package:makeupshop/screens/BottomAppBar.dart';
import 'package:makeupshop/style/color.dart';

import 'package:makeupshop/widget/MyDrawer.dart';

import 'package:makeupshop/widget/buttons.dart';

import '../main.dart';

// ignore: must_be_immutable
class ChangePassword extends StatefulWidget {
  String tokenModel;

  ChangePassword(this.tokenModel);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String _locationid;
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  // ignore: non_constant_identifier_names
  final String LocationApiUrl = erpUrl + locationApi;

  Object currentItemSelected;
  var listItem1 = [];
  List locationFromApi = [];
  // ignore: unused_field
  var _businessID;

  bool _obsecureText = true;

  TextEditingController userCurrentPassword = TextEditingController();
  TextEditingController userNewPassword = TextEditingController();

  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      drawer: BuildMyDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: appBarColor,
        title: Text('Change Password'),
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                child: Image.asset(
                                    'asset/translations/resetpassword.png'),
                              ),
                              Container(
                                child: TextFormField(
                                  obscureText: _obsecureText,
                                  controller: userCurrentPassword,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.all(8.0),
                                    hintText: 'Current Password',
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      onPressed: _toggle,
                                      icon: Icon(
                                        _obsecureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
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
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.022),
                              Container(
                                child: TextFormField(
                                  obscureText: _obsecureText,
                                  controller: userNewPassword,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.all(8.0),
                                    hintText: 'New Password',
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      onPressed: _toggle,
                                      icon: Icon(
                                        _obsecureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
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
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.022),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: GestureDetector(
                                    onTap: () {
                                      getSellMethod1(accessToken);
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  bottombar(0)),
                                          (route) => false);
                                    },
                                    child: CustomeButton('Submit',
                                        yellow.withOpacity(0.1), yellow),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<ExpenseModel> getSellMethod1(String accessToken) async {
    final String apiUrl = 'https://food.erp.live/connector/api/update-password';

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer" + " $accessToken"
    };
    final msg = jsonEncode({
      "current_password": userCurrentPassword.text,
      "new_password": userNewPassword.text
    });
    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: msg);

    if (response.statusCode == 200) {
      final String responseString = response.body;

      ToastMsg(
        Colors.green,
        "Password Changed SuccessFully ",
      );
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }
}
