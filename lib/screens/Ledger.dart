import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';

import 'package:makeupshop/Models/ledgerModel.dart';
import 'package:makeupshop/api/GloballyApi.dart';

import 'package:makeupshop/widget/AllLedgerListView.dart';

import 'package:makeupshop/widget/MyDrawer.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

// ignore: must_be_immutable
class Ledger extends StatefulWidget {
  // var accessToken;

  @override
  _LedgerState createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> {
  LedgerModel ledgerModel;
  String token;
  // ListSells _listSells;

  @override
  void initState() {
    super.initState();
    print(accessToken);
    // onPress(widget.tokenModel.accessToken);
  }

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  int index = 2;
  @override
  Widget build(BuildContext context) {
    print('abababababababab');
    print(accessToken);
    return Scaffold(
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
                        Text('Ledger',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.sync,
                          color: Colors.white,
                        ),
                        Text(
                          ' Sync',
                          style: TextStyle(color: Colors.white),
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
                      ledgerModel == null
                          ? Center(child: CircularProgressIndicator())
                          : Expanded(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: ledgerModel.data.ledger.length,
                                  itemBuilder: (context, index) {
                                    return AllLedgerListView(
                                      ledgerModel: ledgerModel,
                                      index: index,
                                    );
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

  onPress(String accessToken) async {
    final LedgerModel sells = await getSellMethod(accessToken);

    setState(() {
      ledgerModel = sells;
    });
    if (ledgerModel == null) {
      // ToastMsg(
      //   Colors.red,
      //   "Something went Wrong,try again",
      // );
    } else {
      // ToastMsg(
      //   Colors.green,
      //   "Login SUccessfull",
      // );
      print("this is Tokan...............");
      print(ledgerModel.data.ledger.length);
      print("===============");
      print(ledgerModel.data.ledger.length.toString());
      // Navigator.push(context, MaterialPageRoute(builder: (_)=>Home(_tokenModel)));
    }
  }

  Future<LedgerModel> getSellMethod(String accessToken) async {
    final String apiUrl = erpUrl + ledgerApi;

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

    if (response.statusCode == 200) {
      final String responseString = response.body;

      return ledgerModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }
}
