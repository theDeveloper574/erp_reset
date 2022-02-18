import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:makeupshop/Models/attendenceModel.dart';

import 'package:makeupshop/Models/tokenModel.dart';
import 'package:makeupshop/Models/userInfoModel.dart';

import 'package:makeupshop/widget/MyDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

// ignore: must_be_immutable
class Attendence extends StatefulWidget {
  // var accessToken;
  TokenModel tokenModel;
  UserInfoModel userInfoModel;

  Attendence(this.tokenModel, this.userInfoModel);

  @override
  _AttendenceState createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  // SellModel _sellModel;
  AttendenceModel attendenceModel;
  String token;
  int id;
  bool isLoading = false;
  // ListSells _listSells;

  @override
  void initState() {
    super.initState();
    getUserID();
    onPress(widget.tokenModel.accessToken);
  }

  getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getInt("userID");
    print(id);
  }

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  int index = 2;
  @override
  Widget build(BuildContext context) {
    print('abababababababab');
    print(widget.tokenModel);

    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.grey[200],
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
      ),

      key: _scaffold,
      drawer: BuildMyDrawer(),
      // backgroundColor: Color(0xff031344),
      body: isLoading
          ? CircularProgressIndicator()
          : SafeArea(
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
                                child: Image(
                                    image: AssetImage("asset/menu_ic.png")),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Text('Sales',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
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
                                  // SizedBox(
                                  //   width: MediaQuery.of(context).size.width * 0.4,
                                  //   child: Text(
                                  //     'Recent Sale',
                                  //     style: TextStyle(
                                  //       color: Colors.black54,
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Expanded(
                                child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                // itemCount:
                                //     attendenceModel.data.clockInTime.length,
                                // itemBuilder: (context, index) {
                                children: [
                                  Text(''
                                      'Clock Time :       ${attendenceModel.data.updatedAt}')
                                ],
                              ),
                            ))
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
    final AttendenceModel sells = await getSellMethod(accessToken);

    setState(() {
      attendenceModel = sells;
    });
    if (attendenceModel == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
      print('abababababa');
    } else {
      // ToastMsg(
      //   Colors.green,
      //   "Login SUccessfull",
      // );
      print("this is Tokan...............");
      print(attendenceModel.data.clockInTime.length);
      print("===============");
      print(attendenceModel.data.clockInTime);
      // Navigator.push(context, MaterialPageRoute(builder: (_)=>Home(_tokenModel)));
    }
  }

  Future<AttendenceModel> getSellMethod(String accessToken) async {
    print('+++++++++++++++   $id +++++++++++++++=');
    final String apiUrl = "https://erp.live/connector/api/get-attendance/$id";

    print("GetSellMethod RUnssss");
    print("++++++++++++++_____________+++++++++++++++");
    print("Bearer" + "$accessToken ");

    final response = await http.get(Uri.parse(apiUrl), headers: {
      "Authorization": "Bearer" + " $accessToken",
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    print("thissss is status code+++++++++++++++++++");
    print(response.statusCode);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print('USER ID ++++++++++++++++++++    $id');
      print(
          'USER CLOCK TIME ================= ${attendenceModel.data.essentialsShiftId}');

      return attendenceModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }
}
