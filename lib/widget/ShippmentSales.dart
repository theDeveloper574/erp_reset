import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeupshop/Models/ContactModel.dart';

import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/ListSells.dart';
import 'package:http/http.dart' as http;
import 'package:makeupshop/Models/updateContactModel.dart';
import 'package:makeupshop/Models/updateSellModel.dart';
import 'package:makeupshop/main.dart';
import 'package:makeupshop/screens/BottomAppBar.dart';

import 'package:makeupshop/widget/buttons.dart';
import 'package:makeupshop/widget/fields.dart';

// ignore: must_be_immutable
class ShippmentSales extends StatefulWidget {
  ListSells listSells;
  ContactModel contactModel;
  // ListSells listSells1;
  var index;
  var contactIndex;

  ShippmentSales(
      {this.listSells, this.contactModel, this.index, this.contactIndex});

  @override
  _ShippmentSalesState createState() => _ShippmentSalesState();
}

class _ShippmentSalesState extends State<ShippmentSales> {
  var totalPaidAmount = 0.0;
  @override
  void initState() {
    super.initState();
    if (widget.listSells.data[widget.index].paymentLines.length != 0) {
      for (int i = 0;
          i < widget.listSells.data[widget.index].paymentLines.length;
          i++) {
        totalPaidAmount = totalPaidAmount +
            double.parse(
                widget.listSells.data[widget.index].paymentLines[i].amount);
      }
    } else {
      setState(() {
        totalPaidAmount = 0.0;
      });
    }
  }

