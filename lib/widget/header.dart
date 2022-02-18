import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Image(
                height: 120,
                width: 120,
                image: AssetImage("asset/erp_logo_splashNew.png"),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.redAccent,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Loading...",
              style: TextStyle(fontSize: 34.0, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
