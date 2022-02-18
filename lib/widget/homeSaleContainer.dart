import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:makeupshop/Models/ExpenseListModel.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';

import '../main.dart';

class HomeSalesContainer extends StatefulWidget {
  int numberOfSales;
  String expenseAmount;
  ExpenseList expenseModel;
  int numberOfExpense;
  double salesAmount, paidAmount, dueAmount;
  HomeSalesContainer(this.numberOfSales, this.salesAmount, this.paidAmount,
      this.expenseModel, this.expenseAmount, this.numberOfExpense);

  @override
  _HomeSalesContainerState createState() => _HomeSalesContainerState();
}

class _HomeSalesContainerState extends State<HomeSalesContainer> {
  var expense = 0.0;
  ExpenseList expenseModel;
  var dueAmount;
  // var noOfExpenses;
  // var expensesAmount;
  @override
  void initState() {
    // onPressOfExpense();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dueAmount =
        (double.parse((widget.salesAmount - widget.paidAmount).toString())
                .toStringAsFixed(1))
            .toString();
    final _formattedNumber = NumberFormat.compact()
        .format(double.parse(widget.numberOfSales.toString()));
    final _paidAmount = NumberFormat.compact()
        .format(double.parse(widget.paidAmount.toString()));

    final _dueAmount =
        NumberFormat.compact().format(double.parse(dueAmount.toString()));
    final noOfExpenses = NumberFormat.compact()
        .format(double.parse(widget.numberOfExpense.toString()));
    final expenseAmount = NumberFormat.compact()
        .format(double.parse(widget.expenseAmount.toString()));
    final saleAmount = NumberFormat.compact()
        .format(double.parse(widget.salesAmount.toString()));

    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(top: 25, bottom: 25),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    ///
                    /// number of sales
                    ///
                    Text(
                      _formattedNumber,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 23),
                    ),

                    ///
                    /// number of sales text
                    ///
                    Text(
                      'Number of Sale',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(top: 25, bottom: 25),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    ///
                    /// sales amount
                    ///
                    // totalProductPrice == null
                    //     ? Text(
                    //         r'$ 0',
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight:
                    //                 FontWeight.w600,
                    //             fontSize: 23),
                    //       )
                    //     :
                    Text(
                      '$currencySymbol' + saleAmount,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 23),
                    ),

                    ///
                    /// sales amount text
                    ///
                    Text(
                      'Sales Amount',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(top: 25, bottom: 25),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    ///
                    /// paid amount
                    ///
                    Text(
                      '$currencySymbol$_paidAmount',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 23),
                    ),

                    ///
                    /// paid amount text
                    ///
                    Text(
                      'Paid Amount',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(top: 25, bottom: 25),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    ///
                    /// due amount
                    ///

                    Text(
                      "$currencySymbol" + _dueAmount,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 23),
                    ),

                    ///
                    /// due amount text
                    ///
                    Text(
                      'Due Amount',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(top: 25, bottom: 25),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    ///
                    /// total expense
                    ///
                    Text(
                      noOfExpenses.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 23),
                    ),

                    ///
                    /// Number of expense
                    ///
                    Text(
                      'Number of Expense',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(top: 25, bottom: 25),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Text(
                      "$currencySymbol" + expenseAmount,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 23),
                    ),

                    ///
                    /// expense amount
                    ///
                    Text(
                      'Expense',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
        ],
      ),
    );
  }
}
