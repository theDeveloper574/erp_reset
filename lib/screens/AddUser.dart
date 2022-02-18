import 'dart:convert';

import 'package:flutter/material.dart';
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

// ignore: must_be_immutable
class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String _locationid;
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController isrecurring = TextEditingController();
  @override
  void initState() {
    super.initState();
    // onPress(accessToken);
    getLocations(accessToken);
    // onPress3(accessToken);
    // onPressOfAllUsers();
    onPress(accessToken);

    // GetLocations(widget.tokenModel);
  }

  // ignore: non_constant_identifier_names
  final String LocationApiUrl = erpUrl + locationApi;

  var _itemValue;
  // var listItem = ['item1', 'item2'];
  Object currentItemSelected;
  var listItem1 = [];
  List surNameList = ['Mr', 'Mrs', 'Miss'];
  Object surNameType;
  List genderList = ['Male', 'Female'];
  Object genderType;
  List maritalList = ['Married', 'UnMarried', 'Divorced'];
  Object maritalType;
  List roleList = ['Admin', 'Cashier'];
  Object roleType;
  List locationList = [];
  Object locationType;

  // ignore: unused_field
  var _businessID;
  bool _obsecureText = true;
  int totalpayment;
  UsersModel _userModel;
  ContactModel _contactModel;
  List _contactList = [];
  Object _contactItem;
  Object userName;
  List userNameList = [];
  List recurringType = ['Days', 'Month', 'Years'];
  Object selectrecurringType;
  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

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
  bool valueCeckBox2 = false;
  List selectedPrior = [];
  List contactList = [];
  Object contact;
  int check1 = 0, check2 = 0, check3 = 0;
  // ignore: non_constant_identifier_names
  int tax_id = 77;
  // ignore: non_constant_identifier_names
  int tax_amount = 0;
  int locationType1 = 0;
  ExpenseModel expenseModel;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController userName1 = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController address = TextEditingController();

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
                        InkWell(
                          onTap: () {
                            print('KKKKKKKKKKKK');
                            if (locationType == "All") {
                              locationType1 = 1;
                              return print(locationType1);
                            } else {
                              return print('OOOOOOOOOOOO');
                            }
                          },
                          child: Text('Add User',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
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
                  child: ListView(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 16, right: 16),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          color: Colors.white),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        underline: SizedBox(),
                                        hint: Text('Prefix:'),
                                        icon: Icon(
                                            Icons.arrow_drop_down_outlined),
                                        value: surNameType,
                                        onChanged: (value) {
                                          setState(() {
                                            surNameType = value;
                                          });
                                        },
                                        items: surNameList.map((value) {
                                          return DropdownMenuItem(
                                              value: value, child: Text(value));
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1,
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
                                                return 'Enter first Name';
                                              else
                                                return null;

                                              // ignore: unrelated_type_equality_checks
                                            },
                                            controller: firstName,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 16),
                                                hintText: 'First Name',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9))),
                                          ))),
                                  SizedBox(
                                    width: 1,
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
                                                return 'Enter last Name';
                                              else
                                                return null;

                                              // ignore: unrelated_type_equality_checks
                                            },
                                            controller: lastName,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 16),
                                                hintText: 'Last Name ',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9))),
                                          ))),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
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
                                              return 'Enter Email';
                                            else
                                              return null;

                                            // ignore: unrelated_type_equality_checks
                                          },
                                          controller: email,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 16),
                                              hintText: 'Email ',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9))),
                                        )),
                                  ),
                                  Checkbox(
                                    value: valueCeckBox2,
                                    onChanged: (bool value) {
                                      setState(() {
                                        valueCeckBox2 = value;
                                        if (value) {
                                          // selectedPrior.add(1);
                                          check3 = 1;
                                          print(check3);
                                          print(selectedPrior);
                                        } else {
                                          // selectedPrior.add(0);
                                          // selectedPrior.remove(1);

                                          print(selectedPrior);
                                        }
                                      });
                                    },
                                  ),
                                  Text('Is Active?'),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Row(
                                children: [
                                  Text(
                                    'Roles and Permission',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Row(
                                children: [
                                  Checkbox(
                                    value: valueCeckBox1,
                                    onChanged: (bool value) {
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
                                    },
                                  ),
                                  Text('Allow Login'),
                                ],
                              ),
                              valueCeckBox1
                                  ? Column(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                color: Colors.white),
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value.isEmpty)
                                                  return 'Enter User Name';
                                                else
                                                  return null;

                                                // ignore: unrelated_type_equality_checks
                                              },
                                              controller: userName1,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 16),
                                                  hintText: 'User Name ',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9))),
                                            )),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Container(
                                          child: TextFormField(
                                            controller: password,
                                            obscureText: _obsecureText,
                                            // controller: u,
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  EdgeInsets.all(8.0),
                                              hintText: 'Password',
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
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: BorderSide(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 16, right: 16),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              color: Colors.white),
                                          child: DropdownButton(
                                            isExpanded: true,
                                            underline: SizedBox(),
                                            hint: Text('Select Role'),
                                            icon: Icon(
                                                Icons.arrow_drop_down_outlined),
                                            value: roleType,
                                            onChanged: (value) {
                                              setState(() {
                                                roleType = value;
                                              });
                                            },
                                            items: roleList.map((value) {
                                              return DropdownMenuItem(
                                                  value: value,
                                                  child: Text(value));
                                            }).toList(),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 16, right: 16),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9),
                                                    color: Colors.white),
                                                child: DropdownButton(
                                                  isExpanded: true,
                                                  underline: SizedBox(),
                                                  hint: Text('Select Location'),
                                                  icon: Icon(Icons
                                                      .arrow_drop_down_outlined),
                                                  value: locationType,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      locationType = value;
                                                    });
                                                  },
                                                  items:
                                                      locationList.map((value) {
                                                    return DropdownMenuItem(
                                                        value: value,
                                                        child: Text(
                                                            value.toString()));
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
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
                                                    check1 = 0;
                                                    // selectedPrior.add(0);
                                                    // selectedPrior.remove(1);

                                                    print(selectedPrior);
                                                  }
                                                });
                                              },
                                            ),
                                            Text('Access all Location'),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Container(),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
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
                                  hint: Text('Select Gender'),
                                  icon: Icon(Icons.arrow_drop_down_outlined),
                                  value: genderType,
                                  onChanged: (value) {
                                    setState(() {
                                      genderType = value;
                                    });
                                  },
                                  items: genderList.map((value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
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
                                  hint: Text('Select Marital Status'),
                                  icon: Icon(Icons.arrow_drop_down_outlined),
                                  value: maritalType,
                                  onChanged: (value) {
                                    setState(() {
                                      maritalType = value;
                                    });
                                  },
                                  items: maritalList.map((value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Colors.white),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty)
                                        return 'Enter Phone No';
                                      else
                                        return null;

                                      // ignore: unrelated_type_equality_checks
                                    },
                                    controller: phoneNo,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 16),
                                        hintText: 'Phone No ',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(9))),
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Colors.white),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty)
                                        return 'Enter Address';
                                      else
                                        return null;

                                      // ignore: unrelated_type_equality_checks
                                    },
                                    controller: address,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 16),
                                        hintText: 'Address ',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(9))),
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_formkey.currentState.validate()) {
                                        if (surNameType == null &&
                                            genderType == null) {
                                          return ToastMsg(Colors.red,
                                              'Please select Items');
                                        } else {
                                          getSellMethod1(accessToken);
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
    final LocationModel sells = await getLocationMethod(accessToken);

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
          locationList.add(int.parse(_listSells.data[i].id.toString() +
              "." +
              _listSells.data[i].name.toString()));

          _locationid = _listSells.data[i].locationId;
          _businessID = int.parse(_listSells.data[i].businessId.toString());
          print(_listSells.data[i].locationId);
        }
      }

      // Navigator.push(context, MaterialPageRoute(builder: (_)=>Home(_tokenModel)));
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
          locationList.add('${location.data[i].id.toString()} ' +
              '${location.data[i].name}');

          print("No Id Found");
        }
      }
    }
  }

  // onPress3(String accessToken) async {
  //   final ContactModel sells = await getSellMethod3(accessToken);

  //   setState(() {
  //     _contactModel = sells;
  //   });
  //   if (_contactModel == null) {
  //     ToastMsg(
  //       Colors.red,
  //       "Something went Wrong,try again",
  //     );
  //   } else {
  //     for (var i = 0; i <= _contactModel.data.length - 1; i++) {
  //       if (_contactModel.data[i].name != null) {
  //         print("Added");
  //         if (contactList.contains(_contactModel.data[i].name)) {
  //           var getCategories = _contactModel.data[i].name;
  //         } else {
  //           contactList.add(_contactModel.data[i].name);
  //         }
  //       }
  //     }

  //     // Navigator.push(context, MaterialPageRoute(builder: (_)=>Home(_tokenModel)));
  //   }
  // }

  // Future<ContactModel> getSellMethod3(String accessToken) async {
  //   final String apiUrl = erpUrl + contactApi;

  //   print("GetSellMethod RUnssss");
  //   print("++++++++++++++_____________+++++++++++++++");
  //   print("Bearer" + " $accessToken");

  //   final response = await http.get(Uri.parse(apiUrl), headers: {
  //     "Authorization": "Bearer" + " $accessToken",
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   });

  //   print("thissss is status code+++++++++++++++++++");
  //   print(response.statusCode);

  //   if (response.statusCode == 200) {
  //     final String responseString = response.body;

  //     return contactModelFromJson(responseString);
  //   } else {
  //     ToastMsg(
  //       Colors.red,
  //       "SOmething went Wrong status code is ",
  //     );
  //     return null;
  //   }
  // }

  getSellMethod1(String accessToken) async {
    final String apiUrl = 'https://erp.live/connector/api/user-registration';

    var splittedValue = locationType.toString().split(".")[0];
    print(splittedValue);
    // var expenseForSplitted = userName.toString().split(" ");
    // var contactForSplitted = contactName.toString().split(" ");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer" + " $accessToken"
    };
    final msg = jsonEncode({
      "surname": surNameType,
      "first_name": firstName.text,
      "last_name": lastName.text,
      "email": email.text,
      "is_active": check3,
      "user_type": "user",
      "allow_login": check2,
      "username": userName1.text,
      "password": password.text,
      "role": "admin",
      "access_all_locations": check1,
      "location_permissions": [splittedValue],
      "gender": genderType,
      "marital_status": maritalType,
      "contact_number": phoneNo.text,
      "permanent_address": address.text,
    });
    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: msg);
    print(msg);
    print(response.statusCode);
    if (response.statusCode == 400) {
      ToastMsg(
        Colors.green,
        "Data Added SuccessFully ",
      );

      print('KKKKKKKKKKKKKKKKKKKK');
      final String responseString = response.body;
      print(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      // return null;
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
}
