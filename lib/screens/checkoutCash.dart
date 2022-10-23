import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupshop/Models/ContactModel.dart';
import 'package:makeupshop/Models/CreateSellModel.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:http/http.dart' as http;
import 'package:makeupshop/Models/TableModel.dart';
import 'package:makeupshop/Models/serviceTypesModel.dart';
import 'package:makeupshop/api/GloballyApi.dart';
import 'package:makeupshop/main.dart';
import 'package:makeupshop/screens/BottomAppBar.dart';
import 'package:makeupshop/screens/shipment.dart';
import 'package:makeupshop/style/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class CheckOutCash extends StatefulWidget {
  double unitPrice;
  List quantity;
  double subTotal;
  String locationId;
  List productId, variationId, unitId;
  CheckOutCash(this.unitPrice, this.quantity, this.productId, this.locationId,
      this.variationId, this.subTotal, this.unitId);
  @override
  _CheckOutCashState createState() => _CheckOutCashState();
}

class _CheckOutCashState extends State<CheckOutCash> {
  ServiceTypeModel serviceTypeModel;
  TableModel tableModel;
  TextEditingController shipingDetailsController = TextEditingController();
  TextEditingController recivedAmountController = TextEditingController();
  TextEditingController changeReturnController = TextEditingController();
  TextEditingController changeReturnCash = TextEditingController();
  TextEditingController shippmentCharges = TextEditingController();
  TextEditingController shippmentDetail = TextEditingController();
  TextEditingController deliveredTo = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController ShipingChargesController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController RecivedAmountController = TextEditingController();
  var splittedValue;
  bool isWalkin = false;
  TextEditingController shippmentAddress = TextEditingController();
  TextEditingController cardNumberEditingController = TextEditingController();
  TextEditingController cardNameEditingController = TextEditingController();
  TextEditingController bankNameEditingController = TextEditingController();
  TextEditingController chequeNumberEditingController = TextEditingController();
  TextEditingController printerCopyNo = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  ContactModel _contactModel;
  CreateSellModel _createSellModel;
  String _locationId;
  String _variationId;
  String _unitId;
  String _productId;
  String _contactId;
  List customerList = [];
  var result;
  bool toggleSwitch = false;
  bool byCash = true;
  bool byCard = false;
  bool byBank = false;
  bool bycheq = false;
  bool others = false;
  List expireMonth = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'August',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  Object _expireyMonth;
  var payment;
  List expireyYears = [
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010'
  ];
  Object _expireyYears;
  List itemnamePrinter = [
    'hp Printer 1',
    'hp Printer 2',
  ];
  Object _itemValPrinter;
  List itemnamePage = ['1x', '2x', '3x', '4x'];
  List customerNamedList = [];

  List shippmentStatus = [
    'ordered',
    'shipped',
    'cancelled',
    'delivered',
    'packed'
  ];
  Object _itemValue;
  Object _customerName;
  Object _itemValPage;
  int j;
  var typeOfService = [];
  Object serviceList;

