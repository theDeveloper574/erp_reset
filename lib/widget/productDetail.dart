import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/ProductsModel.dart';
import 'package:makeupshop/Models/todoModel.dart';

import '../main.dart';

class ProductDetail extends StatefulWidget {
  ProductsModel _productModel;
  int index;
  ProductDetail(this._productModel, this.index);
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final _items = <String, Todo>{};
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 40, top: 10),
                      width: 200,
                      child: Text(
                        widget._productModel.data[widget.index].name.toString(),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .07,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.03),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Custom Product Field:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          widget._productModel.data[widget.index]
                                      .productCustomField1 ==
                                  null
                              ? Text('')
                              : Text(
                                  widget._productModel.data[widget.index]
                                      .productCustomField1
                                      .toString(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SKU:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          widget._productModel.data[widget.index].sku == null
                              ? Text('')
                              : Text(
                                  widget._productModel.data[widget.index].sku
                                      .toString(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.03),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Alert Quantity:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          widget._productModel.data[widget.index]
                                      .alertQuantity ==
                                  null
                              ? Text('')
                              : Text(
                                  double.parse(widget._productModel
                                          .data[widget.index].alertQuantity
                                          .toString())
                                      .toStringAsFixed(2),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Brand:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          widget._productModel.data[widget.index].brand.name ==
                                  null
                              ? Text('')
                              : Text(
                                  widget._productModel.data[widget.index].brand
                                      .name
                                      .toString(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.03),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Unit:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          widget._productModel.data[widget.index].unit
                                      .shortName ==
                                  null
                              ? Text('')
                              : Text(
                                  widget._productModel.data[widget.index].unit
                                      .shortName
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          widget._productModel.data[widget.index].category
                                      .name ==
                                  null
                              ? Text('')
                              : Text(
                                  widget._productModel.data[widget.index]
                                      .category.name
                                      .toString(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.03),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Available in locations:',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          widget._productModel.data[widget.index]
                                      .productLocations[0].name ==
                                  null
                              ? Text('')
                              : Text(
                                  widget._productModel.data[widget.index]
                                      .productLocations[0].name
                                      .toString(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Card(
                      elevation: 4,
                      shadowColor: Color(0xff0BB8BA).withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: InkWell(
                        onTap: () {
                          print('location id');
                          print(widget._productModel.data[widget.index]
                              .productLocations[0].pivot.locationId);

                          print('variation id');
                          print(widget._productModel.data[widget.index]
                              .productVariations[0].variations[0].id);

                          final id = Localstore.instance
                              .collection('todos')
                              .doc(accessToken.toString().characters.first)
                              .collection("cart")
                              .doc()
                              .id;
                          final item = Todo(
                              id: id,
                              productId: widget
                                  ._productModel.data[widget.index].id
                                  .toString(),
                              title:
                                  widget._productModel.data[widget.index].name,
                              price: widget
                                  ._productModel
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
                                  ._productModel.data[widget.index].imageUrl,
                              expiryDate: widget
                                  ._productModel.data[widget.index].expiryPeriod
                                  .toString(),
                              locationID: widget
                                  ._productModel
                                  .data[widget.index]
                                  .productLocations[0]
                                  .pivot
                                  .locationId
                                  .toString(),
                              variationID: widget
                                  ._productModel
                                  .data[widget.index]
                                  .productVariations[0]
                                  .variations[0]
                                  .id
                                  .toString(),
                              description: '');
                          ToastMsg(Colors.green, "Add to cart successfully.");
                          item.save(accessToken.toString().characters.first);
                          _items.putIfAbsent(item.id, () => item);
                          print('Product Id');

                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: EdgeInsets.only(top: 11, bottom: 11),
                          decoration: BoxDecoration(
                              color: Colors.green[600],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                'ADD TO CART',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: -35,
                  left: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        print('/////////////////////');
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ProductIamge(widget
                        //             ._productModel
                        //             .data[widget.index]
                        //             .imageUrl)));
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          widget._productModel.data[widget.index].imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
