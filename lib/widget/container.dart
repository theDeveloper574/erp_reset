// import 'package:flutter/material.dart';
// import 'package:pos/Models/tokenModel.dart';
// import 'package:pos/screens/Home.dart';
// import 'package:http/http.dart' as http;
//
// import '../main.dart';
//
// class MyContainer extends StatelessWidget {
//   final String title;
//   String UserName;
//   var Password;
//   MyContainer({required this.title,required this.UserName,required this.Password});
//   @override
//   Widget build(BuildContext context) {
//     return  InkWell(
//       onTap: () async
//       {
//         final TokenModel? user = await createUser(UserName, Password);
//
//         setState(() {
//           _user = user;
//         });
//
//         print("button pressed");
//        int res =  await PostMethod(Password,UserName);
//         print("this is res value");
//        print(res);print("this is res value");
//        if (res == 200){
//          Navigator.of(context).pushReplacement(
//            MaterialPageRoute(
//              builder: (ctx) => Home(),
//            ),
//          );
//        }
//        else {
//          ToastMsg(Colors.red,"SomeThing Went Wrong");
//          return null;
//        }
//
//       },
//           child: Container(
//                       height: MediaQuery.of(context).size.height * 0.07,
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Color(0xff23bf5a),
//                       ),
//                       child: Center(
//                         child: Text(
//                           title,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//     );
//   }
//
//   Future<TokenModel?> createUser(String userName, String password) async{
//     final String apiUrl = "https://erp.live/oauth/token";
//
//     final response = await http.post(Uri.parse(apiUrl) , body:{
//       "grant_type": "password",
//       'client_id' : "3",
//       'client_secret' : "ts0m7lL7wt9WwJA3klo8dTMwrU72GrOoOoijwYvQ",
//       'username' : userName,
//       'password': password,
//       'scope' : "",
//     });
//
//     if(response.statusCode == 201){
//       final String responseString = response.body;
//
//       return tokenModelFromJson(responseString);
//     }else{
//       return null;
//     }
//   }
//
//   Future<int> PostMethod(password , userName) async {
//     print("Post Method Runs");
//     print("Post Method RUns");
//     final String apiUrl =  "https://erp.live/oauth/token" ;
//   final response = await http.post(Uri.parse(apiUrl) , body:{
//     "grant_type": "password",
//     'client_id' : "3",
//   'client_secret' : "ts0m7lL7wt9WwJA3klo8dTMwrU72GrOoOoijwYvQ",
//   'username' : userName,
//   'password': password,
//   'scope' : "",
//     });
//
//     print(response.statusCode);
//     print("This is Response code");
//     return response.statusCode;
//   }
// }