import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:makeupshop/Models/ContactPaymentModel.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/screens/BottomAppBar.dart';

import 'package:makeupshop/widget/MyDrawer.dart';

import 'package:makeupshop/widget/buttons.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

// ignore: must_be_immutable
class ConfirmCustomerPayment extends StatefulWidget {
  final String contactID;
  String dueAmount;
  String amount;
  ConfirmCustomerPayment(this.contactID, this.amount, this.dueAmount);

  @override
  _ConfirmCustomerPaymentState createState() => _ConfirmCustomerPaymentState();
}

class _ConfirmCustomerPaymentState extends State<ConfirmCustomerPayment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController paymentAmount = TextEditingController();

  // ignore: non_constant_identifier_names
  var DueAmount;

  ContactPaymentModel contactPayment;

  List<String> paymentMethodList = [
    'Cash',
    'Card',
    'Bank Transfer',
    'Easy Paisa',
  ];

  @override
  void initState() {
    getDueAmountFromSF();
    // paymentAmount.text = widget.amount;

    super.initState();
    // onPress1(accessToken);
  }

  Object _itemValue2;

  @override
  Widget build(BuildContext context) {
    print(widget.amount);
    print(widget.contactID);
    print(widget.amount);
    return Scaffold(
      key: _scaffoldKey,
      drawer: new BuildMyDrawer(),
      // backgroundColor: Color(0xff031344),
      // drawer: buildMyDrawer(),
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
                        GestureDetector(
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.black,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text('Payments',
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
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            // ignore: unnecessary_brace_in_string_interps
                            DueAmount == null
                                ? Text(widget.dueAmount.toString(),
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold))
                                // ignore: unnecessary_brace_in_string_interps
                                : Text("${DueAmount}",
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            InkWell(
                                onTap: () {
                                  print('ababababa');
                                  print(_itemValue2);
                                  paymentAmount.text = widget.amount;
                                },
                                child: Text('Due Amount')),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),

                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015),

                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015),
                            Container(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(9),
                                  color: Colors.white),
                              child: DropdownButton(
                                isExpanded: true,
                                underline: SizedBox(),
                                hint: Text('Select Payment Method'),
                                icon: Icon(Icons.arrow_drop_down_outlined),
                                value: _itemValue2,
                                onChanged: (value) {
                                  setState(() {
                                    _itemValue2 = value;
                                  });
                                },
                                items: paymentMethodList.map((value) {
                                  return DropdownMenuItem(
                                      value: value, child: Text(value));
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015),
                            Container(
                              // height: 50,
                              decoration: BoxDecoration(
                                  // border: Border.all(
                                  //     color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(9),
                                  color: Colors.white),
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    value = widget.amount;
                                  });
                                },
                                controller: paymentAmount,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 16),
                                    hintText: 'Payment Amount',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(9))),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022),
                            InkWell(
                              onTap: () {
                                onPress1(accessToken);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => bottombar(0)),
                                    (route) => false);
                                print('abababababa');
                              },
                              child: CustomeButton(
                                  'Submit', Colors.green[300], Colors.green),
                            )
                          ],
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

  //Reading Due Amount value in sharedPref
  getDueAmountFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double doubleValue = prefs.getDouble('dueAmount');
    setState(() {
      print("55555555555555555555");
      print(doubleValue);
      DueAmount = doubleValue;
    });
    return doubleValue;
  }

  onPress1(String accessToken) async {
    final ContactPaymentModel payment = await getSellMethod1(accessToken);

    setState(() {
      contactPayment = payment;
    });
    if (contactPayment == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
    } else {
      print('Run SuccessFully');
    }
  }

  Future<ContactPaymentModel> getSellMethod1(String accessToken) async {
    final String apiUrl = 'https://erp.live/connector/api/contactapi-payment';

    print("GetSellMethod RUnssss");
    print("++++++++++++++_____________+++++++++++++++");
    print("Bearer" + " $accessToken");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer" + " $accessToken"
    };
    final msg = jsonEncode({
      "contact_id": widget.contactID,
      "method": 'cash',
      "amount": paymentAmount.text,
    });
    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: msg);
    print(_itemValue2);
    print("Response Status : ${response.statusCode}");
    print("Response Body : ${response.contentLength}");
    print("Response Header  ${response.headers}");
    print("Response Request   ${response.request}");
    print("thissss is status code+++++++++++++++++++");
    print('ababababaabbbabab');
    print(response.body);
    print(response.statusCode);
    print('body' + '$msg');

    if (response.statusCode == 201) {
      final String responseString = response.body;
      print('Run SuccessFully');
      print('PPPPPPPPPPPPPPPPPPPPP');
      ToastMsg(
        Colors.green,
        "Data Added SuccessFully ",
      );
      return contactPaymentModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }
}
