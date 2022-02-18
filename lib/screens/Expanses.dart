import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:makeupshop/Models/CategoryList.dart';
import 'package:makeupshop/Models/ContactModel.dart';

import 'package:makeupshop/Models/ExpensesModel.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/Users.dart';
import 'package:makeupshop/Models/locationModel.dart';
import 'package:http/http.dart' as http;
import 'package:makeupshop/Models/sellModel.dart';
import 'package:makeupshop/api/GloballyApi.dart';
import 'package:makeupshop/screens/BottomAppBar.dart';

import 'package:makeupshop/widget/MyDrawer.dart';

import 'package:makeupshop/widget/buttons.dart';

import '../main.dart';
import 'package:dropdownfield/dropdownfield.dart';

// ignore: must_be_immutable
class Expenses extends StatefulWidget {
  String tokenModel;

  Expenses(this.tokenModel);

  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  String _locationid;
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController isrecurring = TextEditingController();
  @override
  void initState() {
    super.initState();
    onPress(accessToken);
    getLocations(accessToken);
    onPress3(accessToken);
    onPressOfAllUsers();
    onPressGetCategory();

    // GetLocations(widget.tokenModel);
  }

  // ignore: non_constant_identifier_names
  final String LocationApiUrl = erpUrl + locationApi;

  var _itemValue;
  // var listItem = ['item1', 'item2'];
  Object currentItemSelected;
  var listItem1 = [];
  List locationFromApi = [];
  // ignore: unused_field
  var _businessID;
  int totalpayment;
  UsersModel _userModel;
  ContactModel _contactModel;
  CategoryList _categoryList;
  List _contactList = [];
  Object _contactItem;
  Object userName;
  List userNameList = [];
  List recurringType = ['Days', 'Month', 'Years'];
  Object selectrecurringType;

