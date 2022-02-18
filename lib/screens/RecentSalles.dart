import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupshop/Models/ContactModel.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/ListSells.dart';
import 'package:makeupshop/api/GloballyApi.dart';

import 'package:makeupshop/widget/AllSalesListviewContainer.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

// ignore: must_be_immutable
class RecentSales extends StatefulWidget {
  @override
  _RecentSalesState createState() => _RecentSalesState();
}

class _RecentSalesState extends State<RecentSales> {
  ListSells _listSells;
  ContactModel _contactModel;
  // = _listSells.data.sort((a,b) => a.createdAt.compareTo(b.createdAt));

  @override
  void initState() {
    super.initState();
    onPress(accessToken);
    onPress1(accessToken);
  }

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // print(_listSells.data.length < 4);

    return Scaffold(
      key: _scaffold,
      // drawer: BuildMyDrawer(widget.tokenModel, widget.userInfoModel),
      // backgroundColor: Color(0xff031344),
      body: SafeArea(
        child: Container(
          color: Color(0xff031344),
          child: Column(
            children: [
              SizedBox(
                height: 19,
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
                            _scaffold.currentState.openDrawer();
                          },
                          child: Image(image: AssetImage("asset/menu_ic.png")),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text('Sales',
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
                  // margin: EdgeInsets.only(bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/bgColor.png'),
                          fit: BoxFit.fill),
                      // color: Color(0xffFBFBFB),
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
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: ElevatedButton(
                                  // style: ButtonStyle(
                                  //     backgroundColor: MaterialStateProperty.all(Color(0xffDBDEE5),)
                                  // ),
                                  onPressed: () {
                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RecentSale(accessToken: widget.accessToken,)));
                                  },
                                  child: Text(
                                    'Recent Sale',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                  Color(0xffDBDEE5),
                                )),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('All Sales'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      _listSells == null
                          ? Center(
                              child: Text("Loading..."),
                            )
                          : Expanded(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: _listSells.data.length <= 5
                                      ? _listSells.data.length
                                      : _listSells.data.length +
                                          5 -
                                          _listSells.data.length,

                                  // itemCount: _listSells.data.length,
                                  // ignore: missing_return
                                  itemBuilder: (context, index) {
                                    for (int j = 0;
                                        j <= _contactModel.data.length - 1;
                                        j++) {
                                      if (_listSells.data[index].contactId
                                              .toString() ==
                                          _contactModel.data[j].id.toString()) {
                                        return AllSalesListViewContainer(
                                          listSells: _listSells,
                                          contactModel: _contactModel,
                                          index: index,
                                          contactIndex: j,
                                        );
                                      }
                                    }
                                  },
                                ),
                              ),
                            )
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
      for (int i = 0; i <= _contactModel.data.length; i++) {
        if (_contactModel.data[i].id == _listSells.data[0].contactId) {
          print('mmmmmmmmmmmmm');
          print(_contactModel.data[0].name);
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

  onPress(String accessToken) async {
    final ListSells sells = await getSellMethod(accessToken);

    setState(() {
      _listSells = sells;
    });
    if (_listSells == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
    } else {
      // ToastMsg(
      //   Colors.green,
      //   "Login SUccessfull",
      // );

    }
    print("this is Tokan...............");

    //  List datum  = _listSells.data.
    print('');
    print("===============");
    _listSells.data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    print(_listSells.data.last.createdAt);
    // print(_listSells.data.sort((a, b) {
    //   return a.createdAt.compareTo(b.createdAt);
    // }));

    // Navigator.push(context, MaterialPageRoute(builder: (_)=>Home(_tokenModel)));
  }
}

Future<ListSells> getSellMethod(String accessToken) async {
  final String apiUrl = "https://erp.live/connector/api/sell";

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

  // List<dynamic> responseJson = json.decode(response.body);
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
