import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeupshop/Models/ContactModel.dart';

import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/ListSells.dart';
import 'package:http/http.dart' as http;
import 'package:makeupshop/Models/SpecificContactModel.dart';
import 'package:makeupshop/Models/updateContactModel.dart';
import 'package:makeupshop/Models/updateSellModel.dart';
import 'package:makeupshop/main.dart';
import 'package:makeupshop/screens/BottomAppBar.dart';

import 'package:makeupshop/widget/buttons.dart';
import 'package:makeupshop/widget/fields.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:makeupshop/screens/savePdf.dart';

// ignore: must_be_immutable
class AllSalesListViewContainer extends StatefulWidget {
  ListSells listSells;
  ContactModel contactModel;
  // ListSells listSells1;
  var index;
  var contactIndex;
  List sortData = [];
  SpecificContact _specificContactModel;

  AllSalesListViewContainer(
      {this.listSells, this.contactModel, this.index, this.contactIndex});

  @override
  _AllSalesListViewContainerState createState() =>
      _AllSalesListViewContainerState();
}

class _AllSalesListViewContainerState extends State<AllSalesListViewContainer> {
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

  SpecificContact _specificContactModel;
  UpdateContactModel _updateContactModel;
  var listContact;
  String variationId;
  String productID;
  int contactID;
  UpdateSell updateSell;
  double total;
  double totalPaid;

