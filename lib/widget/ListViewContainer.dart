import 'dart:ui';
import 'package:flutter/foundation.dart';

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:localstore/localstore.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/ProductsModel.dart';
import 'package:makeupshop/Models/localdataBaseModel.dart';
import 'package:makeupshop/Models/searchProductModel.dart';

import 'package:makeupshop/Models/todoModel.dart';
import 'package:makeupshop/main.dart';

import 'package:makeupshop/widget/productDetail.dart';

// ignore: must_be_immutable
class ListViewContainer extends StatefulWidget {
  ProductsModel productsModel;

  int index;
  var accessToken;
  bool search;
  SearchProductsModel searchProductsModel;

  ListViewContainer(this.productsModel, this.index, this.accessToken,
      this.search, this.searchProductsModel);

  @override
  _ListViewContainerState createState() => _ListViewContainerState();
}

class _ListViewContainerState extends State<ListViewContainer> {
  Grocery grocery;
  int count = 0;
  List productIdList = [];
  var productIdList1 = [];
  List _productsId1 = ['36055', '36054'];
  StreamSubscription<Map<String, dynamic>> _subscription;
  final _db = Localstore.instance;
  final _items = <String, Todo>{};
  double subTotal = 0.0;
  double total = 0.0;
  List _productList = [];
  List _productList1 = [];
  String _proudtsId;
  void deleteFunction(Todo item) {
    var subTotal2;
    print("4444444444444444444");
    print(item.price);
    print("4444444444444444444");
    _items.putIfAbsent(item.id, () => item);
    setState(() {
      item.delete(accessToken.toString().characters.first);
      _items.remove(item.id);
      subTotal2 = subTotal - double.parse(item.price);
      total = total + double.parse(item.price);

      subTotal = subTotal2;

      // --cartItem;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    final _items = <String, Todo>{};

    return SingleChildScrollView(
      child: widget.productsModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : InkWell(
              onTap: () {
                print('MMMMMMMMMMMM');
                // print(grocery.title);
                print(_items.length);
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return FractionallySizedBox(
                        heightFactor: 0.7,
                        child:
                            ProductDetail(widget.productsModel, widget.index),
                      );
                    });
              },
              child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius: BorderRadius.circular(25)),
                        child: widget.search == false
                            ? Image(
                                image: NetworkImage(widget
                                    .productsModel.data[widget.index].imageUrl),
                                fit: BoxFit.contain,
                              )
                            : Image(
                                image: NetworkImage(widget
                                    .productsModel.data[widget.index].imageUrl),
                                fit: BoxFit.contain,
                              ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.search == false
                                ? Text(
                                    widget
                                        .productsModel.data[widget.index].name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  )
                                : Text(
                                    widget.productsModel.data[widget.index].name
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Row(
                              children: [
                                Text('SKU #',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(
                                  width: 3,
                                ),
                                widget.search == false
                                    ? Text(
                                        widget.productsModel.data[widget.index]
                                            .sku
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      )
                                    : Text(
                                        widget.productsModel.data[widget.index]
                                            .sku
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                              ],
                            ),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Text('Current Stock #',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green)),
                                SizedBox(
                                  width: 3,
                                ),
                                widget.search == false
                                    ? Text(
                                        double.parse(widget
                                                    .productsModel
                                                    .data[widget.index]
                                                    .productVariations[0]
                                                    .variations[0]
                                                    .variationLocationDetails[0]
                                                    .qtyAvailable ??
                                                "")
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      )
                                    : Text(
                                        widget.productsModel.data[widget.index]
                                            .sku
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                widget.search == false
                                    ? Text(
                                        '$currencySymbol ${double.parse(widget.productsModel.data[widget.index].productVariations.first.variations.first.sellPriceIncTax.toString())}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue),
                                      )
                                    : Text(
                                        // '\$${widget.searchProductsModel.data[widget.index].productVariations.first.variations.first.sellPriceIncTax.toString()}',
                                        "hi",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue),
                                      ),
                                GestureDetector(
                                    onTap: () async {
                                      // for (int i = 0;
                                      //     i <= widget.productsModel.data.length;
                                      //     i++) {
                                      //   productIdList.add(widget
                                      //       .productsModel.data[widget.index].id
                                      //       .toString());
                                      // }
                                      print(productIdList1);
                                      // ignore: unrelated_type_equality_checks
                                      if (widget
                                              .productsModel
                                              .data[widget.index]
                                              .productVariations[0]
                                              .variations[0]
                                              .variationLocationDetails[0]
                                              .qtyAvailable ==
                                          0) {
                                        ToastMsg(
                                            Colors.red, "Unavialable Stock");
                                      } else {
                                        final id = Localstore.instance
                                            .collection('todos')
                                            .doc(accessToken
                                                .toString()
                                                .characters
                                                .first)
                                            .collection("cart")
                                            .doc()
                                            .id;
                                        final item = Todo(
                                            id: id,
                                            productId: widget.productsModel.data[widget.index].id
                                                .toString(),
                                            title: widget.productsModel
                                                .data[widget.index].name,
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
                                            image: widget.productsModel
                                                .data[widget.index].imageUrl,
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
                                        ToastMsg(Colors.green,
                                            "Product Added to cart");
                                        item.save(accessToken
                                            .toString()
                                            .characters
                                            .first);
                                        _items.putIfAbsent(item.id, () => item);

                                        setState(() {});
                                        print('KKKKKKKKKKKKLLLLLLLLLLLL');
                                        print(_productList1);
                                        getTodoModel();
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                      child: Icon(
                                        Icons.shopping_cart_outlined,
                                        color: Colors.white,
                                      ),
                                    )),
                              ],
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
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
    );
  }
}