  List listItem = [
    'Cash',
    'Bank Transfer',
    'Custom Payment Method 1',
    'Custom Payment Method 2'
  ];
  Object _itemValforLocation;
  // LocationModel locationModel;
  LocationModel _listSells;
  SellModel sellModel;
  int expense;
  int paid;
  int userID;
  bool valueCeckBox = false;
  bool valueCeckBox1 = false;
  List selectedPrior = [];
  List contactList = [];
  Object contact;
  List categoryList = [];
  Object categoryType;
  List subCategoryList = [];
  Object subCategoryType;
  int check1 = 0, check2;
  // ignore: non_constant_identifier_names
  int tax_id = 77;
  // ignore: non_constant_identifier_names
  int tax_amount = 0;
  ExpenseModel expenseModel;
  TextEditingController taxrate = TextEditingController();
  TextEditingController expneseamount = TextEditingController();
  TextEditingController paidamount = TextEditingController();
  TextEditingController expensenote = TextEditingController();
  TextEditingController paymentNote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      drawer: BuildMyDrawer(),
      // backgroundColor: Color(0xff031344),
      body: SafeArea(
        child: Container(
          color: Color(0xff031344),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          width: 9,
                        ),
                        Text('Expenses',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
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
                  child: ListView(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: valueCeckBox,
                                          onChanged: (bool value) {
                                            setState(() {
                                              valueCeckBox = value;
                                              if (value) {
                                                // selectedPrior.add(1);
                                                check1 = 1;
                                                print(check1);
                                                print(selectedPrior);
                                              } else {
                                                // selectedPrior.add(0);
                                                // selectedPrior.remove(1);

                                                print(selectedPrior);
                                              }
                                            });
                                          },
                                        ),
                                        Text('Is Recurring?'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                            value: valueCeckBox1,
                                            onChanged: (value) {
                                              setState(() {
                                                valueCeckBox1 = value;
                                                if (value) {
                                                  // selectedPrior.add(1);
                                                  check2 = 1;
                                                  print(check2);
                                                  print(selectedPrior);
                                                } else {
                                                  // selectedPrior.add(0);
                                                  // selectedPrior.remove(1);

                                                  print(selectedPrior);
                                                }
                                              });
                                            }),
                                        Text('isRefundable'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              valueCeckBox
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  color: Colors.white),
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value.isEmpty)
                                                    return 'Enter Expense Amount';
                                                  else
                                                    return null;

                                                  // ignore: unrelated_type_equality_checks
                                                },
                                                controller: isrecurring,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 0,
                                                            horizontal: 16),
                                                    hintText:
                                                        'Recurring Interval',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9))),
                                              )),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 16, right: 16),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                color: Colors.white),
                                            child: DropdownButton(
                                              isExpanded: true,
                                              underline: SizedBox(),
                                              hint: Text('Interval Type'),
                                              icon: Icon(Icons
                                                  .arrow_drop_down_outlined),
                                              value: selectrecurringType,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectrecurringType = value;
                                                });
                                              },
                                              items: recurringType.map((value) {
                                                return DropdownMenuItem(
                                                    value: value,
                                                    child: Text(value));
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(9),
                                    color: Colors.white),
                                child: DropdownButton(
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  hint: Text('Select Business Id'),
                                  icon: Icon(Icons.arrow_drop_down_outlined),
                                  value: _itemValforLocation,
                                  onChanged: (value) {
                                    setState(() {
                                      _itemValforLocation = value;
                                    });
                                  },
                                  items: locationFromApi.map((value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Container(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(9),
                                    color: Colors.white),
                                child: DropdownButton(
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  hint: Text('Payment Method'),
                                  icon: Icon(Icons.arrow_drop_down_outlined),
                                  value: _itemValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _itemValue = value;
                                    });
                                  },
                                  items: listItem.map((value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Container(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(9),
                                    color: Colors.white),
                                child: DropdownButton(
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  hint: Text('Select Category'),
                                  icon: Icon(Icons.arrow_drop_down_outlined),
                                  value: categoryType,
                                  onChanged: (value) {
                                    setState(() {
                                      categoryType = value;
                                      print(categoryType);
                                    });
                                  },
                                  items: categoryList.map((value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                ),
                              ),
                              // SizedBox(
                              //     height: MediaQuery.of(context).size.height *
                              //         0.01),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    ///
                                    /// expense for
                                    ///
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            color: Colors.white),
                                        child: DropdownButton(
                                          underline: SizedBox(),
                                          icon: Icon(Icons.keyboard_arrow_down,
                                              color: Colors.black
                                                  .withOpacity(0.4)),
                                          hint: Text(
                                            'Expense For',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.4)),
                                          ),
                                          isExpanded: true,
                                          value: userName,
                                          onChanged: (value) {
                                            setState(() {
                                              userName = value;
                                            });
                                          },
                                          items: userNameList.map((value) {
                                            return DropdownMenuItem(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.015,
                                    ),

                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            color: Colors.white),
                                        child: DropdownButton(
                                          underline: SizedBox(),
                                          icon: Icon(Icons.keyboard_arrow_down,
                                              color: Colors.black
                                                  .withOpacity(0.4)),
                                          hint: Text(
                                            'Expense for contact',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.4)),
                                          ),
                                          isExpanded: true,
                                          value: contact,
                                          onChanged: (value) {
                                            setState(() {
                                              contact = value;
                                            });
                                          },
                                          items: contactList.map((value) {
                                            return DropdownMenuItem(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              color: Colors.white),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value.isEmpty)
                                                return 'Enter Expense Amount';
                                              else
                                                return null;

                                              // ignore: unrelated_type_equality_checks
                                            },
                                            controller: expneseamount,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 16),
                                                hintText: 'Expense Amount',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9))),
                                          ))),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              color: Colors.white),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value.isEmpty)
                                                return 'Enter Paid Amount';
                                              else
                                                return null;

                                              // ignore: unrelated_type_equality_checks
                                            },
                                            controller: paidamount,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 16),
                                                hintText: 'Paid Amount',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9))),
                                          ))),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.155,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(9)),
                                      child: TextFormField(
                                        controller: expensenote,
                                        maxLines: 4,
                                        // minLines: 2,
                                        decoration: InputDecoration(
                                            hintText: 'Expense Note',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(9))),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.155,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(9)),
                                      child: TextFormField(
                                        controller: paymentNote,
                                        maxLines: 4,
                                        // minLines: 2,
                                        decoration: InputDecoration(
                                            hintText: 'Payment Note',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(9))),
                                      ),
                                    ),
                                  ),
                                ],
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
                                      if (_formkey.currentState.validate()) {
                                        if (_itemValue == null &&
                                            _itemValforLocation == null) {
                                          return ToastMsg(Colors.red,
                                              'Please select Items');
                                        } else {
                                          onPress1(widget.tokenModel);
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      bottombar(0)),
                                              (route) => false);
                                        }
                                      }
                                    },
                                    child: CustomeButton('Submit',
                                        Colors.green[300], Colors.green),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPress(String accessToken) async {
    final LocationModel sells = await getSellMethod(accessToken);

    setState(() {
      _listSells = sells;
    });
    if (_listSells == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
    } else {
      for (var i = 0; i <= _listSells.data.length - 1; i++) {
        if (_listSells.data[i].name != null) {
          listItem1.add(
              _listSells.data[i].id.toString() + "." + _listSells.data[i].name);

          _locationid = _listSells.data[i].locationId;
          _businessID = int.parse(_listSells.data[i].businessId.toString());
        }
      }

      // Navigator.push(context, MaterialPageRoute(builder: (_)=>Home(_tokenModel)));
    }
  }

  Future<LocationModel> getSellMethod(String accessToken) async {
    final String apiUrl = erpUrl + locationApi;

    print("GetSellMethod RUnssss");
    print("++++++++++++++_____________+++++++++++++++");
    print("Bearer" + " $accessToken");

    final response = await http.get(Uri.parse(apiUrl), headers: {
      "Authorization": "Bearer" + " $accessToken",
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    print("thissss is status code+++++++++++++++++++");
    print(response.statusCode);

    if (response.statusCode == 200) {
      final String responseString = response.body;

      return locationModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }

  Future<LocationModel> getLocationMethod(String accessToken) async {
    print("GetLocationMethod RUnssss");
    print("++++++++++++++___+++++++++++++++");
    print("Bearer" + " $accessToken");
    print("this is new api after end point concatination");
    print(LocationApiUrl);

    final response = await http.get(Uri.parse(LocationApiUrl), headers: {
      "Authorization": "Bearer" + " $accessToken",
    });

    print("thissss is status code+++++++++++++++++++");
    print(response.statusCode);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      return locationModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ${response.statusCode}",
      );
      return null;
    }
  }

  getLocations(String accessToken) async {
    final LocationModel location = await getLocationMethod(accessToken);
    if (location == null) {
    } else {
      for (var i = 0; i <= location.data.length - 1; i++) {
        if (location.data[i].name != null) {
          locationFromApi.add('${location.data[i].id.toString()} ' +
              '${location.data[i].name}');

          print("No Id Found");
        }
      }
    }
  }

  onPress3(String accessToken) async {
    final ContactModel sells = await getSellMethod3(accessToken);

    setState(() {
      _contactModel = sells;
    });
    if (_contactModel == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
    } else {
      for (var i = 0; i <= _contactModel.data.length - 1; i++) {
        if (_contactModel.data[i].name != null) {
          print("Added");
          if (contactList.contains(_contactModel.data[i].name)) {
            var getCategories = _contactModel.data[i].name;
          } else {
            contactList.add(_contactModel.data[i].id.toString() +
                " " +
                _contactModel.data[i].name.toString());
          }
        }
      }

      // Navigator.push(context, MaterialPageRoute(builder: (_)=>Home(_tokenModel)));
    }
  }

  Future<ContactModel> getSellMethod3(String accessToken) async {
    final String apiUrl = erpUrl + contactApi;

    print("GetSellMethod RUnssss");
    print("++++++++++++++_____________+++++++++++++++");
    print("Bearer" + " $accessToken");

    final response = await http.get(Uri.parse(apiUrl), headers: {
      "Authorization": "Bearer" + " $accessToken",
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    print("thissss is status code+++++++++++++++++++");
    print(response.statusCode);

    if (response.statusCode == 200) {
      final String responseString = response.body;

      return contactModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }

  onPress1(String accessToken) async {
    final ExpenseModel expense = await getSellMethod1(accessToken);

    setState(() {
      expenseModel = expense;
    });
    if (expenseModel == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
    } else {
      return null;
    }
  }

  Future<ExpenseModel> getSellMethod1(String accessToken) async {
    final String apiUrl = erpUrl + expenseApi;

    var splittedValue = _itemValforLocation.toString().split(" ");
    var expenseForSplitted = userName.toString().split(" ");
    // var contactForSplitted = contactName.toString().split(" ");
    var contactSplittedValue = contactList.toString().split(" ");
    var categoryspittedValue = categoryType.toString().split(" ");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer" + " $accessToken"
    };
    final msg = jsonEncode({
      "location_id": splittedValue[0].toString(),
      "final_total": paidamount.text,
      "additional_notes": expensenote.text,
      "expense_category_id": categoryspittedValue[0],
      "is_refund": check2.toString(),
      "recur_interval": isrecurring.text.toString(),
      "recur_interval_type": selectrecurringType,
      "is_recurring": check1.toString(),
      "contact_id": contactList[0].toString(),
      "expense_for": expenseForSplitted[0].toString(),
      "payment": [
        {
          "amount": expneseamount.text,
          "method": _itemValue,
          "note": paymentNote.text,
        }
      ]
    });
    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: msg);
    print(msg);
    if (response.statusCode == 201) {
      final String responseString = response.body;

      ToastMsg(
        Colors.green,
        "Data Added SuccessFully ",
      );
      return expenseModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }

  onPressOfAllUsers() async {
    final UsersModel model = await getAllUsers();

    setState(() {
      _userModel = model;
    });
    if (_userModel == null) {
      print('error');
    } else {
      for (var i = 0; i < _userModel.data.length; i++) {
        if (_userModel.data[i].id != null) {
          userNameList.add(_userModel.data[i].id.toString() +
              " " +
              _userModel.data[i].surname.toString() +
              " " +
              _userModel.data[i].firstName.toString());

          print('///////////////////////////');
          print(userNameList);
          print('///////////////////////////');
        } else {
          print("No Id Found");
        }
      }
      print('Successfully');
    }
  }

  Future<UsersModel> getAllUsers() async {
    final String apiUrl = 'https://erp.live/connector/api/user';
    final response = await http.get(Uri.parse(apiUrl), headers: {
      "Authorization": "Bearer" + " $accessToken",
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

  onPressGetCategory() async {
    final CategoryList model = await getCategory();

    setState(() {
      _categoryList = model;
    });

    if (_categoryList == null) {
      print('error');
    } else {
      for (var i = 0; i < _categoryList.data.length; i++) {
        if (_categoryList.data[i].name != null) {
          categoryList.add(_categoryList.data[i].id.toString() +
              " " +
              _categoryList.data[i].name.toString());

          print('///////////////////////////');
          print(userNameList);
          print(categoryList);
          print('///////////////////////////');
        } else {
          print("No Id Found");
        }

        // print(_categoryList.data[0].subCategories[0].id);
        //  if (_categoryList.data[i].subCategories.first.id != null) {
        //   subCategoryList.add(_categoryList.data[i].id.toString() +
        //       " " +
        //       _categoryList.data[i].name.toString());

        //   print('///////////////////////////');
        //   print(userNameList);
        //   print(categoryList);
        //   print('///////////////////////////');

        // } else {
        //   print("No Id Found");
        // }

      }
      print('Successfully');
    }
  }

  Future<CategoryList> getCategory() async {
    final String apiUrl = 'https://erp.live/connector/api/expense-categories';
    final response = await http.get(Uri.parse(apiUrl), headers: {
      "Authorization": "Bearer" + " $accessToken",
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;

      return categoryListFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }
}