  var tableList = [];
  Object tableItem;
  @override
  void initState() {
    onPressOfTypeOfService();
    onPressOfTable();
    // getIds();

    onPress(accessToken);
    print(widget.locationId);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // ShipingChargesController = 0.0;
  var changeAmount = 0.0;
  bool isSwitched = false;

  void getIds() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _productId = sharedPreferences.getString('Product_id').toString();
    _locationId = sharedPreferences.getString('Location_id').toString();
    _variationId = sharedPreferences.getString('Variation_id').toString();
    _unitId = sharedPreferences.getString('Unit_id').toString();
    print('KLKLLLLLLLLLLLLLLLLLLLKKKKKKKKKKKKKKKKKKKKKKKKK');
    print("Location Id");
    print(_locationId);

    print("Variation Id");
    print(_variationId);
    print("Unit Id");
    print(_unitId);
    print("Product Id");
    print(_productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('CheckOut'),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white,
                appBarColor,
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Shippment'),
                              Switch(
                                value: toggleSwitch,
                                onChanged: (value) {
                                  setState(() {
                                    toggleSwitch = !toggleSwitch;
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                            ],
                          ),
                          toggleSwitch
                              ? Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 0.5),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: TextFormField(
                                        controller: shippmentDetail,
                                        decoration: InputDecoration(
                                          hintText: 'Shipping Detail',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: TextFormField(
                                              onChanged: (value) {
                                                // if (value.isEmpty) {
                                                //   widget.subTotal =
                                                //       widget.subTotal;
                                                // } else {
                                                //   widget.subTotal =
                                                //       widget.subTotal +
                                                //           int.parse(value);
                                                // }
                                              },
                                              controller: shippmentCharges,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(8.0),
                                                hintText: 'Shippment Charges',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: TextFormField(
                                              controller: deliveredTo,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(8),
                                                hintText: 'Delivered To',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            color: Colors.white),
                                        child: DropdownButton(
                                          isExpanded: true,
                                          underline: SizedBox(),
                                          hint: Text('Select Status'),
                                          icon: Icon(
                                              Icons.arrow_drop_down_outlined),
                                          value: _itemValue,
                                          onChanged: (value) {
                                            setState(() {
                                              _itemValue = value;
                                            });
                                          },
                                          items: shippmentStatus.map((value) {
                                            return DropdownMenuItem(
                                                value: value,
                                                child: Text(value));
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(9)),
                                      child: TextFormField(
                                        controller: shippmentAddress,
                                        onChanged: (value) {
                                          setState(() {
                                            // address1 = shippmentAddress.text;
                                          });
                                        },

                                        // minLines: 2,
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              onPressed: () async {
                                                print('MMMMMMMM');
                                                final result =
                                                    await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Shipmentmap()));
                                                setState(() {
                                                  shippmentAddress.text =
                                                      result;
                                                });
                                                print(result);
                                              },
                                              icon: Icon(Icons.map_outlined),
                                            ),
                                            hintText: 'Shipping Address',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(9))),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                          SizedBox(height: 10.0),
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                            child: DropdownButton(
                              underline: SizedBox(),
                              isExpanded: true,
                              hint: Text("Customer Name"),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                              ),
                              value: _customerName,
                              onChanged: (value) {
                                setState(() {
                                  _customerName = value;
                                });
                                print('Customer Name is ' +
                                    _customerName
                                        .toString()
                                        .split(" ")[1]
                                        .toString());
                                if (_customerName
                                        .toString()
                                        .split(" ")[1]
                                        .toString()
                                        .toLowerCase() ==
                                    'walk-in-customers') {
                                  setState(() {
                                    isWalkin = true;
                                  });
                                } else {
                                  setState(() {
                                    isWalkin = false;
                                  });
                                }
                              },
                              items: customerList.map((value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 5.0),

                          ///
                          /// service type
                          ///
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                            child: DropdownButton(
                              underline: SizedBox(),
                              isExpanded: true,
                              hint: Text("Type of Service"),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                              ),
                              value: serviceList,
                              onChanged: (value) {
                                setState(() {
                                  serviceList = value;
                                });
                              },
                              items: typeOfService.map((value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                            ),
                          ),

                          SizedBox(height: 5.0),

                          ///
                          /// tables
                          ///
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                            child: DropdownButton(
                              underline: SizedBox(),
                              isExpanded: true,
                              hint: Text("Tables"),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                              ),
                              value: tableItem,
                              onChanged: (value) {
                                setState(() {
                                  tableItem = value;
                                });
                              },
                              items: tableList.map((value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                            ),
                          ),

                          Row(
                            children: [
                              Text(
                                "Summary",
                                style: TextStyle(color: Colors.black45),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Payable:",
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                    Text(
                                      "Rs. ${double.parse(widget.subTotal.toString())}",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Change Return:",
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                    Text(
                                      "Rs. $changeAmount",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       "Balance:",
                                //       style: TextStyle(color: Colors.black45),
                                //     ),
                                //     Text(
                                //       "$currencySymbol ${RecivedAmountController.text}",
                                //       style: TextStyle(
                                //           color: Colors.black,
                                //           fontSize: 18,
                                //           fontWeight: FontWeight.bold),
                                //     ),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Payment Method'),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      byCash = true;
                                      byBank = false;
                                      bycheq = false;
                                    });
                                  },
                                  child: byCash
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: yellow,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8,
                                                bottom: 8,
                                                right: 15,
                                                left: 15),
                                            child: Center(
                                              child: Text(
                                                'Cash',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey[350],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8,
                                                bottom: 8,
                                                right: 15,
                                                left: 15),
                                            child: Center(
                                              child: Text(
                                                'Cash',
                                                style: TextStyle(
                                                  color: yellow,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      byCash = false;
                                      byBank = true;
                                      bycheq = false;
                                    });
                                  },
                                  child: byBank
                                      ? Container(
                                          margin: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: yellow,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                'Bank Transfer',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          margin: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey[350],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                'Bank Transfer',
                                                style: TextStyle(
                                                  color: yellow,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      byCash = false;
                                      byBank = false;
                                      bycheq = true;
                                    });
                                  },
                                  child: bycheq
                                      ? Container(
                                          margin: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: yellow,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                'Easy Paisa',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          margin: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey[350],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                'Easy Paisa',
                                                style: TextStyle(
                                                  color: yellow,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          byCash
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                        color: Colors
                                                            .grey.shade300)),
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  onChanged: (text) {
                                                    if (text.isEmpty) {
                                                      setState(() {
                                                        changeAmount = 0.0;
                                                      });
                                                    } else
                                                      setState(() {
                                                        print('$changeAmount');
                                                        changeAmount = int.parse(
                                                                RecivedAmountController
                                                                    .text) -
                                                            widget.subTotal;
                                                      });
                                                    if (widget.subTotal <=
                                                        int.parse(text)) {
                                                      setState(() {
                                                        payment =
                                                            widget.subTotal;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        payment = text;
                                                      });
                                                    }
                                                  },
                                                  textAlign: TextAlign.center,
                                                  controller:
                                                      RecivedAmountController,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Received Amount",
                                                    hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                        color: Colors
                                                            .grey.shade300)),
                                                child: TextFormField(
                                                  enabled: false,
                                                  textAlign: TextAlign.center,
                                                  controller:
                                                      changeReturnController,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: double.parse(
                                                            changeAmount
                                                                .toString())
                                                        .toString(),
                                                    hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : byBank
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade300)),
                                              child: TextFormField(
                                                controller:
                                                    bankNameEditingController,
                                                decoration: InputDecoration(
                                                  suffixIcon: Image(
                                                      image: AssetImage(
                                                          "asset/msater_card_ic.png")),
                                                  border: InputBorder.none,
                                                  hintText: "Card Number",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade300)),
                                              child: TextFormField(
                                                controller:
                                                    bankNameEditingController,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Your Name on Card",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Row(children: [
                                              Expanded(
                                                  child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors
                                                            .grey.shade300)),
                                                child: DropdownButton(
                                                  underline: SizedBox(),
                                                  isExpanded: true,
                                                  hint: Text("Expirey Month"),
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                  ),
                                                  value: _expireyMonth,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _expireyMonth = value;
                                                    });
                                                  },
                                                  items:
                                                      expireMonth.map((value) {
                                                    return DropdownMenuItem(
                                                        value: value,
                                                        child: Text(value));
                                                  }).toList(),
                                                ),
                                              )),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                  child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors
                                                            .grey.shade300)),
                                                child: DropdownButton(
                                                  underline: SizedBox(),
                                                  isExpanded: true,
                                                  hint: Text("Expirey Year"),
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                  ),
                                                  value: _expireyYears,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _expireyYears = value;
                                                    });
                                                  },
                                                  items:
                                                      expireyYears.map((value) {
                                                    return DropdownMenuItem(
                                                        value: value,
                                                        child: Text(value));
                                                  }).toList(),
                                                ),
                                              ))
                                            ])
                                          ]),
                                    )
                                  : bycheq
                                      ? Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors
                                                            .grey.shade300)),
                                                child: TextFormField(
                                                  controller:
                                                      chequeNumberEditingController,
                                                  decoration: InputDecoration(
                                                    suffixIcon: Image(
                                                        image: AssetImage(
                                                            "asset/msater_card_ic.png")),
                                                    border: InputBorder.none,
                                                    hintText: "Easy Paisa",
                                                    hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                          SizedBox(
                            height: 15,
                          ),

                          Center(
                            child: GestureDetector(
                              onTap: () {
                                if (isWalkin) {
                                  if (widget.subTotal >
                                      double.parse(
                                          RecivedAmountController.text)) {
                                    ToastMsg(Colors.red,
                                        "you are a walk in customer, please pay total amount");
                                  } else {
                                    onPress1(accessToken);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                bottombar(2)));
                                  }
                                } else {
                                  onPress1(accessToken);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => bottombar(2)));
                                }
                                // print(_contactId);
                                // onPress1(accessToken);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => bottombar(2)));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 13),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: yellow,
                                ),
                                child: Center(
                                  child: Text(
                                    "Confirm Payment",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ))
            ],
          ),
        ),
      ]),
    );
  }

  onPressOfTypeOfService() async {
    final ServiceTypeModel model = await getTypeOfService();
    setState(() {
      serviceTypeModel = model;
    });
    if (serviceTypeModel == null) {
      ToastMsg(Colors.red, 'Try agian');
    } else {
      print('successfully');
      for (int i = 0; i < serviceTypeModel.data.length; i++) {
        typeOfService.add(serviceTypeModel.data[i].id.toString() +
            "." +
            serviceTypeModel.data[i].name);
      }
    }
  }

  ///
  /// table
  ///
  onPressOfTable() async {
    final TableModel model = await getTables();
    setState(() {
      tableModel = model;
    });
    if (tableModel == null) {
      ToastMsg(Colors.red, 'Try agian');
    } else {
      print('successfully');
      for (int i = 0; i < tableModel.data.length; i++) {
        tableList.add(
            tableModel.data[i].id.toString() + "." + tableModel.data[i].name);
      }
    }
  }

  onPress1(String accessToken) async {
    final CreateSellModel expense = await getSellMethod1(accessToken);

    setState(() {
      _createSellModel = expense;
    });
    if (_createSellModel == null) {
    } else {
      print('Successfully');
    }
  }

  // ignore: missing_return
  Future<CreateSellModel> getSellMethod1(String accessToken) async {
    final String apiUrl = 'https://food.erp.live/connector/api/sell';
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer" + " $accessToken"
    };
    splittedValue = _customerName.toString().split(" ");

    final msg = jsonEncode({
      "sells": [
        {
          "location_id": widget.locationId,
          "contact_id": splittedValue[0],
          "shipping_details": shippmentDetail.text,
          "shipping_address": shippmentAddress.text,
          "shipping_status": _itemValue,
          "delivered_to": deliveredTo.text,
          "shipping_charges": shippmentCharges.text,
          "change_return": 0,
          "table_id": tableItem.toString().split('.')[0].toString(),
          "types_of_service_id": serviceList.toString().split('.')[0].toString(),
          "products": [
            for (int i = 0; i < widget.productId.length; i++)
              {
                "product_id": widget.productId[i],
                "variation_id": widget.variationId[i],
                "quantity": 1,
              }
          ],
          "payments": [
            {
              "amount": payment,
              "method": "cash",
            }
          ]
        }
      ]
    });
    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: msg);

    if (response.statusCode == 200) {
      print(
        "Successfully ",
      );
    } else {
      ToastMsg(
        Colors.red,
        "Try again",
      );
      return null;
    }
  }

  onPress(String accessToken) async {
    final ContactModel sells = await getSellMethod(accessToken);

    setState(() {
      _contactModel = sells;
    });
    if (_contactModel == null) {
      ToastMsg(
        Colors.red,
        "Try again",
      );
    } else {
      for (int i = 0; i < _contactModel.data.length; i++) {
        if (_contactModel.data[i].type.toString().toLowerCase() != "supplier") {
          customerNamedList.add(_contactModel.data[i].id.toString() +
              " " +
              _contactModel.data[i].name.toString());

          customerList = customerNamedList.toSet().toList();
        }
      }
    }
  }
}

