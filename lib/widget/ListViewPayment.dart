import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:makeupshop/Models/ContactModel.dart';

import 'package:makeupshop/Models/sellModel.dart';

import 'package:makeupshop/Models/todoModel.dart';
import 'package:makeupshop/main.dart';
import 'package:makeupshop/screens/CustomerConfirmPayment.dart';

// ignore: must_be_immutable
class ListViewPayment extends StatefulWidget {
  SellModel _sellModel;
  ContactModel _contactModel;
  int index;
  int _contactIndex;

  ListViewPayment(
      this._sellModel, this._contactModel, this.index, this._contactIndex);

  @override
  _ListViewPaymentState createState() => _ListViewPaymentState();
}

class _ListViewPaymentState extends State<ListViewPayment> {
  var totalPaid = 0.0;
  String dueAmount;
  @override
  void initState() {
    super.initState();
    setState(() {
      totalPaid = 0.0;
    });
    if (widget._sellModel.data[widget.index].paymentLines.length == 1) {
      totalPaid = double.parse(
          widget._sellModel.data[widget.index].paymentLines.first.amount);
    } else {
      for (int i = 0;
          i < widget._sellModel.data[widget.index].paymentLines.length;
          i++) {
        totalPaid = totalPaid +
            double.parse(
                widget._sellModel.data[widget.index].paymentLines[i].amount);
      }
    }
    dueAmount =
        (double.parse((widget._sellModel.data[widget.index].finalTotal)) -
                totalPaid)
            .toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final _items = <String, Todo>{};

    return SingleChildScrollView(
      child: widget._sellModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : InkWell(
              onTap: () {
                print(widget._sellModel.data[widget.index].id);
                print(widget._sellModel.data[widget.index].contactId);
                print(widget
                    ._sellModel.data[widget.index].paymentLines.last.amount);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConfirmCustomerPayment(
                            widget._sellModel.data[widget.index].contactId
                                .toString(),
                            widget._sellModel.data[widget.index].paymentLines
                                .last.amount,
                            dueAmount)));
              },
              child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(children: [
                          // SizedBox(
                          //   height: 7,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Invoice #: ${widget._sellModel.data[widget.index].invoiceNo.toString()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color(0xff5080EE)),
                              ),
                              widget._sellModel.data[widget.index].paymentStatus
                                          .toString() ==
                                      'partial'
                                  ? Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.purple[400],
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Text(
                                        widget._sellModel.data[widget.index]
                                            .paymentStatus
                                            .toString()
                                            .toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  : widget._sellModel.data[widget.index]
                                              .paymentStatus
                                              .toString() ==
                                          'due'
                                      ? Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.orange[400],
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Text(
                                            widget._sellModel.data[widget.index]
                                                .paymentStatus
                                                .toString()
                                                .toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.green[400],
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Text(
                                            widget._sellModel.data[widget.index]
                                                .paymentStatus
                                                .toString()
                                                .toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
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
                                DateFormat('yyyy-MM-dd hh:mm').format(widget
                                    ._contactModel
                                    .data[widget.index]
                                    .createdAt),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget._sellModel.data[widget.index].locationId
                                          .toString() ==
                                      null
                                  ? Text('')
                                  : Text(
                                      'Location:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                              Text(
                                widget._contactModel.data[widget.index]
                                        .supplierBusinessName ??
                                    "",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Custmer Name:',
                                style: TextStyle(fontSize: 14),
                              ),
                              widget._contactModel.data[widget.index]
                                          .firstName ==
                                      null
                                  ? Text('')
                                  : Text(
                                      widget._contactModel.data[widget.index]
                                          .firstName
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                'Type:',
                                style: TextStyle(fontSize: 14),
                              ),
                              widget._contactModel.data == null
                                  ? Text('')
                                  : Text(
                                      widget
                                          ._contactModel.data[widget.index].type
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                              totalPaid == null
                                  ? Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Text(
                                      double.parse(totalPaid.toString())
                                          .toStringAsFixed(1),
                                      // double.parse(widget
                                      //         ._sellModel
                                      //         .data[widget.index]
                                      //         .paymentLines
                                      //         .first
                                      //         .amount
                                      //         .toString())
                                      //     .toStringAsFixed(1),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
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
                                'finalTotal:',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              widget._sellModel.data[widget.index].finalTotal ==
                                      null
                                  ? Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Text(
                                      widget._sellModel.data[widget.index]
                                          .finalTotal,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                'Due:',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              widget._contactModel.data[widget._contactIndex]
                                          .balance ==
                                      null
                                  ? Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Text(
                                      (double.parse((widget
                                                  ._sellModel
                                                  .data[widget.index]
                                                  .finalTotal)) -
                                              totalPaid)
                                          .toStringAsFixed(1),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.green[400],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        Text('Add Payment',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10)),
                                        Icon(Icons.forward_outlined,
                                            color: Colors.white)
                                      ],
                                    )),
                              ])
                        ]),
                      )
                    ],
                  )),
            ),
    );
  }
}
