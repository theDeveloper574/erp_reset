import 'package:flutter/material.dart';

class ProductImage extends StatefulWidget {
  String image;
  ProductImage(this.image);
  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white)),
        // actions: [
        //   Container(
        //       padding: EdgeInsets.only(right: 20), child: Icon(Icons.share))
        // ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Image.network(widget.image),
            ),
          ),
        ],
      ),
    );
  }
}
