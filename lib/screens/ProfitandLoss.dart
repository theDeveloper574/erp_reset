import 'package:flutter/material.dart';

import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/ProfitLossModel.dart';

import 'package:makeupshop/widget/MyDrawer.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

// ignore: must_be_immutable
class ProfitAndLoss extends StatefulWidget {
  @override
  _ProfitAndLossState createState() => _ProfitAndLossState();
}

class _ProfitAndLossState extends State<ProfitAndLoss> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController paymentAmount = TextEditingController();

  // ignore: non_constant_identifier_names
  var DueAmount;
  // LocationModel _listSells;
  ProfitLossModel _profitLossModel;

  // LocationModel listlocation;
  List type = [];
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
    super.initState();
    onPress(accessToken);
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
                child: Column(children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      children: [
                        Row(
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Icon(
                                      Icons.arrow_back_sharp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Profit and Loss Report",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
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
                          child: Column(children: [
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Container(
                                child: _profitLossModel == null
                                    ? CircularProgressIndicator(
                                        color: Colors.transparent,
                                      )
                                    : ListView(
                                        children: [
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 15),
                                            child: Column(
                                              children: [
                                                PieChart(
                                                  dataMap: <String, double>{
                                                    "Purchase": double.parse(
                                                        _profitLossModel
                                                            .data.totalPurchase
                                                            .toString()),
                                                    "Sell": double.parse(
                                                        _profitLossModel
                                                            .data.totalSell
                                                            .toString()),
                                                    "Expense": double.parse(
                                                        _profitLossModel
                                                            .data.totalExpense
                                                            .toString()),
                                                  },
                                                  animationDuration: Duration(
                                                      milliseconds: 800),
                                                  chartLegendSpacing: 32,
                                                  chartRadius:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          3.2,
                                                  colorList: [
                                                    Color(0xffF4C127),
                                                    Color(0xff24BD59),
                                                    Color(0xffE1173B),
                                                  ],
                                                  initialAngleInDegree: 1,
                                                  chartType: ChartType.ring,
                                                  ringStrokeWidth: 32,
                                                  legendOptions: LegendOptions(
                                                    showLegendsInRow: false,
                                                    legendPosition:
                                                        LegendPosition.right,
                                                    showLegends: true,
                                                    legendShape:
                                                        BoxShape.rectangle,
                                                    legendTextStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  chartValuesOptions:
                                                      ChartValuesOptions(
                                                    showChartValueBackground:
                                                        true,
                                                    showChartValues: true,
                                                    showChartValuesInPercentage:
                                                        true,
                                                    showChartValuesOutside:
                                                        true,
                                                    decimalPlaces: 0,
                                                  ),
                                                  // gradientList: ---To add gradient colors---
                                                  // emptyColorGradient: [
                                                  //   Colors.red.withOpacity(0.5),
                                                  //   Colors.blue,
                                                  //   Colors.brown,
                                                  //   Colors.indigo
                                                  // ],
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Opening Stock',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .openingStock
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Closing Stock',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .closingStock
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Purchase Shipping Charges',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalPurchaseShippingCharge
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Sell Shipping Charges',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalSellShippingCharge
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Purchase Additional Expense',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalPurchaseAdditionalExpense
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Sell Additional Expense',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalSellAdditionalExpense
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Sell Additional Expense',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalSellAdditionalExpense
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Transfer Shipping Charges',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalTransferShippingCharges
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffF4C127)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('Total Purchase',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .white)),
                                                      Text(
                                                        double.parse(
                                                                _profitLossModel
                                                                    .data
                                                                    .totalPurchase
                                                                    .toString())
                                                            .toStringAsFixed(2),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Purchase Discount',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalPurchaseDiscount
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Purchase Return',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalPurchaseReturn
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff24BD59)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Total Sell',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        double.parse(
                                                                _profitLossModel
                                                                    .data
                                                                    .totalSell
                                                                    .toString())
                                                            .toStringAsFixed(2),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Sell Discount',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalSellDiscount
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Sell Return',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalSellReturn
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Sell Round Off',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalSellRoundOff
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffE1173B)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Total Expense',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        double.parse(
                                                                _profitLossModel
                                                                    .data
                                                                    .totalExpense
                                                                    .toString())
                                                            .toStringAsFixed(2),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Total Adjustment',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalAdjustment
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Total Recovered',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalRecovered
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Total Reward Amount',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .totalRewardAmount
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Net Profit',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .netProfit
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Gross Profit',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(double.parse(
                                                              _profitLossModel
                                                                  .data
                                                                  .grossProfit
                                                                  .toString())
                                                          .toStringAsFixed(2))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            )
                          ])))
                ]))));
  }

  //Reading Due Amount value in sharedPref

  onPress(String accessToken) async {
    final ProfitLossModel sells = await getSellMethod(accessToken);

    setState(() {
      _profitLossModel = sells;
    });
    if (_profitLossModel == null) {
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
      print(_profitLossModel.data.totalRewardAmount);
      print("===============");
      print(_profitLossModel.data.totalRewardAmount);
      // print(_usersModel.data.first.)
      print(_profitLossModel.data);
      // Navigator.push(context, MaterialPageRoute(builder: (_)=>Home(_tokenModel)));
    }
  }

  Future<ProfitLossModel> getSellMethod(String accessToken) async {
    final String locationApiUrl =
        'https://erp.live/connector/api/profit-loss-report';

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

      return profitLossModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }
}
