import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:makeupshop/Models/ExpenseListModel.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';

import 'package:makeupshop/widget/ExpenseListModel.dart';

import 'package:makeupshop/widget/MyDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

// ignore: must_be_immutable
class ExpenseRefund extends StatefulWidget {
  @override
  _ExpenseRefundState createState() => _ExpenseRefundState();
}

class _ExpenseRefundState extends State<ExpenseRefund> {
  ExpenseList _expenseList;

  String token;

  var responseString;
  // List status = [];
  var _statusList = ['All'];
  Object _itemValforLocation;
  List sortData = ['All', 'paid', 'due', 'partial'];

  bool isstatus = false;
  bool isFilterTypeByStatus = false;
  bool isSearch = false;
  int currentPage = 1;
  @override
  void initState() {
    super.initState();

    print(accessToken);

    onPress(accessToken);
  }

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  int index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      drawer: BuildMyDrawer(),
      body: SafeArea(
        child: Container(
          color: Color(0xff031344),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
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
                        Text('Expense Refund',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          child: DropdownButton(
                            isExpanded: true,
                            underline: SizedBox(),
                            hint: Text(
                              'Status',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            icon: Icon(
                              Icons.paid,
                              color: Colors.white,
                            ),
                            value: _itemValforLocation,
                            onChanged: (value) {
                              setState(() {
                                _itemValforLocation = value;
                                isstatus = true;
                                // isSearch = true;
                              });
                            },
                            items: sortData.map((value) {
                              return DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 17,
                                    ),
                                  ));
                            }).toList(),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
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
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      _expenseList == null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : isstatus
                              ? Expanded(
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      child: ListView.builder(
                                          // physics: NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemCount: _expenseList.data.length,
                                          // ignore: missing_return
                                          itemBuilder: (context, index) {
                                            for (int j = 0;
                                                j <=
                                                    _expenseList.data.length -
                                                        1;
                                                j++) {
                                              if (_itemValforLocation
                                                      .toString() ==
                                                  'All') {
                                                return AllExpenseListView(
                                                    expenseModel: _expenseList,
                                                    index: index);
                                              }
                                              if (_itemValforLocation
                                                      .toString()
                                                      .toLowerCase() ==
                                                  _expenseList
                                                      .data[index].paymentStatus
                                                      .toString()
                                                      .split(".")[1]
                                                      .toLowerCase()) {
                                                return AllExpenseListView(
                                                    expenseModel: _expenseList,
                                                    index: index);
                                              }
                                            }

                                            return Container();
                                          })),
                                )
                              : Expanded(
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      child: ListView.builder(
                                          itemCount: _expenseList.data.length,
                                          // ignore: missing_return
                                          itemBuilder: (context, index) {
                                            for (int j = 0;
                                                j < _expenseList.data.length;
                                                j++) {
                                              return AllExpenseListView(
                                                  expenseModel: _expenseList,
                                                  index: index);
                                            }
                                          })),
                                ),
                      // Expanded(
                      //         child: Container(
                      //           height:
                      //               MediaQuery.of(context).size.height *
                      //                   0.2,
                      //           child: ListView.builder(
                      //             scrollDirection: Axis.vertical,
                      //             itemCount: _expenseList.data.length,
                      //             // ignore: missing_return
                      //             itemBuilder: (context, index) {
                      //               for (int i = 0;
                      //                   i <=
                      //                       _expenseList.data.length -
                      //                           1;
                      //                   i++) {
                      //                 if (_expenseList
                      //                         .data[index].paymentStatus
                      //                         .toString() ==
                      //                     _itemStatus.toString()) {
                      //                   return AllExpenseListView(
                      //                       expenseModel: _expenseList,
                      //                       index: index);
                      //                 }
                      //               }
                      //             },
                      //           ),
                      //         ),
                      //       )
                      //     : Container()
                      SizedBox(
                        height: 20,
                      ),
                      _expenseList == null
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
                                            color: Colors.white, fontSize: 20),
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
                                          _expenseList.meta.lastPage) {
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
                        height: 20,
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
    final ExpenseList sells = await getSellMethod(accessToken, currentPage);

    setState(() {
      _expenseList = sells;
    });
    if (_expenseList == null) {
      print('error');
    } else {
      print("this is Tokan...............");
      print(_expenseList.data.length);
      print("===============");
      print(_expenseList.data.length.toString());
      print(_expenseList.data.first.locationId);
      print(_expenseList.data.first.paymentStatus);
      print(_expenseList.data.first.finalTotal);
      // print(_expenseList.data[0])
      _expenseList.data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      // for (var i = 0; i < _expenseList.data.length; i++) {
      //   if (_expenseList.data[i].paymentStatus != null) {
      //     _statusList.add(_expenseList.data[i].paymentStatus
      //         .toString()
      //         .split(".")[1]
      //         .toLowerCase()
      //         .toString());
      //     sortData = _statusList.toSet().toList();
      //   }
      // }
    }
  }

  Future<ExpenseList> getSellMethod(String accessToken, int currentPage) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int userID = sharedPreferences.getInt('userID');
    print('PPPPPPPPPPPPPPPPPPPPPPP');
    print(userID);
    final String apiUrl =
        'https://erp.live/connector/api/expense-refund?page=$currentPage';

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
    print(apiUrl);

    if (response.statusCode == 200) {
      final String responseString = response.body;

      return expenseListFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }
}
