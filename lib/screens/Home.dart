import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:makeupshop/Models/ExpenseListModel.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/sellModel.dart';

import 'package:makeupshop/widget/MyDrawer.dart';
import 'package:makeupshop/widget/homeSaleContainer.dart';
import 'package:makeupshop/widget/homeSaleEmptyContainer.dart';

import '../main.dart';

///
/// Home
///
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SellModel allSalesModel;
  double totalProductPrice;
  var paidTotalMain;
  var dueTotalMain;
  var totalPaidByCash;
  var totalPaidByCard;
  var totalPaidByCheque;
  var totalPaidByBankTransfer;
  var total = 0.0;
  var saleAmount = 0.0;
  var expense = 0.0;
  bool isAllVisible = false;
  bool isTodayVisible = true;
  bool isYesterdayVisible = false;
  bool isLastSevenVisible = false;
  bool isLastMonthVisible = false;

  ExpenseList expenseModel;
  ExpenseList _expenseModel;
  var todaySaleLength = 0;
  var todaySalesAmount = 0.0;
  var todayPaidAmount = 0.0;
  var todayDueAmount = 0.0;
  var todayExpenseLength = 0;
  var todayExpenseAmount = 0.0;

/////yester day
  var yesterDaySaleLength = 0;
  var yesterDaySalesAmount = 0.0;
  var yesterDayPaidAmount = 0.0;
  var yesterDayDueAmount = 0.0;
  var yesterDayExpenseLength = 0;
  var yesterDayExpenseAmount = 0.0;

  //////////// seven days
  var sevenDaysSaleLength = 0;
  var sevenDaysSalesAmount = 0.0;
  var sevenDaysPaidAmount = 0.0;
  var sevenDaysDueAmount = 0.0;
  var sevenDaysExpenseLength = 0;
  var sevenDaysExpenseAmount = 0.0;

