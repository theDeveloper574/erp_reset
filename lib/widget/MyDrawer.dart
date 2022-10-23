import 'package:flutter/material.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/screens/CurrentStockScreen.dart';
import 'package:makeupshop/screens/Expanses.dart';
import 'package:makeupshop/screens/ListExpense.dart';
import 'package:makeupshop/screens/ProfitandLoss.dart';
import 'package:makeupshop/screens/UsersScreen.dart';
import 'package:makeupshop/screens/activeSubscription.dart';
import 'package:makeupshop/screens/attendance.dart';
import 'package:makeupshop/screens/booking.dart';
import 'package:makeupshop/screens/businessLoaction.dart';
import 'package:makeupshop/screens/businessSetting.dart';
import 'package:makeupshop/screens/changePassword.dart';
import 'package:makeupshop/screens/customerpayments.dart';
import 'package:makeupshop/screens/customers.dart';
import 'package:makeupshop/screens/expenseCategories.dart';
import 'package:makeupshop/screens/expenseRefund.dart';
import 'package:makeupshop/screens/followUp.dart';
import 'package:makeupshop/screens/holidays.dart';
import 'package:makeupshop/screens/kitchen.dart';
import 'package:makeupshop/screens/leads.dart';
import 'package:makeupshop/screens/loginpage.dart';
import 'package:makeupshop/screens/packages.dart';
import 'package:makeupshop/screens/profile.dart';
import 'package:makeupshop/screens/serviceTypes.dart';
import 'package:makeupshop/screens/suppliers.dart';
import 'package:makeupshop/screens/tables.dart';
import 'package:makeupshop/screens/taxRate.dart';
import 'package:makeupshop/style/color.dart';
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

  String token, accessToken1;
  @override
  void initState() {
    super.initState();

    accessToken1 = accessToken;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      decoration: BoxDecoration(color: background),
      child: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 260,
            padding: EdgeInsets.symmetric(vertical: 27, horizontal: 10),
            decoration: BoxDecoration(color: background),
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
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CircleAvatar(
                  maxRadius: 48,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    maxRadius: 47,
                    backgroundColor: background,
                    backgroundImage: AssetImage("asset/user1.jpg"),
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

          ///
          /// contact
          ///
          ExpansionTile(
            leading: Image(
              image: AssetImage("asset/contact.png"),
              width: 28,
              height: 30,
            ),
            title: Text("Contact"),
            children: <Widget>[
              ///
              /// Suppliers
              ///
              Container(
                padding: EdgeInsets.only(left: 20),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Supplier()));
                  },
                  leading: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Suppliers',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),

              ///
              /// customers
              ///
              Container(
                padding: EdgeInsets.only(left: 20),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Customers()));
                  },
                  leading: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                  title: Text('Customers', style: TextStyle(fontSize: 12)),
                ),
              ),
            ],
          ),

          ///
          /// expense
          ///
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
                  leading: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
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
                  leading: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
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
                  leading: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                  title: Text('Refund Expense', style: TextStyle(fontSize: 12)),
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
                            builder: (context) => ExpenseCategories()));
                  },
                  leading: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                  title: Text('Expense Categories',
                      style: TextStyle(fontSize: 12)),
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
          ExpansionTile(
              leading: Image(
                image: AssetImage("asset/user2.jpg"),
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
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title: Text('List Users', style: TextStyle(fontSize: 12)),
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
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Ledger()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title: Text('Ledger', style: TextStyle(fontSize: 12)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfitAndLoss()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title:
                        Text('Profit and Loss', style: TextStyle(fontSize: 12)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CurrentStockList()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title:
                        Text('Current Stock', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ]),

          ///
          /// Booking
          ///
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Booking()));
            },
            leading: Icon(
              Icons.book,
              size: 30,
              color: Colors.blue,
            ),
            title: Text('Bookings'),
          ),

          ///
          /// kitchen
          ///
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Kitchen()));
            },
            leading: Image(
              image: AssetImage("asset/kitchen.png"),
              height: 40,
              width: 40,
            ),
            title: Text('Kitchen'),
          ),

          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text('Premium Add-Ons',
                    // textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )),
              ),
            ],
          ),
          Divider(),

          ExpansionTile(
              leading: Image(
                image: AssetImage("asset/crm.png"),
                height: 35,
                width: 35,
              ),
              title: Text("CRM"),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Leads()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title: Text('Leads', style: TextStyle(fontSize: 12)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FollowUp()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title: Text('Follow Up', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ]),
          ExpansionTile(
              leading: Image(
                image: AssetImage("asset/HRM.png"),
                height: 35,
                width: 35,
              ),
              title: Text("HRM"),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Holidays()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title: Text('Holidays', style: TextStyle(fontSize: 12)),
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
                              builder: (context) => Attendance()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title: Text('Attendance', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ]),
          Divider(),

          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            leading: Icon(
              Icons.person,
              size: 30,
            ),
            title: Text('Profile'),
          ),

          ListTile(
            onTap: () {
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
                image: AssetImage("asset/setting.png"),
                height: 35,
                width: 35,
              ),
              title: Text("Setting"),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BusinessSetting()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title: Text('Business Setting',
                        style: TextStyle(fontSize: 12)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BusinessLocation()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title: Text('Business Location',
                        style: TextStyle(fontSize: 12)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TaxRate()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title: Text('Tax Rate', style: TextStyle(fontSize: 12)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Packages()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title: Text('Packages', style: TextStyle(fontSize: 12)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActiveSubscription()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title: Text('Active Subscription',
                        style: TextStyle(fontSize: 12)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TableManage()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title: Text('Tables', style: TextStyle(fontSize: 12)),
                  ),
                ),

                ///
                /// types of service
                ///
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServiceTypes()));
                    },
                    leading: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    title: Text('Types of Service',
                        style: TextStyle(fontSize: 12)),
                  ),
                ),
              ]),
          Divider(),
          InkWell(
            onTap: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.clear();
              // ignore: deprecated_member_use
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