  TextEditingController paidAmount = TextEditingController();
  TextEditingController customerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return widget.listSells.data.length == null
        ? Center(child: CircularProgressIndicator())
        : SizedBox(
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
                            fontSize: 15,
                            color: Color(0xff5080EE),
                            fontWeight: FontWeight.bold),
                      ),
                      widget.listSells.data[widget.index].paymentStatus
                                  .toString()
                                  .toUpperCase() ==
                              "DUE"
                          ? Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.orange[400],
                                  borderRadius: BorderRadius.circular(3)),
                              child: Text(
                                widget
                                    .listSells.data[widget.index].paymentStatus
                                    .toString()
                                    .toUpperCase(),
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : widget.listSells.data[widget.index].paymentStatus
                                      .toString()
                                      .toUpperCase() ==
                                  "PAID"
                              ? Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.green[600],
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Text(
                                    widget.listSells.data[widget.index]
                                        .paymentStatus
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
                                      color: Colors.purple[400],
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Text(
                                    widget.listSells.data[widget.index]
                                        .paymentStatus
                                        .toString()
                                        .toUpperCase(),
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
                        DateFormat('yyyy-MM-dd  hh:mm').format(widget
                            .listSells.data[widget.index].transactionDate),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
                      widget.contactModel.data[widget.contactIndex].firstName ==
                              null
                          ? Text('')
                          : Text(
                              widget.contactModel.data[widget.contactIndex]
                                  .firstName
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
                      Text('Location'),
                      widget.contactModel.data[widget.contactIndex]
                                  .supplierBusinessName ==
                              null
                          ? Text('')
                          : Text(
                              widget.contactModel.data[widget.contactIndex]
                                  .supplierBusinessName
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            paidAmount.text = totalPaidAmount.toString();
                            customerName.text = widget.contactModel
                                .data[widget.contactIndex].firstName
                                .toString();
                            contactID = widget
                                .contactModel.data[widget.contactIndex].id;
                            print('abababaaba');

                            // print(widget.listSells.data[widget.index]);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    showBox(context));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                              Text(
                                'Edit',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print('ababababab');

                            Get.defaultDialog(
                              title: "Are you Sure you want to Delete?",
                              middleText: '',
                              textConfirm: "Yes",
                              textCancel: "No",
                              onConfirm: () async {
                                await onPress(accessToken);
                                print(widget.listSells.data[widget.index].id);
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => bottombar(2)));
                                setState(() {});
                              },
                              radius: 50,
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              Text(
                                'Delete',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              total = 0.0;
                              totalPaid = 0.0;
                            });

                            ///
                            ///Create a new PDF document
                            ///
                            PdfDocument document = PdfDocument();
                            //Set the page size
                            document.pageSettings.size = PdfPageSize.a4;
                            //Gets the first page from the document
                            PdfGrid grid0 = PdfGrid();
                            grid0.columns.add(count: 2);
                            grid0.headers.add(1);
                            PdfGridRow header0 = grid0.headers[0];
                            header0.style = PdfGridRowStyle(
                                font: PdfStandardFont(
                                    PdfFontFamily.timesRoman, 20));
                            header0.cells[0].value =
                                'Invoice: ${widget.listSells.data[widget.index].invoiceNo}';
                            header0.cells[1].value =
                                'Date: ${DateFormat('yyyy-MM-dd hh:mm:ss').format(widget.listSells.data[widget.index].transactionDate)}';

//Apply the cell style to specific row cells
                            header0.cells[1].style = PdfGridCellStyle(
                              cellPadding: PdfPaddings(
                                left: 35,
                              ),
                            );

                            // header0.cells[1].style.stringFormat =
                            //     PdfStringFormat(
                            //         alignment: PdfTextAlignment.right,
                            //         lineAlignment: PdfVerticalAlignment.bottom,
                            //         wordSpacing: 10);
                            header0.cells[0].style.borders.top =
                                PdfPens.transparent;
                            header0.cells[0].style.borders.left =
                                PdfPens.transparent;
                            header0.cells[0].style.borders.right =
                                PdfPens.transparent;
                            header0.cells[0].style.borders.bottom =
                                PdfPens.transparent;

                            header0.cells[1].style.borders.top =
                                PdfPens.transparent;
                            header0.cells[1].style.borders.left =
                                PdfPens.transparent;
                            header0.cells[1].style.borders.right =
                                PdfPens.transparent;
                            header0.cells[1].style.borders.bottom =
                                PdfPens.transparent;
                            PdfLayoutResult res0 = grid0.draw(
                                    page: document.pages.add(),
                                    bounds: Rect.fromLTWH(0, 0, 0, 0))
                                as PdfLayoutResult;

//Create a PdfGrid
                            PdfGrid grid = PdfGrid();

//Add the columns to the grid
                            grid.columns.add(count: 5);
                            grid.headers.add(1);
                            PdfStringFormat format = PdfStringFormat();
                            format.alignment = PdfTextAlignment.center;
                            format.lineAlignment = PdfVerticalAlignment.bottom;

                            grid.columns[0].format = format;
                            grid.columns[1].format = format;
                            grid.columns[2].format = format;
                            grid.columns[3].format = format;
                            grid.columns[4].format = format;
                            // grid.columns[1].format = format;
                            PdfGridRow header = grid.headers[0];

                            header.style = PdfGridRowStyle(
                                backgroundBrush: PdfBrushes.gray,
                                textPen: PdfPens.white,
                                textBrush: PdfBrushes.white,
                                font: PdfStandardFont(
                                    PdfFontFamily.timesRoman, 12));
                            header.cells[0].value = 'Invoice No';
                            header.cells[1].value = 'Status';
                            header.cells[2].value = 'Payment Status';
                            header.cells[3].value = 'Customer Name';
                            header.cells[4].value = 'Shipping Status';

//Add rows to grid
                            PdfGridRow row1 = grid.rows.add();
                            row1.cells[0].value = widget
                                .listSells.data[widget.index].invoiceNo
                                .toString();
                            row1.cells[1].value = widget
                                .listSells.data[widget.index].status
                                .toString();
                            row1.cells[2].value = widget
                                .listSells.data[widget.index].paymentStatus
                                .toString();
                            row1.cells[3].value =
                                widget.contactModel.data[0].name ?? "";
                            row1.cells[4].value = widget.listSells
                                    .data[widget.index].shippingStatus ??
                                "";

//Draw grid on the page of PDF document and store the grid position in PdfLayoutResult
                            PdfLayoutResult result = grid.draw(
                                page: res0.page,
                                bounds: Rect.fromLTWH(
                                    0, res0.bounds.bottom + 15, 0, 300));

///////////////////////////////////////////////////////////////
                            PdfGrid grid3 = PdfGrid();
                            grid3.columns.add(count: 1);
                            grid3.headers.add(1);
                            PdfGridRow header2 = grid3.headers[0];
                            header2.style = PdfGridRowStyle(
                                font: PdfStandardFont(
                                    PdfFontFamily.timesRoman, 20));
                            header2.cells[0].value = 'Products:';
                            header2.cells[0].style.borders.top =
                                PdfPens.transparent;
                            header2.cells[0].style.borders.left =
                                PdfPens.transparent;
                            header2.cells[0].style.borders.right =
                                PdfPens.transparent;
                            header2.cells[0].style.borders.bottom =
                                PdfPens.transparent;
                            PdfLayoutResult res = grid3.draw(
                                page: result.page,
                                bounds: Rect.fromLTWH(
                                    0, result.bounds.bottom + 15, 90, 0));

//Create a second PdfGrid in the same page
                            PdfGrid grid2 = PdfGrid();

//Add columns to second grid
                            grid2.columns.add(count: 8);
                            grid2.headers.add(1);
                            // PdfStringFormat format = PdfStringFormat();
                            format.alignment = PdfTextAlignment.center;
                            format.lineAlignment = PdfVerticalAlignment.bottom;

                            grid2.columns[0].format = format;
                            grid2.columns[1].format = format;
                            grid2.columns[2].format = format;
                            grid2.columns[3].format = format;
                            grid2.columns[4].format = format;
                            grid2.columns[5].format = format;
                            grid2.columns[6].format = format;
                            grid2.columns[7].format = format;
                            PdfGridRow header1 = grid2.headers[0];
                            header1.style = PdfGridRowStyle(
                                backgroundBrush: PdfBrushes.gray,
                                textPen: PdfPens.white,
                                textBrush: PdfBrushes.white,
                                font: PdfStandardFont(
                                    PdfFontFamily.timesRoman, 12));
                            header1.cells[0].value = 'Sr.';
                            header1.cells[1].value = 'Product Id';
                            header1.cells[2].value = 'Quantity';
                            header1.cells[3].value = 'Unit Price';
                            header1.cells[4].value = 'Discount';
                            header1.cells[5].value = 'Tax';
                            header1.cells[6].value = 'Price inc. tax';
                            header1.cells[7].value = 'Subtotal';
//Add rows to grid
                            for (int i = 0;
                                i <
                                    widget.listSells.data[widget.index]
                                        .sellLines.length;
                                i++) {
                              total = total +
                                  (double.parse(widget
                                          .listSells
                                          .data[widget.index]
                                          .sellLines[i]
                                          .unitPrice
                                          .toString()) *
                                      double.parse(widget
                                          .listSells
                                          .data[widget.index]
                                          .sellLines[i]
                                          .quantity
                                          .toString()));
                              print('//////////////////////');
                              print('total price is ' + total.toString());
                              PdfGridRow row11 = grid2.rows.add();
                              row11.cells[0].value = (i + 1).toString();
                              row11.cells[1].value = widget.listSells
                                  .data[widget.index].sellLines[i].productId
                                  .toString();
                              row11.cells[2].value = widget.listSells
                                  .data[widget.index].sellLines[i].quantity
                                  .toString();

                              row11.cells[3].value = double.parse(widget
                                          .listSells
                                          .data[widget.index]
                                          .sellLines[i]
                                          .unitPriceBeforeDiscount)
                                      .toStringAsFixed(2) ??
                                  "";
                              row11.cells[4].value = double.parse(widget
                                          .listSells
                                          .data[widget.index]
                                          .sellLines[i]
                                          .lineDiscountAmount)
                                      .toStringAsFixed(2) ??
                                  "";
                              row11.cells[5].value = widget.listSells
                                      .data[widget.index].sellLines[i].taxId ??
                                  "";
                              row11.cells[6].value = double.parse(widget
                                          .listSells
                                          .data[widget.index]
                                          .sellLines[i]
                                          .unitPriceIncTax)
                                      .toStringAsFixed(2) ??
                                  "";
                              row11.cells[7].value = (double.parse(widget
                                              .listSells
                                              .data[widget.index]
                                              .sellLines[i]
                                              .unitPriceIncTax
                                              .toString()) *
                                          double.parse(widget
                                              .listSells
                                              .data[widget.index]
                                              .sellLines[i]
                                              .quantity
                                              .toString()))
                                      .toString() ??
                                  "";
                            }

//Draw the grid in PDF document page
                            PdfLayoutResult result1 = grid2.draw(
                                page: res.page,
                                bounds: Rect.fromLTWH(
                                    0, result.bounds.bottom + 50, 0, 0));

                            //Create a paymentGrid PdfGrid in the same page
                            PdfGrid paymentGrid = PdfGrid();

                            //Add columns to second grid
                            paymentGrid.columns.add(count: 1);
                            paymentGrid.headers.add(1);
                            PdfGridRow paymentHeader = paymentGrid.headers[0];
                            paymentHeader.cells[0].value = 'Payment Info:';

                            paymentHeader.cells[0].style.borders.top =
                                PdfPens.transparent;
                            paymentHeader.cells[0].style.borders.left =
                                PdfPens.transparent;
                            paymentHeader.cells[0].style.borders.right =
                                PdfPens.transparent;
                            paymentHeader.cells[0].style.borders.bottom =
                                PdfPens.transparent;
                            paymentHeader.style = PdfGridRowStyle(
                                font: PdfStandardFont(
                                    PdfFontFamily.timesRoman, 20));

                            ///
                            ///Draw the grid in PDF document page
                            ///
                            PdfLayoutResult paymentInfo = paymentGrid.draw(
                                page: result1.page,
                                bounds: Rect.fromLTWH(
                                    0, result1.bounds.bottom + 15, 0, 0));

                            //Create a paymentGrid PdfGrid in the same page
                            PdfGrid paymentGrid1 = PdfGrid();

                            //Add columns to second grid
                            paymentGrid1.columns.add(count: 5);
                            paymentGrid1.headers.add(1);
                            PdfGridRow paymentHeader1 = paymentGrid1.headers[0];
                            paymentHeader1.style = PdfGridRowStyle(
                                backgroundBrush: PdfBrushes.gray,
                                textPen: PdfPens.white,
                                textBrush: PdfBrushes.white,
                                font: PdfStandardFont(
                                    PdfFontFamily.timesRoman, 12));
                            paymentGrid1.columns[0].format = format;
                            paymentGrid1.columns[1].format = format;
                            paymentGrid1.columns[2].format = format;
                            paymentGrid1.columns[3].format = format;
                            paymentGrid1.columns[4].format = format;

                            paymentHeader1.cells[0].value = 'Sr.';
                            paymentHeader1.cells[1].value = 'Date';
                            paymentHeader1.cells[2].value = 'Ref. No';
                            paymentHeader1.cells[3].value = 'Amount';
                            paymentHeader1.cells[4].value = 'Method';
                            print('////////////////////////////////////');
                            print('.......................................');
                            print(widget.listSells.data[widget.index]
                                .paymentLines.length);

                            for (int j = 0;
                                j <
                                    widget.listSells.data[widget.index]
                                        .paymentLines.length;
                                j++) {
                              totalPaid = totalPaid +
                                  double.parse(widget
                                      .listSells
                                      .data[widget.index]
                                      .paymentLines[j]
                                      .amount);
                              PdfGridRow paymentInfoRow =
                                  paymentGrid1.rows.add();
                              paymentInfoRow.cells[0].value =
                                  (j + 1).toString();
                              paymentInfoRow.cells[1].value =
                                  DateFormat('yyyy-MM-dd').format(widget
                                      .listSells
                                      .data[widget.index]
                                      .paymentLines[j]
                                      .createdAt);
                              paymentInfoRow.cells[2].value = widget
                                  .listSells
                                  .data[widget.index]
                                  .paymentLines[j]
                                  .paymentRefNo
                                  .toString();
                              paymentInfoRow.cells[3].value = widget.listSells
                                  .data[widget.index].paymentLines[j].amount;
                              paymentInfoRow.cells[4].value = widget.listSells
                                  .data[widget.index].paymentLines[j].method
                                  .toString();
                            }

                            PdfLayoutResult paymentInfo1 = paymentGrid1.draw(
                                page: paymentInfo.page,
                                bounds: Rect.fromLTWH(
                                    0, paymentInfo.bounds.bottom + 10, 0, 0));
///////////////////////////////////////////////////////////////////////////////////
                            PdfGrid paymentDesGrid = PdfGrid();

                            paymentDesGrid.columns.add(count: 2);
                            paymentDesGrid.headers.add(1);

                            PdfStringFormat format1 = PdfStringFormat();
// format1.alignment = PdfTextAlignment.center;
                            format1.lineAlignment = PdfVerticalAlignment.bottom;
                            paymentDesGrid.columns[0].format = format1;
                            paymentDesGrid.columns[1].format = format;
                            PdfGridRow paymentRow = paymentDesGrid.headers[0];
                            paymentRow.cells[0].value = 'Total:';

                            //Add the styles to specific cell

                            paymentRow.cells[1].value = '${total}';

//Apply the cell style to specific row cells
                            paymentRow.cells[0].style = PdfGridCellStyle(
                              // backgroundBrush: PdfBrushes.lightYellow,
                              cellPadding: PdfPaddings(
                                left: 9,
                              ),
                              font:
                                  PdfStandardFont(PdfFontFamily.timesRoman, 10),
                              // textBrush: PdfBrushes.white,
                              // textPen: PdfPens.orange,
                            );

                            PdfGridRow paymentRowDiscount =
                                paymentDesGrid.rows.add();

                            paymentRowDiscount.cells[0].style =
                                PdfGridCellStyle(
                              // backgroundBrush: PdfBrushes.lightYellow,
                              cellPadding: PdfPaddings(
                                left: 9,
                              ),
                              font:
                                  PdfStandardFont(PdfFontFamily.timesRoman, 10),
                              // textBrush: PdfBrushes.white,
                              // textPen: PdfPens.orange,
                            );
                            paymentRowDiscount.cells[0].value =
                                'Discount:              (-)';
                            var discount = 0.0;
                            print(
                                '....................................... discout');
                            print(widget
                                .listSells.data[widget.index].discountType);
                            if (widget.listSells.data[widget.index].discountType
                                    .toString()
                                    .toString()
                                    .toLowerCase() ==
                                'fixed') {
                              paymentRowDiscount.cells[1].value =
                                  '${double.parse(widget.listSells.data[widget.index].discountAmount).toStringAsFixed(2)}';
                              discount = double.parse(widget
                                  .listSells.data[widget.index].discountAmount);
                            } else {
                              paymentRowDiscount.cells[1].value =
                                  '${double.parse(widget.listSells.data[widget.index].discountAmount)}' +
                                      '%';

                              discount = (double.parse(widget.listSells
                                          .data[widget.index].discountAmount) *
                                      (total)) /
                                  100;
                            }
                            PdfGridRow paymentRowTax =
                                paymentDesGrid.rows.add();

                            paymentRowTax.cells[0].style = PdfGridCellStyle(
                              // backgroundBrush: PdfBrushes.lightYellow,
                              cellPadding: PdfPaddings(
                                left: 9,
                              ),
                              font:
                                  PdfStandardFont(PdfFontFamily.timesRoman, 10),
                              // textBrush: PdfBrushes.white,
                              // textPen: PdfPens.orange,
                            );
                            paymentRowTax.cells[0].value =
                                'Tax:                      (+)';
                            paymentRowTax.cells[1].value =
                                '${double.parse(widget.listSells.data[widget.index].taxAmount).toStringAsFixed(2)}';

                            PdfGridRow paymentRowPacking =
                                paymentDesGrid.rows.add();

                            paymentRowPacking.cells[0].style = PdfGridCellStyle(
                              // backgroundBrush: PdfBrushes.lightYellow,
                              cellPadding: PdfPaddings(
                                left: 9,
                              ),
                              font:
                                  PdfStandardFont(PdfFontFamily.timesRoman, 10),
                              // textBrush: PdfBrushes.white,
                              // textPen: PdfPens.orange,
                            );
                            paymentRowPacking.cells[0].value =
                                'Packing Charges:  (+)';
                            paymentRowPacking.cells[1].value =
                                '${double.parse(widget.listSells.data[widget.index].packingCharge).toStringAsFixed(2)}';

                            PdfGridRow paymentRowShipping =
                                paymentDesGrid.rows.add();
                            //Apply the cell style to specific row cells
                            paymentRowShipping.cells[0].style =
                                PdfGridCellStyle(
                              // backgroundBrush: PdfBrushes.lightYellow,
                              cellPadding: PdfPaddings(
                                left: 9,
                              ),
                              font:
                                  PdfStandardFont(PdfFontFamily.timesRoman, 10),
                              // textBrush: PdfBrushes.white,
                              // textPen: PdfPens.orange,
                            );
                            paymentRowShipping.cells[0].value =
                                'Shipping Charges: (+)';
                            paymentRowShipping.cells[1].value =
                                '${double.parse(widget.listSells.data[widget.index].shippingCharges).toStringAsFixed(2)}';

                            PdfGridRow paymentRowPayable =
                                paymentDesGrid.rows.add();
                            paymentRowPayable.cells[0].style = PdfGridCellStyle(
                              // backgroundBrush: PdfBrushes.lightYellow,
                              cellPadding: PdfPaddings(
                                left: 9,
                              ),
                              font:
                                  PdfStandardFont(PdfFontFamily.timesRoman, 10),
                              // textBrush: PdfBrushes.white,
                              // textPen: PdfPens.orange,
                            );
                            paymentRowPayable.cells[0].value = 'Total Payable:';
                            paymentRowPayable.cells[1].value =
                                '${total + double.parse(widget.listSells.data[widget.index].shippingCharges) - discount}';

                            PdfGridRow paymentRowPaid =
                                paymentDesGrid.rows.add();

                            paymentRowPaid.cells[0].style = PdfGridCellStyle(
                              // backgroundBrush: PdfBrushes.lightYellow,
                              cellPadding: PdfPaddings(
                                left: 9,
                              ),
                              font:
                                  PdfStandardFont(PdfFontFamily.timesRoman, 10),
                              // textBrush: PdfBrushes.white,
                              // textPen: PdfPens.orange,
                            );
                            paymentRowPaid.cells[0].value = 'Total Paid:';
                            paymentRowPaid.cells[1].value = '${totalPaid}';

                            PdfGridRow paymentRowRemaining =
                                paymentDesGrid.rows.add();

                            paymentRowRemaining.cells[0].style =
                                PdfGridCellStyle(
                              // backgroundBrush: PdfBrushes.lightYellow,
                              cellPadding: PdfPaddings(
                                left: 9,
                              ),
                              font:
                                  PdfStandardFont(PdfFontFamily.timesRoman, 10),
                              // textBrush: PdfBrushes.white,
                              // textPen: PdfPens.orange,
                            );
                            paymentRowRemaining.cells[0].value =
                                'Total Remaining:';
                            paymentRowRemaining.cells[1].value =
                                '${(total + double.parse(widget.listSells.data[widget.index].shippingCharges) - discount) - (totalPaid)}';
/////////////////////////////////////

                            paymentDesGrid.draw(
                                page: paymentInfo1.page,
                                bounds: Rect.fromLTWH(300,
                                    paymentInfo1.bounds.bottom + 20, 0, 0));

                            List<int> bytes = document.save();
                            document.dispose();
                            saveAndLaunchFile(bytes, 'sale.pdf');
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.list_alt_rounded,
                                color: Colors.green,
                              ),
                              Text(
                                'View',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15),
                              )
                            ],
                          ),
                        ),
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
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 15),
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
        'Edit Sale Data',
        style: TextStyle(color: Colors.blue),
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
              'Please Enter Amount',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(
              height: 5,
            ),
            CustomeFields('Enter Paid Amount', paidAmount, null, null, false),
            SizedBox(
              height: 5,
            ),
            Text(
              'Please Enter Customer Name',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(
              height: 5,
            ),
            CustomeFields(
                'Enter Customer Name', customerName, null, null, false),
            SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () async {
                  print('ababababa');
                  await onPress1(accessToken);
                  await onPress2(accessToken);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => bottombar(2)),
                      (route) => false);
                  setState(() {});
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
      ToastMsg(Colors.green, 'Deleted SuccessFully');
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

  onPressSpecificContact(int id) async {
    final SpecificContact model = await getSpecificContact(id);
    setState(() {
      _specificContactModel = model;
    });
    if (_specificContactModel == null) {
      ToastMsg(Colors.red, 'Null Values');
    } else {
      print('Sussessfully');
      model.data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }
  }

  Future<SpecificContact> getSpecificContact(int id) async {
    final String apiUrl = 'https://erp.live/connector/api/contactapi/$id';
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {"Authorization": "Bearer" + " ${accessToken}"},
    );

    if (response.statusCode == 200) {
      final String responseString = response.body;
      return specificContactFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "Something Goes Wrong",
      );
      return null;
    }
  }
}
