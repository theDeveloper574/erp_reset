import 'package:flutter/material.dart';

class View extends StatefulWidget {
  int saleID,
      businessId,
      locationId,
      type,
      paymentStatus,
      invoiceno,
      discountType,
      discountAmount,
      shippingDetails,
      shippingAddress,
      shippingStatus,
      deliveredTo,
      shippingCharges,
      finalTotal,
      createdBy,
      productId,
      variationId,
      amount,
      method,
      isreturn,
      paymentFor,
      customerName;

  View(
      this.saleID,
      this.businessId,
      this.locationId,
      this.type,
      this.paymentStatus,
      this.invoiceno,
      this.discountType,
      this.discountAmount,
      this.shippingDetails,
      this.shippingAddress,
      this.shippingStatus,
      this.deliveredTo,
      this.shippingCharges,
      this.finalTotal,
      this.createdBy,
      this.productId,
      this.variationId,
      this.amount,
      this.method,
      this.isreturn,
      this.paymentFor,
      this.customerName);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // drawer: BuildMyDrawer(widget.tokenModel, widget.userInfoModel),
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
                Color(0xff021343),
              ],
            ),
          ),
          child: Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            //
            //  CheckOut Header
            //
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 30,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context, false);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sale Detail",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/bgColor.png'),
                          fit: BoxFit.fill),
                      color: Colors.white.withOpacity(.9),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                    ),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Text(widget.saleID.toString()),
                    ]))))
          ]))
    ]));
  }
}
