import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:makeupshop/screens/BottomAppBar.dart';
// import 'package:location/location.dart';
import 'package:search_map_place/search_map_place.dart';

import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/updateSellModel.dart';
import 'package:makeupshop/main.dart';

import 'package:makeupshop/widget/MyDrawer.dart';

// ignore: must_be_immutable
class UpdateShipment extends StatefulWidget {
  int saleId;
  UpdateShipment(this.saleId);
  @override
  _UpdateShipmentState createState() => _UpdateShipmentState();
}

class _UpdateShipmentState extends State<UpdateShipment> {
  UpdateSell updateSell;

  List shippmentStatus = [
    'ordered',
    'shipped',
    'cancelled',
    'delivered',
    'packed'
  ];
  bool additionalExpense = false;
  Object _itemValue;
  int index;
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  TextEditingController deliveredTo = TextEditingController();

  // Map

  // LocationData _locationData;

  @override
  void initState() {
    super.initState();

    print('Sale ID');
    print(widget.saleId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(child: Column(children: []))),
      backgroundColor: Color(0xff021343),
      key: _scaffold,
      drawer: BuildMyDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff021343),
        leading: InkWell(
          onTap: () {
            String address = address1;
            Navigator.pop(context, address);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Shipment",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.9),
          image: DecorationImage(
              image: AssetImage('asset/bgColor.png'), fit: BoxFit.fill),
          // color: Colors.white.withOpacity(.9),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: deliveredTo,
                  decoration: InputDecoration(
                    hintText: 'Delivered To',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Container(
                  // height: 60,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white),
                  child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    hint: Text('Select Status'),
                    icon: Icon(Icons.arrow_drop_down_outlined),
                    value: _itemValue,
                    onChanged: (value) {
                      setState(() {
                        _itemValue = value;
                      });
                    },
                    items: shippmentStatus.map((value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  getSellMethod1(accessToken);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => bottombar(3)),
                      (route) => false);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff23bf5a),
                  ),
                  child: Center(
                    child: Text(
                      "UPDATE SHIPMENT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getSellMethod1(String accessToken) async {
    final String apiUrl =
        'https://erp.live/connector/api/update-shipping-status';

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer" + " $accessToken"
    };

    final msg = jsonEncode({
      "id": widget.saleId,
      "shipping_status": _itemValue.toString(),
      "delivered_to": deliveredTo.text,
    });

    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: msg);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(msg);
      print(responseString);
      return updateSellFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }
}
