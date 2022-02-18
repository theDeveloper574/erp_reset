import 'package:flutter/material.dart';
import 'package:makeupshop/Models/ContactModel.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/sellModel.dart';

import 'package:makeupshop/api/GloballyApi.dart';

import 'package:makeupshop/widget/ListViewPayment.dart';

import 'package:makeupshop/widget/MyDrawer.dart';

import 'package:http/http.dart' as http;
import '../main.dart';

// ignore: must_be_immutable
class CustomerPayment extends StatefulWidget {
  @override
  _CustomerPaymentState createState() => _CustomerPaymentState();
}

class _CustomerPaymentState extends State<CustomerPayment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController paymentAmount = TextEditingController();

  // ignore: non_constant_identifier_names
  var DueAmount;
  // LocationModel _listSells;
  SellModel _listSell;
  ContactModel _contactModel;
  int currentPage = 1;

  // LocationModel listlocation;
  List type = ["Both"];
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
    // getDueAmountFromSF();
    super.initState();
    onPress(accessToken);
    onPress1(accessToken);
    // getCustomertype(accessToken);
    //
  }

  TextEditingController searchTextEditingController = TextEditingController();
  String _data = "";
  bool isFilter = false;

  bool search = false;
  // List<String> locationFromApi = [];
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
                          width: 15,
                        ),
                        Text(
                          "Payments",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   width: 30,
                    // ),
                    Container(
                      width: 100.0,
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        // isExpanded: true,
                        hint: Text(
                          'Type',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),

                        icon: Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        value: _itemVal,
                        onChanged: (value) {
                          print("Butttton presseddddddddddddddd");

                          setState(() {
                            istype = true;
                            _itemVal = value;
                          });
                        },
                        items: type.map((value) {
                          return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 17),
                              ));
                        }).toList(),
                      ),
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
                        Container(
                          margin: EdgeInsets.only(
                              top: 10, left: 15, right: 15, bottom: 5),
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: TextFormField(
                              controller: searchTextEditingController,
                              onChanged: (value) {
                                setState(() {
                                  _data = value;
                                  issearch = true;
                                });
                              },
                              decoration: InputDecoration(
                                isDense: false,
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3)),
                                border: InputBorder.none,
                              )),
                        ),
                        Expanded(
                          child: Container(
                            child: _listSell == null
                                ? Center(child: CircularProgressIndicator())
                                : istype || issearch
                                    ? ListView.builder(
                                        itemCount: _contactModel.data.length,
                                        itemBuilder: (context, index) {
                                          if (_itemVal.toString() == "Both") {
                                            for (var j = 0;
                                                j <
                                                    _contactModel.data.length -
                                                        1;
                                                j++) {
                                              if (_listSell.data[index]
                                                          .paymentStatus ==
                                                      "due" ||
                                                  _listSell.data[index]
                                                          .paymentStatus ==
                                                      "partial") if (issearch ==
                                                  true) {
                                                if (_listSell
                                                        .data[index].invoiceNo
                                                        .toLowerCase()
                                                        .contains(_data
                                                            .toLowerCase()) ||
                                                    _listSell.data[index]
                                                        .paymentStatus
                                                        .toString()
                                                        .toLowerCase()
                                                        .contains(_data
                                                            .toString()
                                                            .toLowerCase())) {
                                                  return ListViewPayment(
                                                      _listSell,
                                                      _contactModel,
                                                      index,
                                                      j);
                                                }
                                              } else {
                                                return ListViewPayment(
                                                    _listSell,
                                                    _contactModel,
                                                    index,
                                                    j);
                                              }
                                            }
                                          }

                                          if (issearch) {
                                            for (var j = 0;
                                                j <
                                                    _contactModel.data.length -
                                                        1;
                                                j++) {
                                              if (_listSell.data[index]
                                                          .paymentStatus ==
                                                      "due" ||
                                                  _listSell.data[index].paymentStatus == "partial") if (_listSell
                                                      .data[index].invoiceNo
                                                      .toLowerCase()
                                                      .contains(_data
                                                          .toLowerCase()) ||
                                                  _listSell
                                                      .data[index].paymentStatus
                                                      .toString()
                                                      .toLowerCase()
                                                      .contains(_data
                                                          .toString()
                                                          .toLowerCase())) {
                                                if (istype == true) {
                                                  if (_itemVal
                                                          .toString()
                                                          .toLowerCase() ==
                                                      _contactModel
                                                          .data[index].type
                                                          .toLowerCase()
                                                          .toString()) {
                                                    return ListViewPayment(
                                                        _listSell,
                                                        _contactModel,
                                                        index,
                                                        j);
                                                  }
                                                } else if (_listSell
                                                        .data[index].invoiceNo
                                                        .toLowerCase()
                                                        .contains(_data
                                                            .toLowerCase()) ||
                                                    _listSell.data[index]
                                                        .paymentStatus
                                                        .toString()
                                                        .toLowerCase()
                                                        .contains(_data
                                                            .toString()
                                                            .toLowerCase())) {
                                                  return ListViewPayment(
                                                      _listSell,
                                                      _contactModel,
                                                      index,
                                                      j);
                                                } else {
                                                  return ListViewPayment(
                                                      _listSell,
                                                      _contactModel,
                                                      index,
                                                      j);
                                                }
                                              }
                                            }
                                          }

                                          if (istype) {
                                            for (var j = 0;
                                                j <
                                                    _contactModel.data.length -
                                                        1;
                                                j++) {
                                              if (_listSell.data[index]
                                                          .paymentStatus ==
                                                      "due" ||
                                                  _listSell.data[index]
                                                          .paymentStatus ==
                                                      "partial") if (_itemVal.toString().toLowerCase() ==
                                                  _contactModel.data[index].type
                                                      .toString()
                                                      .toLowerCase()) {
                                                if (issearch == true) {
                                                  if (_listSell
                                                          .data[index].invoiceNo
                                                          .toLowerCase()
                                                          .contains(_data
                                                              .toLowerCase()) ||
                                                      _listSell.data[index]
                                                          .paymentStatus
                                                          .toString()
                                                          .contains(_data
                                                              .toString())) {
                                                    return ListViewPayment(
                                                        _listSell,
                                                        _contactModel,
                                                        index,
                                                        j);
                                                  }
                                                } else {
                                                  return ListViewPayment(
                                                      _listSell,
                                                      _contactModel,
                                                      index,
                                                      j);
                                                }
                                              }
                                            }
                                            return Container();
                                          }

                                          return Container();
                                        })
                                    : ListView.builder(
                                        itemCount: _contactModel.data.length,
                                        itemBuilder: (context, index) {
                                          for (var j = 0;
                                              j <=
                                                  _contactModel.data.length - 1;
                                              j++) {
                                            if (_listSell.data[index]
                                                        .paymentStatus ==
                                                    "due" ||
                                                _listSell.data[index]
                                                        .paymentStatus ==
                                                    "partial")
                                              return ListViewPayment(_listSell,
                                                  _contactModel, index, j);
                                          }

                                          return Container();
                                        }),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _listSell == null
                            ? Container()
                            : Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (currentPage > 1) {
                                          setState(() {
                                            currentPage = currentPage - 1;
                                          });
                                        }
                                        onPress(accessToken);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 5),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Color(0xff031344),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          '<',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      currentPage.toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (currentPage <
                                            _listSell.meta.lastPage) {
                                          setState(() {
                                            currentPage = currentPage + 1;
                                          });
                                          onPress(accessToken);
                                        }
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: Color(0xff031344),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            '>',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                        SizedBox(
                          height: 10,
                        ),
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
    final SellModel sells = await getSellMethod(accessToken);

    setState(() {
      _listSell = sells;
    });
    if (_listSell == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
    } else {
      // ToastMsg(
      //   Colors.green,
      //   "Login SUccessfull",
      // );
      print("this is Tokan...............");
      // print(_listSell.data.first.id);
      print("===============");
      // print(_listSell.data.first.locationId);
      // print(_listSell.data.first.)
      // print(_listSell.data.length.toString());
      // Navigator.push(context, MaterialPageRoute(builder: (_)=>Home(_tokenModel)));
    }
  }

  Future<SellModel> getSellMethod(String accessToken) async {
    final String locationApiUrl =
        "https://erp.live/connector/api/sell?page=$currentPage";

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

      return sellModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }

  onPress1(String accessToken) async {
    final ContactModel sells = await getSellMethod1(accessToken);

    setState(() {
      _contactModel = sells;
    });
    if (_contactModel == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
    } else {
      print("this is Tokan...............");

      print(_contactModel.data.first.id);
      print(_contactModel.data[3].id);
      for (var i = 0; i <= _contactModel.data.length - 1; i++) {
        if (_contactModel.data[i].type != null) {
          print("Added");
          if (type.contains(_contactModel.data[i].type)) {
            var getCategories = _contactModel.data[i].type;
          } else {
            type.add(_contactModel.data[i].type);
          }
        }
      }
    }
  }
}

Future<ContactModel> getSellMethod1(String accessToken) async {
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
  print(response.body);

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
