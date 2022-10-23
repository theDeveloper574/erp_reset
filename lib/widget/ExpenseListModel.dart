import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupshop/Models/ExpenseListModel.dart';

// ignore: must_be_immutable
class AllExpenseListView extends StatefulWidget {
  // ListSells listSells;
  ExpenseList expenseModel;
  var index;

  AllExpenseListView({this.expenseModel, this.index});

  @override
  _AllExpenseListViewState createState() => _AllExpenseListViewState();
}

class _AllExpenseListViewState extends State<AllExpenseListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        10,
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
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
                'Status: ',
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff5080EE),
                    fontWeight: FontWeight.bold),
              ),
              widget.expenseModel.data[widget.index].paymentStatus
                          .toString()
                          .split(".")[1]
                          .toString() ==
                      "PAID"
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(3)),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        widget.expenseModel.data[widget.index].paymentStatus
                            .toString()
                            .split(".")[1]
                            .toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )
                  : widget.expenseModel.data[widget.index].paymentStatus
                              .toString()
                              .split(".")[1]
                              .toString() ==
                          "DUE"
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.orange[400],
                              borderRadius: BorderRadius.circular(3)),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            widget.expenseModel.data[widget.index].paymentStatus
                                .toString()
                                .split(".")[1]
                                .toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.purple[400],
                              borderRadius: BorderRadius.circular(3)),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            widget.expenseModel.data[widget.index].paymentStatus
                                .toString()
                                .split(".")[1]
                                .toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
                          )),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                  DateFormat('yyyy-MM-dd hh:mm').format(
                      widget.expenseModel.data[widget.index].transactionDate),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Ref no',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Expanded(
                child: Text(
                  widget.expenseModel.data[widget.index].refNo.toString(),
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                'Location',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                widget.expenseModel.data[widget.index].locationId.toString(),
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
                'Total Amount',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                widget.expenseModel.data[widget.index].finalTotal.toString(),
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
                'Payment Due:',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                widget.expenseModel.data[widget.index].totalBeforeTax,
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
              Expanded(
                child: Text(
                  'Expense For:',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              widget.expenseModel.data[widget.index].expenseFor.length == 0
                  ? Text('')
                  : Expanded(
                      child: Text(
                        (widget.expenseModel.data[widget.index]
                                        .expenseFor['surname'] ??
                                    "")
                                .toString() +
                            " " +
                            (widget.expenseModel.data[widget.index]
                                    .expenseFor['first_name'] ??
                                "") +
                            " " +
                            (widget.expenseModel.data[widget.index]
                                        .expenseFor['last_name'] ??
                                    "")
                                .toString(),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
