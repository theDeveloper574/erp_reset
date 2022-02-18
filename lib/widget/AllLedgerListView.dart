import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:makeupshop/Models/ledgerModel.dart';

// ignore: must_be_immutable
class AllLedgerListView extends StatefulWidget {
  // ListSells listSells;
  LedgerModel ledgerModel;
  var index;

  AllLedgerListView({this.ledgerModel, this.index});

  @override
  _AllLedgerListViewState createState() => _AllLedgerListViewState();
}

class _AllLedgerListViewState extends State<AllLedgerListView> {
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
                  'Date: ',
                  style: TextStyle(fontSize: 15, color: Color(0xff5080EE)),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  // decoration: BoxDecoration(
                  //     color: Colors.green.shade100,
                  //     borderRadius: BorderRadius.circular(3)),
                  child: Text(
                    widget.ledgerModel.data.ledger[widget.index].date
                        .toString(),
                    style: TextStyle(color: Colors.green),
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
                  'Ref no',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.ledgerModel.data.ledger[widget.index].refNo.toString(),
                  style: TextStyle(fontSize: 14),
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
                Text(
                  widget.ledgerModel.data.ledger[widget.index].type.toString(),
                  style: TextStyle(fontSize: 14),
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
                  'Loaction:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.ledgerModel.data.ledger[widget.index].location
                      .toString(),
                  style: TextStyle(fontSize: 14),
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
                  'Payment Status:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.ledgerModel.data.ledger[widget.index].paymentStatus
                      .toString(),
                  style: TextStyle(fontSize: 14),
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
                  'Total:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.ledgerModel.data.ledger[widget.index].total.toString(),
                  style: TextStyle(fontSize: 14),
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
                  'Payment Method:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.ledgerModel.data.ledger[widget.index].paymentMethod
                      .toString(),
                  style: TextStyle(fontSize: 14),
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
                  'Debit:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.ledgerModel.data.ledger[widget.index].debit.toString(),
                  style: TextStyle(fontSize: 14),
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
                  'Credit:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.ledgerModel.data.ledger[widget.index].credit
                      .toString(),
                  style: TextStyle(fontSize: 14),
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
                  'Others:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.ledgerModel.data.ledger[widget.index].others
                      .toString(),
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
