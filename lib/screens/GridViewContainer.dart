import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/ProductsModel.dart';
import 'package:makeupshop/Models/searchProductModel.dart';

import 'package:makeupshop/Models/todoModel.dart';
import 'package:makeupshop/main.dart';
import 'package:makeupshop/widget/productDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class GridViewCont extends StatefulWidget {
  ProductsModel productsModel;
  int index;
  var accessToken;
  bool search;
  SearchProductsModel searchProductsModel;
  GridViewCont(this.productsModel, this.index, this.accessToken, this.search,
      this.searchProductsModel);

  @override
  _GridViewContState createState() => _GridViewContState();
}

class _GridViewContState extends State<GridViewCont> {
  StreamSubscription<Map<String, dynamic>> _subscription;
  final _db = Localstore.instance;
  final _items = <String, Todo>{};
  var subTotal = 0.0;
  var total = 0.0;
  List _productList = [];
  List _productList1 = [];
  String _proudtsId;
  @override
  void initState() {
    super.initState();
    getTodoModel();
  }

  getTodoModel() {
    // totalAmout = 0;
    // isAdded = false;
    _subscription = _db
        .collection('todos')
        .doc("e")
        .collection("cart")
        .stream
        .listen((event) {
      if (mounted) {
        setState(() {
          final item = Todo.fromMap(event);
          _items.putIfAbsent(item.id, () => item);

          for (var i = 1; i <= 1; i++) {
            subTotal = subTotal + (double.parse(item.price));
            // maxTotal = maxTotal + (double.parse(item.price));
            total = total + double.parse(item.price);
            // print(item.locationID);
            // print(item.productId);
            _productList.add(item.productId);
            _proudtsId = item.productId;
            _productList1 = _productList.toSet().toList();
            // for (i = 0; i < _productList1.length; i++) print(_productList1);
            print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
            // subTotal = maxTotal;

          }
        });
      }
    });

    if (kIsWeb) _db.collection('todos').stream.asBroadcastStream();
  }

  Widget build(BuildContext context) {
    final _items = <String, Todo>{};

    print("++++++++++++++++++++++++++++++++++++++++_________________");
    print(widget.productsModel.data[widget.index].image);
    print(widget.productsModel.data[widget.index].productVariations.first
        .variations.last.name);
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return FractionallySizedBox(
                heightFactor: 0.7,
                child: ProductDetail(widget.productsModel, widget.index),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Container(
                    child:
                        widget.productsModel.data[widget.index].imageUrl == null
                            ? Image(
                                image: NetworkImage(widget
                                    .productsModel.data[widget.index].imageUrl),
                                height: 150,
                                width: 150,
                                fit: BoxFit.contain,
                              )
                            : Image(
                                image: NetworkImage(widget
                                    .productsModel.data[widget.index].imageUrl),
                                height: 150,
                                width: 150,
                                fit: BoxFit.contain,
                              ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                      child: GestureDetector(
                          onTap: () async {
                            // for (int i = 0;
                            //               i <= widget.productsModel.data.length;
                            //               i++) {
                            //             productIdList.add(widget
                            //                 .productsModel.data[widget.index].id
                            //                 .toString());
                            //           }
                            // print(productIdList1);
                            final id = Localstore.instance
                                .collection('todos')
                                .doc(accessToken.toString().characters.first)
                                .collection("cart")
                                .doc()
                                .id;
                            final item = Todo(
                                id: id,
                                productId: widget
                                    .productsModel.data[widget.index].id
                                    .toString(),
                                title: widget
                                    .productsModel.data[widget.index].name,
                                price: widget
                                    .productsModel
                                    .data[widget.index]
                                    .productVariations
                                    .first
                                    .variations
                                    .first
                                    .sellPriceIncTax
                                    .toString(),
                                done: false,
                                quantity: 1,
                                image: widget
                                    .productsModel.data[widget.index].imageUrl,
                                expiryDate: widget.productsModel
                                    .data[widget.index].expiryPeriod
                                    .toString(),
                                locationID: widget
                                    .productsModel
                                    .data[widget.index]
                                    .productLocations[0]
                                    .pivot
                                    .locationId
                                    .toString(),
                                variationID: widget
                                    .productsModel
                                    .data[widget.index]
                                    .productVariations[0]
                                    .variations[0]
                                    .id
                                    .toString(),
                                discount: '',
                                discountType: '',
                                description: '');
                            ToastMsg(Colors.green, "Product Added to cart");
                            item.save(accessToken.toString().characters.first);
                            _items.putIfAbsent(item.id, () => item);

                            setState(() {});
                            print('KKKKKKKKKKKKLLLLLLLLLLLL');
                            print(_productList1);
                            getTodoModel();
                          },
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(18)),
                              child: Icon(Icons.shopping_cart_outlined,
                                  color: Colors.white))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.search == false
                        ? Expanded(
                            child: Text(
                              // "Green Casual Logo stock",
                              widget.productsModel.data[widget.index].name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          )
                        : Expanded(
                            child: Text(
                              // "Green Casual Logo stock",
                              widget
                                  .searchProductsModel.data[widget.index].name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            Container(
              child: Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Batch #:'),
                          widget.search == false
                              ? Text(
                                  widget.productsModel.data[widget.index].id
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                )
                              : Text(
                                  widget
                                      .searchProductsModel
                                      .data[widget.index]
                                      .productVariations
                                      .first
                                      .variationTemplateId
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widget.search == false
                                    ? Expanded(
                                        child: Text(
                                          '$currencySymbol${double.parse(widget.productsModel.data[widget.index].productVariations.first.variations.first.sellPriceIncTax.toString())}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blue),
                                        ),
                                      )
                                    : Text(
                                        double.parse(widget
                                                .searchProductsModel
                                                .data[widget.index]
                                                .productVariations
                                                .first
                                                .variationTemplateId
                                                .toString())
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),

                                for (int i = 0; i < _productList1.length; i++)
                                  widget.productsModel.data[widget.index].id
                                              .toString() ==
                                          _productList1[i].toString()
                                      ? Icon(
                                          Icons.circle,
                                          color: Colors.red,
                                          size: 10,
                                        )
                                      : Text(
                                          "",
                                          style: TextStyle(fontSize: 0),
                                        )
                                // ignore: unrelated_type_equality_checks
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
