import 'package:flutter/material.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/tokenModel.dart';
import 'package:makeupshop/Models/userInfoModel.dart';
import 'package:makeupshop/screens/BottomAppBar.dart';
import 'package:makeupshop/screens/loginpage.dart';

import 'package:shared_preferences/shared_preferences.dart';
// import 'package:restaurant/Screens/login.dart';

///
/// splash
///
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  TokenModel tokenModel;
  UserInfoModel userInfoModel;
  @override

  ///
  /// delay 5 second
  ///
  void initState() {
    Future.delayed(Duration(seconds: 5), () async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      // tokenModel = jsonEncode(user);

      accessToken = sharedPreferences.getString('token');
      print(tokenModel);

      if (accessToken != null && accessToken.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => bottombar(0),
          ),
        );
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// body
      ///
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(

              ///
              /// set background image
              ///
              image: AssetImage('asset/splash_bg.png'),
              fit: BoxFit.fill),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 90,
                  ),
                  child: Column(
                    children: [
                      ///
                      /// EMPOWER YOUR text
                      ///
                      Text(
                        'An Intelligent Software that',
                        style:
                            TextStyle(color: Colors.yellow[700], fontSize: 25),
                      ),
                      Text(
                        "EMPOWERS BUSINESS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.yellow[700]),
                      ),

                      ///
                      /// BUSINESS text
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            'asset/erp_logo_splashNew.png',
                            height: 120,
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                            "Experience infinite possibilities with "),
                                    TextSpan(
                                        text: "erp.live",
                                        style: TextStyle(
                                            color: Colors.yellow[700]))
                                  ]),
                                )),
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
