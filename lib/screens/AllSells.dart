import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupshop/Models/ContactModel.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/ListSells.dart';
import 'package:makeupshop/api/GloballyApi.dart';

import 'package:makeupshop/widget/AllSalesListviewContainer.dart';
import 'package:makeupshop/widget/MyDrawer.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

// ignore: must_be_immutable
class AllSales extends StatefulWidget {
  // var accessToken;

  @override
  _AllSalesState createState() => _AllSalesState();
}

class _AllSalesState extends State<AllSales>
    with SingleTickerProviderStateMixin {
  ListSells _listSells;
  int currentPage = 1;
  ContactModel _contactModel;
  bool isLocationOn = false;
  Object _itemValforLocation;
  List locationFromApi = ['All', 'paid', 'partial', 'due'];
  bool isstatus = false;
  List sortData = [];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    onPress(accessToken);
    onPress1(accessToken);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  int index = 2;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    //
    //   On Will Pop Function
    //
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                TextButton(
                  onPressed: () => exit(0),
                  child: new Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    }

    // var listSells2 = _listSells;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffold,
        drawer: BuildMyDrawer(),
        // backgroundColor: Color(0xff031344),
        body: SafeArea(
          child: Container(
            color: Color(0xff031344),
            child: Column(
              children: [
                SizedBox(
                  height: 19,
                ),

                //
                // Sale Top Headers
                //
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _scaffold.currentState.openDrawer();
                            },
                            child:
                                Image(image: AssetImage("asset/menu_ic.png")),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Sales',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
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
                                'Status',
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
                                  _itemValforLocation = value;
                                  isstatus = true;
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    // margin: EdgeInsets.only(bottom: 5),
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

                        //
                        //  Elvation Button
                        //
                        // Container(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       SizedBox(
                        //         width: MediaQuery.of(context).size.width * 0.4,
                        //         child: ElevatedButton(
                        //             style: ButtonStyle(
                        //                 backgroundColor:
                        //                     MaterialStateProperty.all(
                        //               Color(0xffDBDEE5),
                        //             )),
                        //             onPressed: () {
                        //               Navigator.push(
                        //                   context,
                        //                   MaterialPageRoute(
                        //                       builder: (context) =>
                        //                           RecentSales()));
                        //             },
                        //             child: Text(
                        //               'Recent Sale',
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //               ),
                        //             )),
                        //       ),
                        //       SizedBox(
                        //         width: MediaQuery.of(context).size.width * 0.05,
                        //       ),
                        //       SizedBox(
                        //         width: MediaQuery.of(context).size.width * 0.4,
                        //         child: ElevatedButton(
                        //           onPressed: () {},
                        //           child: Text('All Sales'),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),

                          /// default tab bar controller
                          ///
                          child: DefaultTabController(
                            ///
                            /// length of tab
                            ///
                            length: 2,
                            child: TabBar(
                              ///
                              /// set contoller
                              ///
                              controller: _tabController,
                              labelColor: Colors.white,
                              unselectedLabelColor:
                                  Colors.black.withOpacity(0.7),
                              indicatorSize: TabBarIndicatorSize.label,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                              tabs: [
                                ///
                                /// recent sales tabs
                                ///
                                Tab(
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 15),
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text("Recent Sales")),
                                ),

                                ///
                                /// all sales tabs
                                ///
                                Tab(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 15),
                                      child: Text("All Sales")),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),

                        Expanded(
                          child: Container(
                            child: TabBarView(
                                controller: _tabController,
                                children: [
                                  _listSells == null
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : isstatus
                                          ? Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              child: ListView.builder(
                                                  // physics: NeverScrollableScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: _listSells
                                                              .data.length <=
                                                          5
                                                      ? _listSells.data.length
                                                      : _listSells.data.length +
                                                          5 -
                                                          _listSells
                                                              .data.length,

                                                  // ignore: missing_return
                                                  itemBuilder:
                                                      (context, index) {
                                                    for (int j = 0;
                                                        j <=
                                                            _contactModel.data
                                                                    .length -
                                                                1;
                                                        j++) {
                                                      if (_listSells.data[index]
                                                              .contactId
                                                              .toString() ==
                                                          _contactModel
                                                              .data[j].id
                                                              .toString()) {
                                                        if (_itemValforLocation
                                                                .toString() ==
                                                            'All') {
                                                          return AllSalesListViewContainer(
                                                            listSells:
                                                                _listSells,
                                                            contactModel:
                                                                _contactModel,
                                                            index: index,
                                                            contactIndex: j,
                                                          );
                                                        }
                                                        if (_itemValforLocation
                                                                .toString() ==
                                                            _listSells
                                                                .data[index]
                                                                .paymentStatus
                                                                .toString()) {
                                                          return AllSalesListViewContainer(
                                                            listSells:
                                                                _listSells,
                                                            contactModel:
                                                                _contactModel,
                                                            index: index,
                                                            contactIndex: j,
                                                          );
                                                        }
                                                      }
                                                    }
                                                    return Container();
                                                  }))
                                          : Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              child: ListView.builder(
                                                  itemCount: _listSells
                                                              .data.length <=
                                                          5
                                                      ? _listSells.data.length
                                                      : _listSells.data.length +
                                                          5 -
                                                          _listSells
                                                              .data.length,

                                                  // ignore: missing_return
                                                  itemBuilder:
                                                      // ignore: missing_return
                                                      (context, index) {
                                                    for (int j = 0;
                                                        j <
                                                            _contactModel
                                                                .data.length;
                                                        j++) {
                                                      if (_listSells.data[index]
                                                              .contactId
                                                              .toString() ==
                                                          _contactModel
                                                              .data[j].id
                                                              .toString()) {
                                                        return AllSalesListViewContainer(
                                                          listSells: _listSells,
                                                          contactModel:
                                                              _contactModel,
                                                          index: index,
                                                          contactIndex: j,
                                                        );
                                                      }
                                                    }
                                                  })),
                                  _listSells == null
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : isstatus
                                          ? Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              child: ListView.builder(
                                                  // physics: NeverScrollableScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      _listSells.data.length,
                                                  // ignore: missing_return
                                                  itemBuilder:
                                                      (context, index) {
                                                    for (int j = 0;
                                                        j <=
                                                            _contactModel.data
                                                                    .length -
                                                                1;
                                                        j++) {
                                                      if (_listSells.data[index]
                                                              .contactId
                                                              .toString() ==
                                                          _contactModel
                                                              .data[j].id
                                                              .toString()) {
                                                        if (_itemValforLocation
                                                                .toString() ==
                                                            'All') {
                                                          return AllSalesListViewContainer(
                                                            listSells:
                                                                _listSells,
                                                            contactModel:
                                                                _contactModel,
                                                            index: index,
                                                            contactIndex: j,
                                                          );
                                                        }
                                                        if (_itemValforLocation
                                                                .toString() ==
                                                            _listSells
                                                                .data[index]
                                                                .paymentStatus
                                                                .toString()) {
                                                          return AllSalesListViewContainer(
                                                            listSells:
                                                                _listSells,
                                                            contactModel:
                                                                _contactModel,
                                                            index: index,
                                                            contactIndex: j,
                                                          );
                                                        }
                                                      }
                                                    }
                                                    return Container();
                                                  }))
                                          : Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              child: ListView.builder(
                                                  itemCount:
                                                      _listSells.data.length,
                                                  // ignore: missing_return
                                                  itemBuilder:
                                                      // ignore: missing_return
                                                      (context, index) {
                                                    for (int j = 0;
                                                        j <
                                                            _contactModel
                                                                .data.length;
                                                        j++) {
                                                      if (_listSells.data[index]
                                                              .contactId
                                                              .toString() ==
                                                          _contactModel
                                                              .data[j].id
                                                              .toString()) {
                                                        return AllSalesListViewContainer(
                                                          listSells: _listSells,
                                                          contactModel:
                                                              _contactModel,
                                                          index: index,
                                                          contactIndex: j,
                                                        );
                                                      }
                                                    }
                                                  })),
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        _listSells == null
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
                                            _listSells.meta.lastPage) {
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onPress(String accessToken) async {
    final ListSells sells = await getSellMethod(accessToken, currentPage);

    setState(() {
      _listSells = sells;
    });
    if (_listSells == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
    } else {
      print("this is Tokan...............");
      _listSells.data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      // for (var i = 0; i <= _listSells.data.length - 1; i++) {
      //   if (_listSells.data[i].paymentStatus.toString() != null) {
      //     print("Added");
      //     if (locationFromApi
      //         .contains(_listSells.data[i].paymentStatus.toString())) {
      //       var getCategories = _listSells.data[i].paymentStatus.toString();
      //     } else {
      //       locationFromApi.add(_listSells.data[i].paymentStatus.toString());
      //       sortData = locationFromApi.toSet().toList();
      //     }
      //   }
      // }
    }
  }

  Future<ListSells> getSellMethod(String accessToken, int currentPage) async {
    final String apiUrl =
        'https://erp.live/connector/api/sell?page=$currentPage';

    print("GetSellMethod RUnssss");
    print("++++++++++++++_____________+++++++++++++++");
    print("Bearer" + " $accessToken");

    final response = await http.get(Uri.parse(apiUrl), headers: {
      "Authorization": "Bearer" + " $accessToken",
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    print("thissss is status code+++++++++++++++++++");
    // print(response.statusCodse);
    // print(response.body);

    if (response.statusCode == 200) {
      final String responseString = response.body;

      return listSellsFromJson(responseString);
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
      print('ababababababab');
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
  // print(response.statusCode);
  // print(response.body);

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
