import 'package:flutter/material.dart';
import 'package:makeupshop/Models/ListSells.dart';

// ignore: must_be_immutable
class RecentSaleListViewContainer extends StatefulWidget {
  ListSells listSells;
  var index;

  RecentSaleListViewContainer({this.listSells, this.index});

  @override
  _RecentSaleListViewContainerState createState() =>
      _RecentSaleListViewContainerState();
}

class _RecentSaleListViewContainerState
    extends State<RecentSaleListViewContainer> {
  @override
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
                  style: TextStyle(fontSize: 15, color: Color(0xff5080EE)),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(3)),
                  child: Text(
                    widget.listSells.data[widget.index].paymentStatus
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
                  'Date & Time:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.listSells.data[widget.index].transactionDate
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
                  'Invoice amount:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.listSells.data[widget.index].totalAmountRecovered
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
                  'Paid Amount:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.listSells.data[widget.index].totalAmountRecovered
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
                  'Customer Name:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.listSells.data[widget.index].customerGroupId
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
                  'Location:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.listSells.data[widget.index].locationId.toString(),
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
