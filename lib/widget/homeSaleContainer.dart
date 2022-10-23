import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:makeupshop/Models/ExpenseListModel.dart';

// ignore: must_be_immutable
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
    // ignore: unused_local_variable
    final _formattedNumber = NumberFormat.compact()
        .format(double.parse(widget.numberOfSales.toString()));
    // ignore: unused_local_variable
    final _paidAmount = NumberFormat.compact()
        .format(double.parse(widget.paidAmount.toString()));

    // ignore: unused_local_variable
    final _dueAmount =
        NumberFormat.compact().format(double.parse(dueAmount.toString()));
    // ignore: unused_local_variable
    final noOfExpenses = NumberFormat.compact()
        .format(double.parse(widget.numberOfExpense.toString()));
    final expenseAmount = NumberFormat.compact()
        .format(double.parse(widget.expenseAmount.toString()));
    final saleAmount = NumberFormat.compact()
        .format(double.parse(widget.salesAmount.toString()));

    return Container(
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
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
                    Text(
                      'Rs.' + saleAmount,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 23),
                    ),

                    ///
                    /// sales amount text
                    ///
                    Text(
                      'Sales',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              )),
              SizedBox(
                width: 10,
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
                      "Rs." + expenseAmount,
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
        ],
      ),
    );
  }
}