Future<ServiceTypeModel> getTypeOfService() async {
  final String apiUrl = 'https://food.erp.live/connector/api/types-of-service';
  final response = await http.get(Uri.parse(apiUrl), headers: {
    "Authorization": "Bearer" + " $accessToken",
  });
  if (response.statusCode == 200) {
    final String responseString = response.body;

    return serviceTypeModelFromJson(responseString);
  } else {
    ToastMsg(
      Colors.red,
      "Try again",
    );
    return null;
  }
}

///
/// tables
///
Future<TableModel> getTables() async {
  final String apiUrl = 'https://food.erp.live/connector/api/table';
  final response = await http.get(Uri.parse(apiUrl), headers: {
    "Authorization": "Bearer" + " $accessToken",
  });
  if (response.statusCode == 200) {
    final String responseString = response.body;

    return tableModelFromJson(responseString);
  } else {
    ToastMsg(
      Colors.red,
      "Try again",
    );
    return null;
  }
}

Future<ContactModel> getSellMethod(String accessToken) async {
  final String apiUrl = erpUrl + contactApi;
  final response = await http.get(Uri.parse(apiUrl), headers: {
    "Authorization": "Bearer" + " $accessToken",
    "Content-Type": "application/json",
    "Accept": "application/json",
  });

  if (response.statusCode == 200) {
    final String responseString = response.body;

    return contactModelFromJson(responseString);
  } else {
    ToastMsg(
      Colors.red,
      "Try again.",
    );
    return null;
  }
}
