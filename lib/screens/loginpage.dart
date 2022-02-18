import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:makeupshop/Models/GetBusinessDetail.dart';
import 'package:makeupshop/Models/tokenModel.dart';
import 'package:makeupshop/Models/userInfoModel.dart';
import 'package:makeupshop/api/GloballyApi.dart';
import 'package:makeupshop/screens/BottomAppBar.dart';
import 'package:makeupshop/widget/buttons.dart';
import 'package:makeupshop/widget/fields.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  TokenModel tokenModel;
  UserInfoModel userInfoModel;
  bool isLoading = false;
  bool _obsecureText = true;
  AnimationController _controller;
  // String _currencySymbol;
  // ignore: unused_field
  Animation _animation;
  GetBusinessDetail _getBusinessDetail;

  FocusNode _focusNode = FocusNode();

  // ignore: non_constant_identifier_names
  TextEditingController userNameEditingController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController userPssawordEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 300.0, end: 50.0).animate(_controller)
      ..addListener(() {
        setState(() {});
        _focusNode.addListener(() {
          if (_focusNode.hasFocus) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      });
  }

  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/splash_bg.png'), fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Image(
                image: AssetImage(
                  "asset/erp_logo_splashNew.png",
                ),
                height: 100,
                width: 100,
              ),
            ),
            Text(
              "Welcome Back",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 4.5,
            ),
            Text(
              "Sign in to continue",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white.withOpacity(.7),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      CustomeFields(
                          'Username',
                          userNameEditingController,
                          Icon(Icons.check_circle_outline_rounded),
                          Icon(Icons.person,
                              color: Colors.grey.withOpacity(.6)),
                          false),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        child: TextFormField(
                          obscureText: _obsecureText,
                          controller: userPssawordEditingController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(8.0),
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: _toggle,
                              icon: Icon(
                                _obsecureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      ////    Remember me Button

                      Row(
                        children: [
                          Center(
                              child: InkWell(
                            onTap: () {
                              setState(() {
                                _value = !_value;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  shape: BoxShape.rectangle,
                                  color: Colors.white),
                              child: _value
                                  ? Icon(Icons.check,
                                      size: 30.0, color: Colors.blue)
                                  : Icon(
                                      Icons.check_box_outline_blank,
                                      size: 30.0,
                                      color: Colors.white,
                                    ),
                            ),
                          )),
                          Text(
                            "   Remember me",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () async {
                            print("Login Button Pressed");

                            if (userNameEditingController.text.isEmpty ||
                                userPssawordEditingController.text.isEmpty) {
                              ToastMsg(Colors.red, "Please fill All Feilds");
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              final TokenModel user = await loginMethod(
                                  userNameEditingController.text.trim(),
                                  userPssawordEditingController.text.trim());

                              setState(() {
                                tokenModel = user;
                              });
                              if (tokenModel == null) {
                                ToastMsg(
                                  Colors.red,
                                  "Something went Wrong,try again",
                                );
                                setState(() {
                                  isLoading = false;
                                });
                              } else {
                                ToastMsg(
                                  Colors.green,
                                  "Login SUccessfull",
                                );

                                ///Getting User Info
                                final String apiUrlForUserInfo =
                                    erpUrl + loggedIn;

                                print("userInfoGetting method Runs");
                                final responseInfo = await http.get(
                                    Uri.parse(apiUrlForUserInfo),
                                    headers: {
                                      "Authorization": "Bearer" +
                                          " ${tokenModel.accessToken}",
                                    });
                                print(responseInfo.statusCode);
                                print(responseInfo);
                                print('Header Response');
                                print(responseInfo.headers);
                                print('Body Resonse');
                                print(responseInfo.body);
                                print("++++++++111111111");
                                // print(tokenModel.accessToken);
                                accessToken = tokenModel.accessToken;
                                print('$accessToken');
                                if (responseInfo.statusCode == 200) {
                                  final UserInfoModel info =
                                      userInfoModelFromJson(responseInfo.body);
                                  print("***this is UserId********");
                                  print(info.data.id.toString());
                                  userId = info.data.id;
                                  int userID = info.data.id;
                                  SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  sharedPreferences
                                      .setInt("userID", userID)
                                      .toString();
                                  setState(() {
                                    userInfoModel = info;

                                    userName =
                                        (userInfoModel.data.firstName ?? "") +
                                            " " +
                                            (userInfoModel.data.lastName ?? "");
                                    lastName =
                                        userInfoModel.data.lastName.toString();
                                    userId = userInfoModel.data.id;
                                    status = userInfoModel.data.status;
                                    print('print user Name $userName');
                                    sharedPreferences
                                        .setString('lastname', lastName)
                                        .toString();
                                    sharedPreferences
                                        .setString('userName',
                                            userInfoModel.data.firstName)
                                        .toString();
                                    sharedPreferences
                                        .setInt('userId', userInfoModel.data.id)
                                        .toString();
                                    print(userInfoModel.data.firstName);
                                    print("Nameeeeeee");
                                    // onPress(accessToken);
                                  });
                                } else {
                                  print("************Something Going Not Good");
                                }
                                onPress(accessToken);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => bottombar(0)));
                              }
                            }
                          },
                          child: CustomeButton('Login',
                              Colors.blueAccent.withOpacity(0.5), Colors.blue)),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "English",
                          ),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<TokenModel> loginMethod(String userName, String password) async {
    final String apiUrl = authToken;

    // print("creatUserMethod Runs");

    final response = await http.post(Uri.parse(apiUrl), body: {
      "grant_type": "password",
      'client_id': "3",
      'client_secret': "ts0m7lL7wt9WwJA3klo8dTMwrU72GrOoOoijwYvQ",
      'username': userName,
      'password': password,
      'scope': "",
    });

    // print(response.statusCode);

    if (response.statusCode == 200) {
      final String responseString = response.body;

      return tokenModelFromJson(responseString);
    } else if (response.statusCode == 401) {
      ToastMsg(
        Colors.red,
        "UserName Or Password Is Incorrect",
      );
      return null;
    } else {
      ToastMsg(
        Colors.red,
        "Something Goes Wrong",
      );
      return null;
    }
  }

  onPress(String accessToken) async {
    final GetBusinessDetail sells = await getSellMethod(accessToken);

    setState(() {
      _getBusinessDetail = sells;
    });
    if (_getBusinessDetail == null) {
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
      // print(_getBusinessDetail.data.first.id);
      print("===============");

      currencySymbol = _getBusinessDetail.data.currency.symbol ?? "";
      // print(_getBusinessDetail.data.currency.symbol);
      // print(_getBusinessDetail.data.currency.id.toString());
      print(currencySymbol);
      print(currencySymbol);
      print(currencySymbol);
      print(currencySymbol);

      // Navigator.push(context, MaterialPageRoute(builder: (_)=>Home(_tokenModel)));
    }
  }

  Future<GetBusinessDetail> getSellMethod(String accessToken) async {
    final String locationApiUrl =
        'https://erp.live/connector/api/business-details';

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
      final String responseString = response.body.toString();

      return getBusinessDetailFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }
}
