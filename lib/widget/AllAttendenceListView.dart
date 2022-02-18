import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeupshop/Models/attendenceModel.dart';

// ignore: must_be_immutable
class AllAttendenceListView extends StatefulWidget {
  // ListSells listSells;
  AttendenceModel ledgerModel;
  var index;

  AllAttendenceListView({this.ledgerModel, this.index});

  @override
  _AllAttendenceListViewState createState() => _AllAttendenceListViewState();
}

class _AllAttendenceListViewState extends State<AllAttendenceListView> {
  @override
  Widget build(BuildContext context) {
    print('LLLLLLLLLLLLLLLLLLLL');
    print(widget.ledgerModel.data.clockOutTime.toString());
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
                    widget.ledgerModel.data.clockInTime[widget.index]
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
                  widget.ledgerModel.data.clockInTime[widget.index].toString(),
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
                  widget.ledgerModel.data.clockInTime[widget.index].toString(),
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
                  widget.ledgerModel.data.clockInTime[widget.index].toString(),
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
                  widget.ledgerModel.data.clockInTime[widget.index].toString(),
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
                  widget.ledgerModel.data.clockInTime[widget.index].toString(),
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
                  widget.ledgerModel.data.clockInTime[widget.index].toString(),
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
                  widget.ledgerModel.data.clockInTime[widget.index].toString(),
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
                  widget.ledgerModel.data.clockInTime[widget.index].toString(),
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
                  widget.ledgerModel.data.clockInTime[widget.index].toString(),
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
