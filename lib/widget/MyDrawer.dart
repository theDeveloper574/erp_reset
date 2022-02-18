import 'package:flutter/material.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/screens/AddUser.dart';

import 'package:makeupshop/screens/CurrentStockScreen.dart';
import 'package:makeupshop/screens/Expanses.dart';

import 'package:makeupshop/screens/ListExpense.dart';
import 'package:makeupshop/screens/ProfitandLoss.dart';
import 'package:makeupshop/screens/UsersScreen.dart';
import 'package:makeupshop/screens/changePassword.dart';
import 'package:makeupshop/screens/customerpayments.dart';
import 'package:makeupshop/screens/expenseRefund.dart';
import 'package:makeupshop/screens/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class BuildMyDrawer extends StatefulWidget {
  @override
  _BuildMyDrawerState createState() => _BuildMyDrawerState();
}

// ignore: camel_case_types
class _BuildMyDrawerState extends State<BuildMyDrawer> {
  Object reportItems;
  var reportList = ['Profit & Loss', 'Current Stock'];
  String token, accessToken1;
  @override
  void initState() {
    super.initState();
    print('init istate  is running ////////////////////////');
    print(accessToken1);
    accessToken1 = accessToken;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'asset/bgColor.png',
          ),
        ),
      ),
      child: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 260,
            padding: EdgeInsets.symmetric(vertical: 27, horizontal: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'asset/bgColor.png',
              ),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CircleAvatar(
                  maxRadius: 48,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    maxRadius: 45,
                    backgroundImage: AssetImage("asset/user_thum_menu.png"),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  "Welcome!",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Text(
                  '$userName',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ExpansionTile(
            leading: Image(
              image: AssetImage("asset/expenses_ic.png"),
            ),
            title: Text("Expenses"),
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EMList()));
                  },
                  leading: Image(
                      image: AssetImage("asset/expenses_ic.png"),
                      height: 20,
                      width: 20),
                  title: Text(
                    'List Expense',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Expenses(
                                  accessToken1,
                                )));
                  },
                  leading: Image(
                      image: AssetImage("asset/expenses_ic.png"),
                      height: 20,
                      width: 20),
                  title: Text('Add Expense', style: TextStyle(fontSize: 12)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExpenseRefund()));
                  },
                  leading: Image(
                    image: AssetImage("asset/expenses_ic.png"),
                    height: 20,
                    width: 20,
                  ),
                  title: Text('Refund Expense', style: TextStyle(fontSize: 12)),
                ),
              ),
            ],
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CustomerPayment()));
              // ToastMsg(Colors.redAccent, 'Is not Available');
            },
            leading: Image(
              image: AssetImage("asset/payment_ic.png"),
            ),
            title: Text('Payments'),
          ),
          ListTile(
            onTap: () async {
              // ToastMsg(Colors.redAccent, 'Is not Available');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangePassword(accessToken)));
            },
            leading: Image(
              image: AssetImage("asset/icon_change_password.png"),
              height: 35,
              width: 35,
            ),
            title: Text('Change Password'),
          ),
          ExpansionTile(
              leading: Image(
                image: AssetImage("asset/maleUser.png"),
                height: 35,
                width: 35,
              ),
              title: Text("Users"),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UsersList()));
                    },
                    leading: Image(
                      image: AssetImage("asset/maleUser.png"),
                      height: 20,
                      width: 20,
                    ),
                    title: Text('List Users', style: TextStyle(fontSize: 12)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddUser()));
                    },
                    leading: Image(
                      image: AssetImage("asset/maleUser.png"),
                      height: 20,
                      width: 20,
                    ),
                    title: Text('Add Users', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ]),
          ExpansionTile(
              leading: Image(
                image: AssetImage("asset/report-removebg.png"),
                height: 35,
                width: 35,
              ),
              title: Text("Reports"),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () async {
                      // ToastMsg(Colors.redAccent, 'Is not Available');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfitAndLoss()));
                    },
                    leading: Image(
                      image: AssetImage("asset/report-removebg.png"),
                      height: 20,
                      width: 20,
                    ),
                    title:
                        Text('Profit and Loss', style: TextStyle(fontSize: 12)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () async {
                      // ToastMsg(Colors.redAccent, 'Is not Available');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CurrentStockList()));
                    },
                    leading: Image(
                      image: AssetImage(
                        "asset/report-removebg.png",
                      ),
                      height: 20,
                      width: 20,
                    ),
                    title:
                        Text('Current Stock', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ]),
          Divider(),
          InkWell(
            onTap: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.clear();
              sharedPreferences.commit();
              // sharedPreferences.
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            },
            child: ListTile(
              leading: Image(
                image: AssetImage("asset/logout_ic.png"),
              ),
              title: Text('Logout'),
            ),
          ),
        ],
      ),
    ));
  }

  Widget showBox(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: const Text(
        'Reports',
        style: TextStyle(color: Colors.blue),
      )),
      content: SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfitAndLoss()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(color: Colors.grey[300]),
                child: Text('Profit and Loss Report'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CurrentStockList()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                decoration: BoxDecoration(color: Colors.grey[300]),
                child: Text('Current Stock'),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  // ignore: unused_element
  _launchURL() async {
    const url = 'https://erp.live/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
