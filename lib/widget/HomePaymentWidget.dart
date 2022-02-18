import 'package:flutter/material.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';

class HomePayment extends StatelessWidget {
  String image;
  String text;
  String totalPaidByCash;
  HomePayment(this.image, this.text, this.totalPaidByCash);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                  image: AssetImage(
                    '$image',
                  ),
                  color: Colors.black),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Text(text,
                  style: TextStyle(
                    fontSize: 18,
                  )),
            ],
          ),
          Row(
            children: [
              Text("$currencySymbol ${totalPaidByCash ?? "0"}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff23bf5a),
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