//////////// last month
  var lastMonthSaleLength = 0;
  var lastMonthSalesAmount = 0.0;
  var lastMonthPaidAmount = 0.0;
  var lastMonthDueAmount = 0.0;
  var lastMonthExpenseLength = 0;
  var lastMonthExpenseAmount = 0.0;

  //////////// seven days
  var allSaleLength = 0;
  var allSalesAmount = 0.0;
  var allPaidAmount = 0.0;
  var allDueAmount = 0.0;
  var allExpenseLength = 0;
  var allExpenseAmount = 0.0;

  var cashAmount = 0.0;
  var cardAmount = 0.0;

  ///
  /// side menu or slider key
  ///
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  final _formattedNumber = NumberFormat.compact().format(1000000);
  int currentPage = 1;
  int salecurrentPage = 1;
  int limitPage = 30;
  int page = 0;
  String repo = "";
  List results = [];
  @override
  void initState() {
    super.initState();
    onPressAllSales();
    onPressOfExpense(currentPage);
  }

  // void getData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   userName = sharedPreferences.getString('userName');
  // }

  var t;

  @override
  Widget build(BuildContext context) {
    //
    //  onWill Pop Functiondrawer

    //
    //
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure'),
              content: new Text('Do you want to exit an App?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text(
                    'No',
                    style: TextStyle(color: Color(0xff031344)),
                  ),
                ),
                TextButton(
                  onPressed: () => exit(0),
                  child: new Text(
                    'Yes',
                    style: TextStyle(color: Color(0xff031344)),
                  ),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffold,

        ///
        /// side menu
        ///
        drawer: BuildMyDrawer(),
        backgroundColor: Color(0xff031344),

        ///
        /// app bar
        ///
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xff031344),
          leading: InkWell(
              onTap: () {
                ///
                /// when user click on menu icon side menu or slider is opened
                ///
                _scaffold.currentState.openDrawer();
              },

              ///
              /// menu icon
              ///
              child: Container(
                  margin: EdgeInsets.only(top: 17, bottom: 14, left: 10),
                  child: Image(image: AssetImage("asset/menu_ic.png")))),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Home'),
            ],
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'asset/bgColor.png',
                ),
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30, right: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 33,

                                ///
                                /// user profile image
                                ///
                                backgroundImage: AssetImage(
                                  'asset/user_thum_menu.png',
                                ),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        )),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///
                              /// welcome message
                              ///
                              Text(
                                'Welcome!',
                                style: TextStyle(
                                  color: Color(0xff8D8D8D),
                                  fontSize: 17.5,
                                ),
                              ),

                              ///
                              /// user name
                              ///

                              Text(
                                userName.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.1,
                                    fontWeight: FontWeight.w600),
                              )
                              //  Text(
                              //     '${userName}',
                              //     style: TextStyle(
                              //         color: Colors.black,
                              //         fontSize: 17.1,
                              //         fontWeight: FontWeight.w600),
                              //   )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.green[400],
                            ),
                            child: Text(status ?? "")),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),

                    ///
                    /// background gradient color
                    ///
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'asset/homeBg.jpeg',
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                if (isTodayVisible == true) {
                                  isTodayVisible = true;
                                  isAllVisible = false;
                                  isYesterdayVisible = false;
                                  isLastSevenVisible = false;
                                  isLastMonthVisible = false;
                                } else {
                                  isTodayVisible = true;
                                  isAllVisible = false;
                                  isYesterdayVisible = false;
                                  isLastSevenVisible = false;
                                  isLastMonthVisible = false;
                                }
                                setState(() {});
                              },

                              ///
                              /// change card button state
                              ///
                              child: isTodayVisible == false
                                  ? Container(
                                      // width: 80,
                                      margin:
                                          EdgeInsets.only(left: 12, right: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Text(
                                        'Today',
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: Color(0xff031344)),
                                      ),
                                    )
                                  : Container(
                                      // width: 80,
                                      margin:
                                          EdgeInsets.only(left: 15, right: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                      // padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Color(0xff031344),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Text(
                                        'Today',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                            ),
                            InkWell(
                                onTap: () {
                                  if (isYesterdayVisible == true) {
                                    isYesterdayVisible = true;
                                    isAllVisible = false;
                                    isTodayVisible = false;
                                    isLastSevenVisible = false;
                                    isLastMonthVisible = false;
                                  } else {
                                    isYesterdayVisible = true;
                                    isAllVisible = false;
                                    isLastSevenVisible = false;
                                    isTodayVisible = false;
                                    isLastMonthVisible = false;
                                  }
                                  setState(() {});
                                },

                                ///
                                /// change button state
                                ///
                                child: isYesterdayVisible == false
                                    ? Container(
                                        // width: 85,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),

                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Text(
                                          'Yesterday',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff031344)),
                                        ),
                                      )
                                    : Container(
                                        // width: 85,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                        decoration: BoxDecoration(
                                            color: Color(0xff031344),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Text(
                                          'Yesterday',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                            InkWell(
                                onTap: () {
                                  if (isLastSevenVisible == true) {
                                    isLastSevenVisible = true;
                                    isYesterdayVisible = false;
                                    isAllVisible = false;
                                    isTodayVisible = false;
                                    isLastMonthVisible = false;
                                  } else {
                                    isLastSevenVisible = true;
                                    isYesterdayVisible = false;
                                    isAllVisible = false;
                                    isTodayVisible = false;
                                    isLastMonthVisible = false;
                                  }
                                  setState(() {});
                                },

                                ///
                                /// change button state
                                ///
                                child: isLastSevenVisible == false
                                    ? Container(
                                        // width: 100,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Text(
                                          'Last 7 days',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff031344)),
                                        ),
                                      )
                                    : Container(
                                        // width: 100,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                        decoration: BoxDecoration(
                                            color: Color(0xff031344),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Text(
                                          'Last 7 days',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                            InkWell(
                                onTap: () {
                                  if (isLastMonthVisible == true) {
                                    isLastMonthVisible = true;
                                    isYesterdayVisible = false;
                                    isAllVisible = false;
                                    isTodayVisible = false;
                                    isLastSevenVisible = false;
                                  } else {
                                    isLastMonthVisible = true;
                                    isYesterdayVisible = false;
                                    isAllVisible = false;
                                    isTodayVisible = false;
                                    isLastSevenVisible = false;
                                  }
                                  setState(() {});
                                },

                                ///
                                /// change button state
                                ///
                                child: isLastMonthVisible == false
                                    ? Container(
                                        // width: 100,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Text(
                                          'Last 30 Day',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      )
                                    : Container(
                                        // width: 100,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                        decoration: BoxDecoration(
                                            color: Color(0xff031344),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Text(
                                          'Last 30 Day',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                            InkWell(
                              onTap: () {
                                if (isAllVisible == true) {
                                  isAllVisible = true;
                                  isTodayVisible = false;
                                  isYesterdayVisible = false;
                                  isLastSevenVisible = false;
                                  isLastMonthVisible = false;
                                } else {
                                  isAllVisible = true;
                                  isTodayVisible = false;
                                  isYesterdayVisible = false;
                                  isLastSevenVisible = false;
                                  isLastMonthVisible = false;
                                }
                                setState(() {});
                              },

                              ///
                              /// change button state
                              ///
                              child: isAllVisible == true
                                  ? Container(
                                      // width: 95,
                                      margin: EdgeInsets.only(right: 15),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: Color(0xff031344),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Text(
                                        'All',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  : Container(
                                      // width: 95,
                                      margin: EdgeInsets.only(right: 15),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Text(
                                        'All',
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: Color(0xff031344)),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),

                      ///
                      /// all sale
                      ///
                      Visibility(
                        visible: isAllVisible,
                        child: allSalesModel == null || expenseModel == null
                            ? HomeSalesEmptyContainer()
                            : HomeSalesContainer(
                                allSaleLength,
                                saleAmount,
                                total,
                                expenseModel,
                                expense.toString(),
                                expenseModel.meta.total),
                      ),

                      ///
                      /// Today data
                      ///
                      Visibility(
                        visible: isTodayVisible,
                        child: allSalesModel == null || expenseModel == null
                            ? HomeSalesEmptyContainer()
                            : HomeSalesContainer(
                                todaySaleLength,
                                todaySalesAmount,
                                todayPaidAmount,
                                expenseModel,
                                todayExpenseAmount.toString(),
                                todayExpenseLength),
                      ),

                      ///
                      /// Yester day data
                      ///
                      Visibility(
                        visible: isYesterdayVisible,
                        child: allSalesModel == null || expenseModel == null
                            ? HomeSalesEmptyContainer()
                            : HomeSalesContainer(
                                yesterDaySaleLength,
                                yesterDaySalesAmount,
                                yesterDayPaidAmount,
                                expenseModel,
                                yesterDayExpenseAmount.toString(),
                                yesterDayExpenseLength),
                      ),

                      ///
                      /// last seven days
                      ///

                      Visibility(
                        visible: isLastSevenVisible,
                        child: allSalesModel == null || expenseModel == null
                            ? HomeSalesEmptyContainer()
                            : HomeSalesContainer(
                                sevenDaysSaleLength,
                                sevenDaysSalesAmount,
                                sevenDaysPaidAmount,
                                expenseModel,
                                sevenDaysExpenseAmount.toString(),
                                sevenDaysExpenseLength),
                      ),

                      ///
                      /// last month
                      ///
                      Visibility(
                        visible: isLastMonthVisible,
                        child: allSalesModel == null || expenseModel == null
                            ? HomeSalesEmptyContainer()
                            : HomeSalesContainer(
                                lastMonthSaleLength,
                                lastMonthSalesAmount,
                                lastMonthPaidAmount,
                                expenseModel,
                                lastMonthExpenseAmount.toString(),
                                lastMonthExpenseLength),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<SellModel> SalesProduct(int currentPage) async {
    final String apiUrl =
        'https://erp.live/connector/api/sell?page=$currentPage';
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {"Authorization": "Bearer" + " ${accessToken}"},
    );

    if (response.statusCode == 200) {
      final String responseString = response.body;
      return sellModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "Something Goes Wrong",
      );
      return null;
    }
  }

/////// onPress of AllProducts/////////////////
  onPressAllSales() async {
    final SellModel model = await getAllSalesProduct();
    setState(() {
      allSalesModel = model;
    });
    if (allSalesModel == null) {
      ToastMsg(Colors.red, 'Null Values');
    } else {
      for (int i = 1; i <= allSalesModel.meta.lastPage; i++) {
        final SellModel m = await SalesProduct(i);
        setState(() {
          allSalesModel = m;
        });
        if (allSalesModel == null) {
          print('running errorrrrrrrrrrrrrrrrrrrrrrrr');
        } else {
          print('OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK');
          for (int i = 0; i < allSalesModel.data.length; i++) {
            print(allSalesModel.data[i].id);
            allSaleLength = allSaleLength + 1;
          }
          print('allllllllllllllllllllllllllll');
          print(allSaleLength);

          ///
          /// all sales
          ///
          for (int i = 0; i < allSalesModel.data.length; i++) {
            if (allSalesModel.data[i].paymentLines.length != 0) {
              total = total +
                  double.parse(allSalesModel.data[i].paymentLines.first.amount);
              saleAmount =
                  saleAmount + double.parse(allSalesModel.data[i].finalTotal);

              if (allSalesModel.data[i].paymentLines.first.method.toString() ==
                  "Method.CASH") {
                cashAmount =
                    cashAmount + double.parse(allSalesModel.data[i].finalTotal);
              }
            }
          }
          DateTime nowdate = DateTime.now();

          ///
          ///   last month
          ///

          var lastMonth = new DateTime(
            nowdate.year,
            nowdate.month - 1,
            nowdate.day,
            nowdate.hour,
            nowdate.minute,
            nowdate.second,
          );

          // print('last month sales are running');
          // print('..................................');
          // print(lastMonth);
          // print(lastMonth.microsecondsSinceEpoch);
          // print(allSalesModel.data[0].paymentLines[0].paidOn);

          var todaySales = new DateTime(nowdate.year, nowdate.month,
              nowdate.day, nowdate.hour, nowdate.minute, nowdate.second);
          for (int i = 0; i < allSalesModel.data.length; i++) {
            if (allSalesModel.data[i].paymentLines.length != 0) {
              if (todaySales.microsecondsSinceEpoch >
                      allSalesModel.data[i].paymentLines[0].paidOn
                          .microsecondsSinceEpoch &&
                  allSalesModel.data[i].paymentLines[0].paidOn
                          .millisecondsSinceEpoch >
                      lastMonth.millisecondsSinceEpoch) {
                lastMonthPaidAmount = lastMonthPaidAmount +
                    double.parse(
                        allSalesModel.data[i].paymentLines.first.amount);
                lastMonthSalesAmount = lastMonthSalesAmount +
                    double.parse(allSalesModel.data[i].finalTotal);
                lastMonthSaleLength = lastMonthSaleLength + 1;
              }
            }
          }

          ///
          ///   last seven days sales
          ///

          var lastSevenDays = new DateTime(nowdate.year, nowdate.month,
              nowdate.day - 7, nowdate.hour, nowdate.minute, nowdate.second);
          // var todaySales = new DateTime(nowdate.year, nowdate.month, nowdate.day,
          //     nowdate.hour, nowdate.minute, nowdate.second);

          for (int i = 0; i < allSalesModel.data.length; i++) {
            if (allSalesModel.data[i].paymentLines.length != 0) {
              if (todaySales.microsecondsSinceEpoch >
                      allSalesModel.data[i].paymentLines[0].paidOn
                          .microsecondsSinceEpoch &&
                  allSalesModel.data[i].paymentLines[0].paidOn
                          .millisecondsSinceEpoch >
                      lastSevenDays.millisecondsSinceEpoch) {
                sevenDaysPaidAmount = sevenDaysPaidAmount +
                    double.parse(
                        allSalesModel.data[i].paymentLines.first.amount);
                sevenDaysSalesAmount = sevenDaysSalesAmount +
                    double.parse(allSalesModel.data[i].finalTotal);
                sevenDaysSaleLength = sevenDaysSaleLength + 1;
              }
            }
          }

          ///
          /// Today sales
          ///

          var today = new DateTime(
            nowdate.year,
            nowdate.month,
            nowdate.day,
          );

          print('today sales are running');
          print(today);
          print(DateFormat('yyyy-MM-dd').format(today));
          for (int i = 0; i < allSalesModel.data.length; i++) {
            if (allSalesModel.data[i].paymentLines.length != 0) {
              if (DateFormat('yyyy-MM-dd').format(today) ==
                  DateFormat('yyyy-MM-dd')
                      .format(allSalesModel.data[i].paymentLines[0].paidOn)) {
                todayPaidAmount = todayPaidAmount +
                    double.parse(
                        allSalesModel.data[i].paymentLines.first.amount);
                todaySalesAmount = todaySalesAmount +
                    double.parse(allSalesModel.data[i].finalTotal);
                todaySaleLength = todaySaleLength + 1;
              }
            }
          }

          ///
          /// yesterday sales
          ///
          var yesterDay =
              new DateTime(nowdate.year, nowdate.month, nowdate.day - 1);
          print('yesterday sale are ...............................');
          print(yesterDay);
          // for (int i = 0; i < allSalesModel.data.length; i++) {
          //   if (allSalesModel.data[i].paymentLines.length != 0) {
          //     if (DateFormat('yyyyy-MM-dd').format(today) ==
          //         DateFormat('yyyy-MM-dd')
          //             .format(allSalesModel.data[i].paymentLines[0].paidOn)) {
          //       yesterDayPaidAmount = yesterDayPaidAmount +
          //           double.parse(
          //               allSalesModel.data[i].paymentLines.first.amount);
          //       yesterDaySalesAmount = yesterDaySalesAmount +
          //           double.parse(allSalesModel.data[i].finalTotal);
          //       yesterDaySaleLength = yesterDaySaleLength + 1;
          //     }
          //   }
          // }

          for (int i = 0; i < allSalesModel.data.length; i++) {
            if (allSalesModel.data[i].paymentLines.length != 0) {
              if (DateFormat('yyyy-MM-dd').format(yesterDay) ==
                  DateFormat('yyyy-MM-dd')
                      .format(allSalesModel.data[i].paymentLines[0].paidOn)) {
                yesterDayPaidAmount = yesterDayPaidAmount +
                    double.parse(
                        allSalesModel.data[i].paymentLines.first.amount);
                yesterDaySalesAmount = yesterDaySalesAmount +
                    double.parse(allSalesModel.data[i].finalTotal);
                yesterDaySaleLength = yesterDaySaleLength + 1;
              }
            }
          }
        }
      }

      print('Sussessfullllllllllly');
    }
  }

  Future<SellModel> getAllSalesProduct() async {
    final String apiUrl = 'https://erp.live/connector/api/sell';
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {"Authorization": "Bearer" + " ${accessToken}"},
    );

    if (response.statusCode == 200) {
      final String responseString = response.body;
      return sellModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "Something Goes Wrong",
      );
      return null;
    }
  }

  onPressOfExpense(int currentPage) async {
    final ExpenseList model = await getAllExpense();

    setState(() {
      expenseModel = model;
    });
    if (expenseModel == null) {
      print('error');
    } else {
      print('Successfully');

      for (int i = 1; i <= expenseModel.meta.lastPage; i++) {
        final ExpenseList m = await getExpense(i);
        setState(() {
          _expenseModel = m;
        });
        if (_expenseModel == null) {
          print('error');
        } else {
          ///
          /// today expense
          ///
          DateTime nowdate = DateTime.now();
          var today = new DateTime(nowdate.year, nowdate.month, nowdate.day);
          for (int i = 0; i < _expenseModel.data.length; i++) {
            // ignore: unrelated_type_equality_checks
            if (_expenseModel.data[i].finalTotal != 0) {
              if (DateFormat('yyyy-MM-dd').format(today) ==
                  DateFormat('yyyy-MM-dd')
                      .format(_expenseModel.data[i].transactionDate)) {
                todayExpenseAmount = todayExpenseAmount +
                    double.parse(_expenseModel.data[i].finalTotal);
                todayExpenseLength = todayExpenseLength + 1;
              }
            }
          }

          ///
          /// today expense
          ///
          // DateTime nowdate = DateTime.now();
          var yetserDayExpense =
              new DateTime(nowdate.year, nowdate.month, nowdate.day - 1);
          for (int i = 0; i < _expenseModel.data.length; i++) {
            // ignore: unrelated_type_equality_checks
            if (_expenseModel.data[i].finalTotal != 0) {
              if (DateFormat('yyyy-MM-dd').format(yetserDayExpense) ==
                  DateFormat('yyyy-MM-dd')
                      .format(_expenseModel.data[i].transactionDate)) {
                yesterDayExpenseAmount = yesterDayExpenseAmount +
                    double.parse(_expenseModel.data[i].finalTotal);
                yesterDayExpenseLength = yesterDayExpenseLength + 1;
              }
            }
          }

////
          /// last 7 days expense
          ///

          var lastSevenDaysExpenseDate = new DateTime(
              nowdate.year,
              nowdate.month,
              nowdate.day - 7,
              nowdate.hour,
              nowdate.minute,
              nowdate.second);
          var todayExpense = new DateTime(nowdate.year, nowdate.month,
              nowdate.day, nowdate.hour, nowdate.minute, nowdate.second);

          for (int i = 0; i < _expenseModel.data.length; i++) {
            // ignore: unrelated_type_equality_checks
            if (_expenseModel.data[i].finalTotal != 0) {
              if (lastSevenDaysExpenseDate.microsecondsSinceEpoch <=
                  _expenseModel
                      .data[i].transactionDate.microsecondsSinceEpoch) {
                sevenDaysExpenseAmount = sevenDaysExpenseAmount +
                    double.parse(_expenseModel.data[i].finalTotal);
                sevenDaysExpenseLength = sevenDaysExpenseLength + 1;
              }
            }
          }

          ////
          /// last month expense
          ///
          var lastMonthExpenseDate =
              new DateTime(nowdate.year, nowdate.month, nowdate.day - 30);

          for (int i = 0; i < _expenseModel.data.length; i++) {
            // ignore: unrelated_type_equality_checks
            if (_expenseModel.data[i].finalTotal != 0) {
              if (lastMonthExpenseDate.microsecondsSinceEpoch <=
                  _expenseModel
                      .data[i].transactionDate.microsecondsSinceEpoch) {
                lastMonthExpenseAmount = lastMonthExpenseAmount +
                    double.parse(_expenseModel.data[i].finalTotal);
                lastMonthExpenseLength = lastMonthExpenseLength + 1;
              }
            }
          }

          ///
          /// all expense
          ///

          for (int i = 0; i < _expenseModel.data.length; i++) {
            // ignore: unrelated_type_equality_checks
            if (_expenseModel.data[i].finalTotal != 0) {
              expense =
                  expense + double.parse(_expenseModel.data[i].finalTotal);
            }
            print('....................');
            print(expense.toString());
          }
        }
      }
    }
  }

  Future<ExpenseList> getAllExpense() async {
    final String apiUrl = 'https://erp.live/connector/api/expense';
    final response = await http.get(Uri.parse(apiUrl), headers: {
      "Authorization": "Bearer" + " $accessToken",
    });
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

  Future<ExpenseList> getExpense(int currentPage) async {
    final String apiUrl =
        'https://erp.live/connector/api/expense?page=$currentPage';
    final response = await http.get(Uri.parse(apiUrl), headers: {
      "Authorization": "Bearer" + " $accessToken",
    });
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
