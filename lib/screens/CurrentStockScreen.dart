import 'package:flutter/material.dart';
import 'package:makeupshop/Models/CurrentStockModel.dart';

import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/Users.dart';
import 'package:makeupshop/widget/CurrentStockContainer.dart';

import 'package:makeupshop/widget/MyDrawer.dart';

import 'package:http/http.dart' as http;
import 'package:makeupshop/widget/UsersListContainer.dart';
import '../main.dart';

// ignore: must_be_immutable
class CurrentStockList extends StatefulWidget {
  @override
  _CurrentStockListState createState() => _CurrentStockListState();
}

class _CurrentStockListState extends State<CurrentStockList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController paymentAmount = TextEditingController();

  // ignore: non_constant_identifier_names
  var DueAmount;
  // LocationModel _listSells;
  CurrentStockModel _currentStockModel;

  // LocationModel listlocation;
  List locationFromApi = ['All'];
  Object _itemValforLocation;
  List type = [];
  bool isLocationOn = false;

  bool isSearch = false;
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
  bool isFilter = false;

  // List<String> locationFromApi = [];

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
                              width: 10,
                            ),
                            Text(
                              "Current Stock",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 100.0,
                              child: DropdownButton(
                                isExpanded: true,
                                underline: SizedBox(),
                                // isExpanded: true,
                                hint: Text(
                                  'Location',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),

                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                ),
                                value: _itemValforLocation,
                                onChanged: (value) {
                                  print("Butttton presseddddddddddddddd");

                                  setState(() {
                                    isLocationOn = true;
                                    _itemValforLocation = value;
                                  });
                                },
                                items: locationFromApi.map((value) {
                                  return DropdownMenuItem(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 17),
                                      ));
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ])),
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
                                  isSearch = true;
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
                            child: _currentStockModel == null
                                ? Center(child: CircularProgressIndicator())
                                : isLocationOn || isSearch
                                    ? ListView.builder(
                                        itemCount:
                                            _currentStockModel.data.length,
                                        itemBuilder: (context, index) {
                                          if (_itemValforLocation.toString() ==
                                              "All") {
                                            for (var i = 0;
                                                i <
                                                    _currentStockModel
                                                            .data.length -
                                                        1;
                                                i++) {
                                              if (isSearch == true) {
                                                if (_currentStockModel
                                                        .data[index].product
                                                        .toLowerCase()
                                                        .contains(_data
                                                            .toLowerCase()) ||
                                                    _currentStockModel
                                                        .data[index].sku
                                                        .toString()
                                                        .contains(
                                                            _data.toString())) {
                                                  return CurrentStockContainer(
                                                      _currentStockModel,
                                                      index);
                                                }
                                              } else {
                                                return CurrentStockContainer(
                                                    _currentStockModel, index);
                                              }
                                            }
                                          }

                                          if (isSearch) {
                                            for (var i = 0;
                                                i <
                                                    _currentStockModel
                                                            .data.length -
                                                        1;
                                                i++) {
                                              if (_currentStockModel
                                                      .data[index].product
                                                      .toLowerCase()
                                                      .contains(_data
                                                          .toLowerCase()) ||
                                                  _currentStockModel
                                                      .data[index].sku
                                                      .toString()
                                                      .contains(
                                                          _data.toString())) {
                                                if (isLocationOn == true) {
                                                  if (_itemValforLocation
                                                          .toString() ==
                                                      _currentStockModel
                                                          .data[index]
                                                          .locationName) {
                                                    return CurrentStockContainer(
                                                        _currentStockModel,
                                                        index);
                                                  }
                                                } else if (_currentStockModel
                                                        .data[index].product
                                                        .toLowerCase()
                                                        .contains(_data
                                                            .toLowerCase()) ||
                                                    _currentStockModel
                                                        .data[index].sku
                                                        .toString()
                                                        .contains(
                                                            _data.toString())) {
                                                  return CurrentStockContainer(
                                                      _currentStockModel,
                                                      index);
                                                } else {
                                                  return CurrentStockContainer(
                                                      _currentStockModel,
                                                      index);
                                                }
                                              }
                                            }
                                          }

                                          if (isLocationOn) {
                                            for (var i = 0;
                                                i <
                                                    _currentStockModel
                                                            .data.length -
                                                        1;
                                                i++) {
                                              if (_itemValforLocation
                                                      .toString() ==
                                                  _currentStockModel.data[index]
                                                      .locationName) {
                                                if (isSearch == true) {
                                                  if (_currentStockModel
                                                          .data[index].product
                                                          .toLowerCase()
                                                          .contains(_data
                                                              .toLowerCase()) ||
                                                      _currentStockModel
                                                          .data[index].sku
                                                          .toString()
                                                          .contains(_data
                                                              .toString())) {
                                                    return CurrentStockContainer(
                                                        _currentStockModel,
                                                        index);
                                                  }
                                                } else {
                                                  return CurrentStockContainer(
                                                      _currentStockModel,
                                                      index);
                                                }
                                              }
                                            }
                                            return Container();
                                          }

                                          return Container();
                                        })
                                    : ListView.builder(
                                        itemCount:
                                            _currentStockModel.data.length,
                                        itemBuilder: (context, index) {
                                          return CurrentStockContainer(
                                              _currentStockModel, index);
                                        }),
                          ),
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
    final CurrentStockModel sells = await getSellMethod(accessToken);

    setState(() {
      _currentStockModel = sells;
    });
    if (_currentStockModel == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
    } else {
      for (var i = 0; i <= _currentStockModel.data.length - 1; i++) {
        if (_currentStockModel.data[i].locationName != null) {
          print("Added");
          if (locationFromApi
              .contains(_currentStockModel.data[i].locationName)) {
            var getCategories = _currentStockModel.data[i].locationName;
          } else {
            locationFromApi.add(_currentStockModel.data[i].locationName);
          }
        }
      }
    }
  }

  Future<CurrentStockModel> getSellMethod(String accessToken) async {
    final String locationApiUrl =
        'https://erp.live/connector/api/product-stock-report';

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

      return currentStockModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }
}
