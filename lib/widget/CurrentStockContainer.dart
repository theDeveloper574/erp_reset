import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupshop/Models/CurrentStockModel.dart';

import 'package:makeupshop/Models/Users.dart';

import 'package:makeupshop/Models/todoModel.dart';

// ignore: must_be_immutable
class CurrentStockContainer extends StatefulWidget {
  CurrentStockModel _currentStockModel;
  int index;

  CurrentStockContainer(
    this._currentStockModel,
    this.index,
  );

  @override
  _CurrentStockContainerState createState() => _CurrentStockContainerState();
}

class _CurrentStockContainerState extends State<CurrentStockContainer> {
  @override
  Widget build(BuildContext context) {
    final _items = <String, Todo>{};

    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(0),
                      child: Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text('Product'),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    widget._currentStockModel.data[widget.index]
                                                .stock ==
                                            null
                                        ? Text('')
                                        : Text(
                                            "${widget._currentStockModel.data[widget.index].product}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                  ],
                                ))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text('Stock'),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    widget._currentStockModel.data[widget.index]
                                                .stock ==
                                            null
                                        ? Text('')
                                        : Text(
                                            "${double.parse(widget._currentStockModel.data[widget.index].stock).toStringAsFixed(1)}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                  ],
                                ))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text('SKU'),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    widget._currentStockModel.data[widget.index]
                                                .sku ==
                                            null
                                        ? Text('')
                                        : Text(
                                            widget._currentStockModel
                                                .data[widget.index].sku,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                  ],
                                ))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text('Stock Price'),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    widget._currentStockModel.data[widget.index]
                                                .stockPrice ==
                                            null
                                        ? Text('')
                                        : Text(
                                            "${double.parse(widget._currentStockModel.data[widget.index].stockPrice).toStringAsFixed(1)}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                  ],
                                ))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text('Type'),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    widget._currentStockModel.data[widget.index]
                                                .type
                                                .toString() ==
                                            null
                                        ? Text('')
                                        : Text(
                                            widget._currentStockModel
                                                .data[widget.index].type
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                  ],
                                ))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text('Unit'),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    widget._currentStockModel.data[widget.index]
                                                .unit ==
                                            null
                                        ? Text('')
                                        : Text(
                                            widget._currentStockModel
                                                .data[widget.index].unit,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                  ],
                                ))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text('Unit Price'),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    widget._currentStockModel.data[widget.index]
                                                .unitPrice ==
                                            null
                                        ? Text('')
                                        : Text(
                                            double.parse(widget
                                                    ._currentStockModel
                                                    .data[widget.index]
                                                    .unitPrice)
                                                .toStringAsFixed(1),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                  ],
                                ))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text('Enable Stock'),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    widget._currentStockModel.data[widget.index]
                                                .enableStock ==
                                            null
                                        ? Text('')
                                        : Text(
                                            widget._currentStockModel
                                                .data[widget.index].enableStock
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                  ],
                                ))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text('Total Sold'),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    widget._currentStockModel.data[widget.index]
                                                .totalSold ==
                                            null
                                        ? Text('')
                                        : Text(
                                            double.parse(widget
                                                    ._currentStockModel
                                                    .data[widget.index]
                                                    .totalSold)
                                                .toStringAsFixed(1),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                  ],
                                ))
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text('Location Name'),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    widget._currentStockModel.data[widget.index]
                                                .locationName ==
                                            null
                                        ? Text('')
                                        : Text(
                                            widget._currentStockModel
                                                .data[widget.index].locationName
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                  ],
                                ))
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