  List shippmentStatus = [
    'ordered',
    'shipped',
    'cancelled',
    'delivered',
    'packed'
  ];
  Object _itemValue;
  Object _itemVal;
  UpdateContactModel _updateContactModel;
  var listContact;
  String variationId;
  String productID;
  int contactID;
  UpdateSell updateSell;
  TextEditingController paidAmount = TextEditingController();
  TextEditingController customerName = TextEditingController();
  String shipping = 'Not Shipped';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      // height: MediaQuery.of(context).size.height * 0.2,

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 10),
        // width: MediaQuery.of(context).size.width * 0.85,
        // height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Invoice #: ${widget.listSells.data[widget.index].invoiceNo.toString()}',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff5080EE),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                widget.listSells.data[widget.index].shippingStatus.toString() ==
                        "ordered"
                    ? Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.orange[400],
                            borderRadius: BorderRadius.circular(3)),
                        child: Text(
                          widget.listSells.data[widget.index].shippingStatus
                              .toString()
                              .toUpperCase(),
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : widget.listSells.data[widget.index].shippingStatus
                                .toString() ==
                            "shipped"
                        ? Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(3)),
                            child: Text(
                              widget.listSells.data[widget.index].shippingStatus
                                  .toString()
                                  .toUpperCase(),
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : widget.listSells.data[widget.index].shippingStatus
                                    .toString() ==
                                "delivered"
                            ? Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.green[600],
                                    borderRadius: BorderRadius.circular(3)),
                                child: Text(
                                  widget.listSells.data[widget.index]
                                      .shippingStatus
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : widget.listSells.data[widget.index].shippingStatus
                                        .toString() ==
                                    "packed"
                                ? Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.blue[700],
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Text(
                                      widget.listSells.data[widget.index]
                                          .shippingStatus
                                          .toString()
                                          .toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : widget.listSells.data[widget.index]
                                            .shippingStatus
                                            .toString() ==
                                        "cancelled"
                                    ? Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.redAccent,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Text(
                                          widget.listSells.data[widget.index]
                                              .shippingStatus
                                              .toString()
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[800],
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Text(
                                          'Not Shipped',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date & Time:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  DateFormat('yyyy-MM-dd   hh:mm').format(
                      widget.listSells.data[widget.index].transactionDate),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Paid Amount:',
                  style: TextStyle(fontSize: 14),
                ),
                totalPaidAmount == null
                    ? Text(
                        '0',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        totalPaidAmount.toString(),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Customer Name:',
                  style: TextStyle(fontSize: 14),
                ),
                widget.contactModel == null
                    ? Text('0')
                    : Text(
                        widget.contactModel.data[widget.contactIndex].firstName
                            .toString(),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Location:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.contactModel.data[widget.contactIndex]
                      .supplierBusinessName
                      .toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivered To',
                  style: TextStyle(fontSize: 14),
                ),
                widget.listSells.data[widget.index].deliveredTo == "null"
                    ? Text('')
                    : Text(
                        widget.listSells.data[widget.index].deliveredTo ?? "",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Shipping Charges',
                style: TextStyle(fontSize: 14),
              ),
              widget.listSells.data[widget.index].shippingCharges == null
                  ? Text('')
                  : Text(
                      double.parse(widget
                              .listSells.data[widget.index].shippingCharges)
                          .toString(),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
            ]),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Shipping Address',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                widget.listSells.data[widget.index].shippingAddress == null
                    ? Expanded(child: Text(''))
                    : Expanded(
                        child: Text(
                          widget.listSells.data[widget.index].shippingAddress,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
              ],
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.print,
                          color: Colors.orange,
                        ),
                        Text(
                          'Print',
                          style: TextStyle(color: Colors.orange, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // print(shipmentContactId);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => showBox(context));

                      print(shipmentSaleId);

                      paidAmount.text = widget
                          .listSells.data[widget.index].deliveredTo
                          .toString();
                    },
                    child: Row(
                      children: [
                        ImageIcon(
                            AssetImage(
                              'asset/shipment_tab_inactive.png',
                            ),
                            size: 35,
                            color: Colors.redAccent),

                        // title: new Text('Shipment'),

                        Text(
                          'Shipment',
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget showBox(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: const Text(
        'Update Shipment',
        style: TextStyle(color: Color(0xff031344), fontWeight: FontWeight.bold),
      )),
      content: SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: [
              Text('Sale Id:'),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.listSells.data[widget.index].id.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
            SizedBox(
              height: 5,
            ),
            Text(
              'Please Enter Delivered To',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(
              height: 5,
            ),
            CustomeFields('Enter Delivered To', paidAmount, null, null, false),
            SizedBox(
              height: 5,
            ),
            Text(
              'Please Select Shipping Status',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(
              height: 5,
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
                  value: _itemVal,
                  onChanged: (value) {
                    setState(() {
                      _itemVal = value;
                    });
                  },
                  items: shippmentStatus.map((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  print('ababababa');
                  getSellMethod3(accessToken);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => bottombar(3)));
                  setState(() {});
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => bottombar(2)));
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => bottombar(3)));
                },
                child: CustomeButton('Submit', Colors.green[300], Colors.green))
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  onPress(String accessToken) async {
    final String apiUrl =
        'https://erp.live/connector/api/sell/${widget.listSells.data[widget.index].id}';

    final response = await http.delete(Uri.parse(apiUrl), headers: {
      "Authorization": "Bearer" + " $accessToken",
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    if (response.statusCode == 200) {
      ToastMsg(Colors.red, 'Deleted SuccessFully');
    }
    print(accessToken);
    print(apiUrl);
  }

  onPress1(String accessToken) async {
    final UpdateSell expense = await getSellMethod1(accessToken);

    setState(() {
      updateSell = expense;
    });
    if (updateSell == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
    } else {
      print('Run SuccessFully');
    }
  }

  Future<UpdateSell> getSellMethod1(String accessToken) async {
    final String apiUrl =
        'https://erp.live/connector/api/sell/${widget.listSells.data[widget.index].id}';

    print("GetSellMethod RUnssss");
    print("++++++++++++++_____________+++++++++++++++");
    print("Bearer" + " $accessToken");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer" + " $accessToken"
    };
    final msg = jsonEncode({
      "contact_id": widget.listSells.data[widget.index].contactId,
      "payments": [
        {"amount": paidAmount.text}
      ]
    });
    final response =
        await http.put(Uri.parse(apiUrl), headers: headers, body: msg);

    print("Response Status : ${response.statusCode}");
    print("Response Body : ${response.contentLength}");
    print("Response Header  ${response.headers}");
    print("Response Request   ${response.request}");
    print("thissss is status code+++++++++++++++++++");
    print('ababababaabbbabab');
    print(response.body);
    print(response.statusCode);
    print('body' + '$msg');

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print('Run SuccessFully');
      print('PPPPPPPPPPPPPPPPPPPPP');
      ToastMsg(
        Colors.green,
        "Data Added SuccessFully ",
      );
      return updateSellFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }

  onPress2(String accessToken) async {
    final UpdateContactModel contact = await getSellMethod2(accessToken);

    setState(() {
      _updateContactModel = contact;
    });
    if (_updateContactModel == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
    } else {
      print('Run SuccessFully');
    }
  }

  Future<UpdateContactModel> getSellMethod2(String accessToken) async {
    final String apiUrl =
        'https://erp.live/connector/api/contactapi/$contactID';

    print("GetSellMethod RUnssss");
    print("++++++++++++++_____________+++++++++++++++");
    print("Bearer" + " $accessToken");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer" + " $accessToken"
    };
    final msg = jsonEncode({
      "first_name": customerName.text,
    });
    final response =
        await http.put(Uri.parse(apiUrl), headers: headers, body: msg);

    print("Response Status : ${response.statusCode}");
    print("Response Body : ${response.contentLength}");
    print("Response Header  ${response.headers}");
    print("Response Request   ${response.request}");
    print("thissss is status code+++++++++++++++++++");
    print('ababababaabbbabab');
    print(response.body);
    print(response.statusCode);
    print('body' + '$msg');

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print('Run SuccessFully');
      print('PPPPPPPPPPPPPPPPPPPPP');
      ToastMsg(
        Colors.green,
        "Data Added SuccessFully ",
      );
      return updateContactModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }

  Future<void> getSellMethod3(String accessToken) async {
    final String apiUrl =
        'https://erp.live/connector/api/update-shipping-status';

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer" + " $accessToken"
    };

    final msg = jsonEncode({
      "id": widget.listSells.data[widget.index].id,
      "shipping_status": _itemValue.toString(),
      "delivered_to": paidAmount.text,
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
