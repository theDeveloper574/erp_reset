import 'package:flutter/material.dart';
import 'package:makeupshop/Models/CurrentStockModel.dart';

import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/style/color.dart';
import 'package:makeupshop/widget/CurrentStockContainer.dart';

import 'package:makeupshop/widget/MyDrawer.dart';

import 'package:http/http.dart' as http;
import '../main.dart';

// ignore: must_be_immutable
class CurrentStockList extends StatefulWidget {
  @override
  _CurrentStockListState createState() => _CurrentStockListState();
}

class _CurrentStockListState extends State<CurrentStockList> {
  TextEditingController paymentAmount = TextEditingController();

  // ignore: non_constant_identifier_names
  var DueAmount;
  CurrentStockModel _currentStockModel;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: appBarColor,
        title: Text('Stocks'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            width: 100.0,
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              // isExpanded: true,
              hint: Text(
                'Location',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),

              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
              value: _itemValforLocation,
              onChanged: (value) {
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
                      style: TextStyle(color: Colors.red, fontSize: 17),
                    ));
              }).toList(),
            ),
          ),
        ],
      ),
      body: Container(
        color: appBarColor,
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
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
                            hintText: 'Product',
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.3)),
                            border: InputBorder.none,
                            suffixIcon: Container(
                              decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),

                              ///
                              /// search icon
                              ///
                              child: InkWell(
                                onTap: () {
                                  print('ppppppppppppppppppppp');
                                  print(searchTextEditingController.text);
                                  setState(() {
                                    isSearch = true;
                                  });
                                },
                                child: Image.asset('asset/search_ic.png'),
                              ),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        child: _currentStockModel == null
                            ? Center(child: CircularProgressIndicator())
                            : isLocationOn || isSearch
                                ? ListView.builder(
                                    itemCount: _currentStockModel.data.length,
                                    itemBuilder: (context, index) {
                                      if (_itemValforLocation.toString() ==
                                          "All") {
                                        for (var i = 0;
                                            i <
                                                _currentStockModel.data.length -
                                                    1;
                                            i++) {
                                          if (isSearch == true) {
                                            if (_currentStockModel
                                                    .data[index].product
                                                    .toLowerCase()
                                                    .contains(
                                                        _data.toLowerCase()) ||
                                                _currentStockModel
                                                    .data[index].sku
                                                    .toString()
                                                    .contains(
                                                        _data.toString())) {
                                              return CurrentStockContainer(
                                                  _currentStockModel, index);
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
                                                _currentStockModel.data.length -
                                                    1;
                                            i++) {
                                          if (_currentStockModel
                                                  .data[index].product
                                                  .toLowerCase()
                                                  .contains(
                                                      _data.toLowerCase()) ||
                                              _currentStockModel.data[index].sku
                                                  .toString()
                                                  .contains(_data.toString())) {
                                            if (isLocationOn == true) {
                                              if (_itemValforLocation
                                                      .toString() ==
                                                  _currentStockModel.data[index]
                                                      .locationName) {
                                                return CurrentStockContainer(
                                                    _currentStockModel, index);
                                              }
                                            } else if (_currentStockModel
                                                    .data[index].product
                                                    .toLowerCase()
                                                    .contains(
                                                        _data.toLowerCase()) ||
                                                _currentStockModel
                                                    .data[index].sku
                                                    .toString()
                                                    .contains(
                                                        _data.toString())) {
                                              return CurrentStockContainer(
                                                  _currentStockModel, index);
                                            } else {
                                              return CurrentStockContainer(
                                                  _currentStockModel, index);
                                            }
                                          }
                                        }
                                      }

                                      if (isLocationOn) {
                                        for (var i = 0;
                                            i <
                                                _currentStockModel.data.length -
                                                    1;
                                            i++) {
                                          if (_itemValforLocation.toString() ==
                                              _currentStockModel
                                                  .data[index].locationName) {
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
                                                    _currentStockModel, index);
                                              }
                                            } else {
                                              return CurrentStockContainer(
                                                  _currentStockModel, index);
                                            }
                                          }
                                        }
                                        return Container();
                                      }

                                      return Container();
                                    })
                                : ListView.builder(
                                    itemCount: _currentStockModel.data.length,
                                    itemBuilder: (context, index) {
                                      return CurrentStockContainer(
                                          _currentStockModel, index);
                                    }),
                      ),
                    ),
                  ],
                )),
          ],
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
        'https://food.erp.live/connector/api/product-stock-report';

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
