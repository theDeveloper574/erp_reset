import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:localstore/localstore.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/ProductsModel.dart';
import 'package:makeupshop/Models/locationModel.dart';
import 'package:makeupshop/Models/searchProductModel.dart';
import 'package:makeupshop/Models/todoModel.dart';
import 'package:makeupshop/api/GloballyApi.dart';
import 'package:makeupshop/screens/GridViewContainer.dart';

import 'package:makeupshop/widget/ListViewContainer.dart';
import 'package:makeupshop/widget/MyDrawer.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../main.dart';

// ignore: must_be_immutable
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  ///Pull To refresh;
  int currentPage = 1;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  int totalPages = 3;
  String _data = '';
  bool isBrandFilter = false;
  bool isRefresh = false;
  List products = [];
  List filteredProducts = [];
  bool filter = false;
  bool issearch = false;
  final _items = <String, Todo>{};
  double total = 0.0;
  double subTotal = 0.0;
  StreamSubscription<Map<String, dynamic>> _subscription;
  final _db = Localstore.instance;
  @override
  void initState() {
    super.initState();
    onPress(accessToken).then((data) {
      setState(() {
        products = filteredProducts = data;
      });
    });
    getTodoModel();
    getLocations(accessToken);
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
            print(item.locationID);
            print(item.productId);
            print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
            // subTotal = maxTotal;

          }
        });
      }
    });

    if (kIsWeb) _db.collection('todos').stream.asBroadcastStream();
  }

  LocationModel locationModel;

  TextEditingController searchTextEditingController = TextEditingController();
  bool search = false;

  final db = Localstore.instance;
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  bool isedit = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ProductsModel _productsModel = ProductsModel();
  // ignore: deprecated_member_use

  var noteTitle;
  SearchProductsModel _searchProductsModel;
  String endPoint = "";
  bool isFilter = false;
  bool isLocationOn = false;
  // final String productApiUrl = "https://erp.live/connector/api/product";
  final String locationApiUrl = erpUrl + locationApi;
  var j;
  List productsId = [];
  int locationPages = 0;
  String getCategories;
  List itemsFromApi = [];
  List brandsFromApi = [];
  List locationFromApi = [];
  int itemCountForFilter = 0;
  int itemBrandFilter = 0;
  int itemsearchFilter = 0;
  int index1;
  var locationId;

  Object _itemVal;
  Object _itemValforLocation;

  Object _itemValue;
  int index = 1;

  searchData() {}

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                TextButton(
                  onPressed: () => exit(0),
                  child: new Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
        // ignore: missing_return
        onWillPop: _onWillPop,
        child: Scaffold(
            key: _scaffold,
            drawer: BuildMyDrawer(),
            body: Container(
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  _scaffold.currentState.openDrawer();
                                },
                                child: Image(
                                  image: AssetImage("asset/menu_ic.png"),
                                )),
                            Text(
                              "  Home",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              print("Button pressssedddddddddd");
                            });
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100.0,
                                child: DropdownButton(
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  // isExpanded: true,
                                  hint: Text(
                                    'Location',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),

                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                  ),
                                  value: _itemValforLocation,
                                  onChanged: (value) {
                                    print("Butttton presseddddddddddddddd");

                                    setState(() {
                                      isLocationOn = true;
                                      _itemValforLocation = value;
                                    });
                                  },
                                  items: locationFromApi.map((value) {
                                    return DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 17),
                                        ));
                                  }).toList(),
                                ),
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
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
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height * 0.1,
                            padding: EdgeInsets.symmetric(vertical: 18),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    //
                                    //    Scan Barcode
                                    //
                                    GestureDetector(
                                      child: Column(
                                        children: [
                                          Image(
                                            image:
                                                AssetImage("asset/scan_ic.png"),
                                          ),
                                          Text('Scan')
                                        ],
                                      ),
                                      onTap: () {
                                        issearch = true;
                                        scanBarcodeNormal();
                                      },
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),

                                    //
                                    //   Search TextForm Field
                                    //
                                    Expanded(
                                      child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10))),
                                          child: TextFormField(
                                            onChanged: (value) {
                                              setState(() {
                                                issearch = true;
                                                _data = value;
                                              });
                                            },
                                            controller:
                                                searchTextEditingController,
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 8, bottom: 5),
                                                border: InputBorder.none,
                                                hintText: 'Search...',
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                )
                                                // contentPadding: EdgeInsets.all()
                                                ),
                                          )),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          )),
                                      child: GestureDetector(
                                        child: Icon(Icons.search,
                                            color: Colors.white),
                                        onTap: () {
                                          issearch = true;
                                          endPoint = "/" +
                                              searchTextEditingController.text;
                                          // onSearchPress(accessToken);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),

                                    //
                                    //   Bottom Sheet
                                    //
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          filter = !filter;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Image(
                                            image: AssetImage(
                                                "asset/filter_ic.png")),
                                      ),
                                    ),
                                    SizedBox(width: 5),

                                    //
                                    //   ListView And Grid View
                                    //
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isedit = !isedit;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Image(
                                            image: isedit == false
                                                ? AssetImage(
                                                    "asset/grid_view_ic.png")
                                                : AssetImage(
                                                    "asset/list_view_ic.jpeg")),
                                      ),
                                    ),
                                  ],
                                ),
                                filter
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              // decoration: BoxDecoration(
                                              //     border: Border.all(
                                              //         color: Colors.blue)),
                                              width: 100.0,
                                              child: DropdownButton(
                                                isExpanded: true,
                                                underline: SizedBox(),
                                                // isExpanded: true,
                                                hint: Text(
                                                  'Category',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17),
                                                ),

                                                icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                ),
                                                value: _itemVal,
                                                onChanged: (value) {
                                                  print(
                                                      "Butttton presseddddddddddddddd");

                                                  setState(() {
                                                    isFilter = true;
                                                    _itemVal = value;
                                                  });
                                                },
                                                items:
                                                    itemsFromApi.map((value) {
                                                  return DropdownMenuItem(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 17),
                                                      ));
                                                }).toList(),
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              child: DropdownButton(
                                                isExpanded: true,
                                                underline: SizedBox(),
                                                // isExpanded: true,
                                                hint: Text(
                                                  'Brand',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17),
                                                ),

                                                icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                ),
                                                value: _itemValue,
                                                onChanged: (value) {
                                                  print(
                                                      "Butttton presseddddddddddddddd");

                                                  setState(() {
                                                    isBrandFilter = true;
                                                    _itemValue = value;
                                                  });
                                                },
                                                items:
                                                    brandsFromApi.map((value) {
                                                  return DropdownMenuItem(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 17),
                                                      ));
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          _productsModel.data == null
                              ? Center(child: CircularProgressIndicator())
                              : issearch == false
                                  ? isBrandFilter == false
                                      ? isFilter == false
                                          ? isLocationOn == false
                                              ? isedit == false
                                                  ? Expanded(
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                        child: ListView.builder(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 10),
                                                          itemBuilder:
                                                              (context, index) {
                                                            return _productsModel ==
                                                                    null
                                                                ? CircularProgressIndicator()
                                                                : ListViewContainer(
                                                                    _productsModel,
                                                                    index,
                                                                    accessToken,
                                                                    search,
                                                                    _searchProductsModel);
                                                          },
                                                          itemCount:
                                                              _productsModel
                                                                  .data.length,
                                                        ),
                                                      ),
                                                    )
                                                  : Expanded(
                                                      child: Container(
                                                        child: GridView.builder(
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing:
                                                                10,
                                                            mainAxisSpacing: 10,
                                                            childAspectRatio:
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    1100,
                                                          ),
                                                          itemCount:
                                                              _productsModel
                                                                  .data.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return GridViewCont(
                                                                _productsModel,
                                                                index,
                                                                accessToken,
                                                                search,
                                                                _searchProductsModel);
                                                          },
                                                        ),
                                                      ),
                                                    )
                                              : isLocationOn
                                                  ? isedit == false
                                                      ? Expanded(
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.15,
                                                            child: ListView
                                                                .builder(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          10),
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                for (var i = 0;
                                                                    i <=
                                                                        _productsModel.data.length -
                                                                            1;
                                                                    i++) {
                                                                  if (_productsModel
                                                                          .data[
                                                                              index]
                                                                          .productLocations[
                                                                              0]
                                                                          .name ==
                                                                      _itemValforLocation
                                                                          .toString()) {
                                                                    return ListViewContainer(
                                                                        _productsModel,
                                                                        index,
                                                                        accessToken,
                                                                        search,
                                                                        _searchProductsModel);
                                                                  }
                                                                }
                                                                return SizedBox();
                                                              },
                                                              itemCount:
                                                                  _productsModel
                                                                      .data
                                                                      .length,
                                                            ),
                                                          ),
                                                        )
                                                      : Expanded(
                                                          child: Container(
                                                            child: GridView
                                                                .builder(
                                                              gridDelegate:
                                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    2,
                                                                crossAxisSpacing:
                                                                    10,
                                                                mainAxisSpacing:
                                                                    10,
                                                                childAspectRatio:
                                                                    MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        1100,
                                                              ),
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                for (var i = 0;
                                                                    i <=
                                                                        _productsModel.data.length -
                                                                            1;
                                                                    i++) {
                                                                  if (_productsModel
                                                                          .data[
                                                                              index]
                                                                          .productLocations[
                                                                              0]
                                                                          .name ==
                                                                      _itemValforLocation
                                                                          .toString()) {
                                                                    return GridViewCont(
                                                                        _productsModel,
                                                                        index,
                                                                        accessToken,
                                                                        search,
                                                                        _searchProductsModel);
                                                                  }
                                                                }

                                                                return SizedBox();
                                                              },
                                                              itemCount:
                                                                  _productsModel
                                                                      .data
                                                                      .length,
                                                            ),
                                                          ),
                                                        )
                                                  : isFilter
                                          : isedit == false
                                              ? Expanded(
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                    child: ListView.builder(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10),
                                                      itemBuilder:
                                                          // ignore: missing_return
                                                          (context, index) {
                                                        for (var i = 0;
                                                            i <=
                                                                _productsModel
                                                                        .data
                                                                        .length -
                                                                    1;
                                                            i++) {
                                                          if (_productsModel
                                                                  .data[index]
                                                                  .category
                                                                  .name ==
                                                              _itemVal) {
                                                            if (isLocationOn ==
                                                                true) {
                                                              print(
                                                                  'ababbababaabab');
                                                              if (_productsModel
                                                                      .data[
                                                                          index]
                                                                      .productLocations[
                                                                          0]
                                                                      .name ==
                                                                  _itemValforLocation
                                                                      .toString()) {
                                                                print(
                                                                    'KKKKKKKKKKKK');
                                                                return ListViewContainer(
                                                                    _productsModel,
                                                                    index,
                                                                    accessToken,
                                                                    search,
                                                                    _searchProductsModel);
                                                              }
                                                            } else if (_productsModel
                                                                    .data[index]
                                                                    .category
                                                                    .name ==
                                                                _itemVal
                                                                    .toString()) {
                                                              return ListViewContainer(
                                                                  _productsModel,
                                                                  index,
                                                                  accessToken,
                                                                  search,
                                                                  _searchProductsModel);
                                                            }
                                                          }
                                                        }

                                                        return SizedBox();
                                                      },
                                                      itemCount: _productsModel
                                                          .data.length,
                                                    ),
                                                  ),
                                                )
                                              : Expanded(
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                    child: GridView.builder(
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 10,
                                                        mainAxisSpacing: 10,
                                                        childAspectRatio:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                1100,
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10),
                                                      itemBuilder:
                                                          (context, index) {
                                                        for (var i = 0;
                                                            i <=
                                                                _productsModel
                                                                        .data
                                                                        .length -
                                                                    1;
                                                            i++) {
                                                          if (_productsModel
                                                                  .data[index]
                                                                  .category
                                                                  .name ==
                                                              _itemVal
                                                                  .toString()) {
                                                            return GridViewCont(
                                                                _productsModel,
                                                                index,
                                                                accessToken,
                                                                search,
                                                                _searchProductsModel);
                                                          }
                                                        }
                                                        return SizedBox();
                                                      },
                                                      itemCount: _productsModel
                                                          .data.length,
                                                    ),
                                                  ),
                                                )
                                      : isBrandFilter
                                          ? isedit == false
                                              ? Expanded(
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                    child: ListView.builder(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10),
                                                      itemBuilder:
                                                          // ignore: missing_return
                                                          (context, index) {
                                                        for (var i = 0;
                                                            i <=
                                                                _productsModel
                                                                        .data
                                                                        .length -
                                                                    1;
                                                            i++) {
                                                          if (_productsModel
                                                                  .data[index]
                                                                  .brand
                                                                  .name ==
                                                              _itemValue) {
                                                            if (isLocationOn ==
                                                                true) {
                                                              print(
                                                                  'ababbababaabab');
                                                              if (_productsModel
                                                                      .data[
                                                                          index]
                                                                      .productLocations[
                                                                          0]
                                                                      .name ==
                                                                  _itemValforLocation
                                                                      .toString()) {
                                                                print(
                                                                    'KKKKKKKKKKKK');
                                                                return ListViewContainer(
                                                                    _productsModel,
                                                                    index,
                                                                    accessToken,
                                                                    search,
                                                                    _searchProductsModel);
                                                              }
                                                            } else if (_productsModel
                                                                    .data[index]
                                                                    .brand
                                                                    .name ==
                                                                _itemValue
                                                                    .toString()) {
                                                              return ListViewContainer(
                                                                  _productsModel,
                                                                  index,
                                                                  accessToken,
                                                                  search,
                                                                  _searchProductsModel);
                                                            }
                                                          }
                                                        }

                                                        return SizedBox();
                                                      },
                                                      itemCount: _productsModel
                                                          .data.length,
                                                    ),
                                                  ),
                                                )
                                              : Expanded(
                                                  child: Container(
                                                    child: GridView.builder(
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 10,
                                                        mainAxisSpacing: 10,
                                                        childAspectRatio:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                1100,
                                                      ),
                                                      itemBuilder:
                                                          (context, index) {
                                                        for (var i = 0;
                                                            i <=
                                                                _productsModel
                                                                        .data
                                                                        .length -
                                                                    1;
                                                            i++) {
                                                          if (_productsModel
                                                                  .data[index]
                                                                  .brand
                                                                  .name ==
                                                              _itemValue
                                                                  .toString()) {
                                                            return GridViewCont(
                                                                _productsModel,
                                                                index,
                                                                accessToken,
                                                                search,
                                                                _searchProductsModel);
                                                          }
                                                        }

                                                        return SizedBox();
                                                      },
                                                      itemCount: _productsModel
                                                          .data.length,
                                                    ),
                                                  ),
                                                )
                                          : issearch
                                  : isedit == false
                                      ? Expanded(
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.15,
                                            child: ListView.builder(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              itemBuilder: (context, index) {
                                                for (var i = 0;
                                                    i <=
                                                        _productsModel
                                                                .data.length -
                                                            1;
                                                    i++) {
                                                  if (_productsModel
                                                          .data[index].name
                                                          .toLowerCase()
                                                          .contains(_data
                                                              .toString()) ||
                                                      _productsModel
                                                          .data[index].sku
                                                          .toString()
                                                          .contains(_data
                                                              .toString())) {
                                                    if (isBrandFilter == true) {
                                                      // ignore: unrelated_type_equality_checks
                                                      if (_itemValue
                                                              .toString() ==
                                                          _productsModel
                                                              .data[index]
                                                              .brand
                                                              .name) {
                                                        return ListViewContainer(
                                                            _productsModel,
                                                            index,
                                                            accessToken,
                                                            search,
                                                            _searchProductsModel);
                                                      }
                                                    } else if (_productsModel
                                                            .data[index].name
                                                            .toLowerCase()
                                                            .contains(_data
                                                                .toString()) ||
                                                        _productsModel
                                                            .data[index].sku
                                                            .toString()
                                                            .contains(_data
                                                                .toString())) {
                                                      if (isFilter == true) {
                                                        if (_itemVal
                                                                .toString() ==
                                                            _productsModel
                                                                .data[index]
                                                                .category
                                                                .name) {
                                                          return ListViewContainer(
                                                              _productsModel,
                                                              index,
                                                              accessToken,
                                                              search,
                                                              _searchProductsModel);
                                                        }
                                                      } else if (_productsModel
                                                              .data[index].name
                                                              .toLowerCase()
                                                              .contains(_data
                                                                  .toString()) ||
                                                          _productsModel
                                                              .data[index].sku
                                                              .toString()
                                                              .contains(_data
                                                                  .toString())) {
                                                        if (isLocationOn ==
                                                            true) {
                                                          if (_itemValforLocation
                                                                  .toString() ==
                                                              _productsModel
                                                                  .data[index]
                                                                  .productLocations[
                                                                      0]
                                                                  .name) {
                                                            return ListViewContainer(
                                                                _productsModel,
                                                                index,
                                                                accessToken,
                                                                search,
                                                                _searchProductsModel);
                                                          }
                                                        } else if (_productsModel
                                                                .data[index]
                                                                .name
                                                                .toLowerCase()
                                                                .contains(_data
                                                                    .toLowerCase()) ||
                                                            _productsModel
                                                                .data[index].sku
                                                                .toString()
                                                                .contains(_data
                                                                    .toString())) {
                                                          return ListViewContainer(
                                                              _productsModel,
                                                              index,
                                                              accessToken,
                                                              search,
                                                              _searchProductsModel);
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                                return SizedBox();
                                              },
                                              itemCount:
                                                  _productsModel.data.length,
                                            ),
                                          ),
                                        )
                                      : Expanded(
                                          child: Container(
                                            child: GridView.builder(
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 10,
                                                  childAspectRatio:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          1100,
                                                ),
                                                itemCount:
                                                    _productsModel.data.length,
                                                itemBuilder: (context, index) {
                                                  if (_productsModel
                                                          .data[index].name
                                                          .toLowerCase()
                                                          .contains(_data
                                                              .toString()) ||
                                                      _productsModel
                                                          .data[index].sku
                                                          .toString()
                                                          .contains(_data
                                                              .toString())) {
                                                    if (isBrandFilter == true) {
                                                      // ignore: unrelated_type_equality_checks
                                                      if (_itemValue
                                                              .toString() ==
                                                          _productsModel
                                                              .data[index]
                                                              .brand
                                                              .name) {
                                                        return GridViewCont(
                                                            _productsModel,
                                                            index,
                                                            accessToken,
                                                            search,
                                                            _searchProductsModel);
                                                      }
                                                    } else if (_productsModel
                                                            .data[index].name
                                                            .toLowerCase()
                                                            .contains(_data
                                                                .toString()) ||
                                                        _productsModel
                                                            .data[index].sku
                                                            .toString()
                                                            .contains(_data
                                                                .toString())) {
                                                      if (isFilter == true) {
                                                        if (_itemVal
                                                                .toString() ==
                                                            _productsModel
                                                                .data[index]
                                                                .category
                                                                .name) {
                                                          return GridViewCont(
                                                              _productsModel,
                                                              index,
                                                              accessToken,
                                                              search,
                                                              _searchProductsModel);
                                                        }
                                                      } else if (_productsModel
                                                              .data[index].name
                                                              .toLowerCase()
                                                              .contains(_data
                                                                  .toString()) ||
                                                          _productsModel
                                                              .data[index].sku
                                                              .toString()
                                                              .contains(_data
                                                                  .toString())) {
                                                        if (isLocationOn ==
                                                            true) {
                                                          if (_itemValforLocation
                                                                  .toString() ==
                                                              _productsModel
                                                                  .data[index]
                                                                  .productLocations[
                                                                      0]
                                                                  .name) {
                                                            return ListViewContainer(
                                                                _productsModel,
                                                                index,
                                                                accessToken,
                                                                search,
                                                                _searchProductsModel);
                                                          }
                                                        } else if (_productsModel
                                                                .data[index]
                                                                .name
                                                                .toLowerCase()
                                                                .contains(_data
                                                                    .toLowerCase()) ||
                                                            _productsModel
                                                                .data[index].sku
                                                                .toString()
                                                                .contains(_data
                                                                    .toString())) {
                                                          return GridViewCont(
                                                              _productsModel,
                                                              index,
                                                              accessToken,
                                                              search,
                                                              _searchProductsModel);
                                                        }
                                                      }
                                                    }
                                                  }
                                                  return SizedBox();
                                                }),
                                          ),
                                        ),
                          SizedBox(
                            height: 20,
                          ),
                          _productsModel.data == null
                              ? Container()
                              : Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (currentPage > 1) {
                                            setState(() {
                                              currentPage = currentPage - 1;
                                            });
                                          }
                                          onPress(accessToken);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: Color(0xff031344),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            '<',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        currentPage.toString(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (currentPage <
                                              _productsModel.meta.lastPage) {
                                            setState(() {
                                              currentPage = currentPage + 1;
                                            });
                                            onPress(accessToken);
                                          }
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(left: 5),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 5),
                                            decoration: BoxDecoration(
                                                color: Color(0xff031344),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              '>',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]))));
  }

  //
  //    BottomSheet of Filter

  //

  void buttonPressed() {
    print('ababbbabba');
    print(getCategories);
    print(_itemValue);

    // showModalBottomSheet(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return new StatefulBuilder(builder: (BuildContext context, setState) {
    //         return Container(
    //           color: Color(0xff737373),
    //           height: MediaQuery.of(context).size.height * 0.5,
    //           child: Container(
    //             child: ListView(
    //               children: [
    //                 SizedBox(
    //                   height: MediaQuery.of(context).size.height * 0.02,
    //                 ),
    //                 Center(
    //                   child: Text(
    //                     "Filter",
    //                     style: TextStyle(
    //                       fontSize: 18,
    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: MediaQuery.of(context).size.height * 0.02,
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Row(
    //                     children: [
    //                       Image(
    //                         image: AssetImage("asset/username_check.png"),
    //                       ),
    //                       SizedBox(
    //                         width: MediaQuery.of(context).size.width * 0.02,
    //                       ),
    //                       Text(
    //                         "In Stock",
    //                         style: TextStyle(
    //                           fontSize: 16,
    //                           fontWeight: FontWeight.w400,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: MediaQuery.of(context).size.height * 0.01,
    //                 ),
    //                 Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   // height: MediaQuery.of(context).size.height * 0.05,
    //                   padding: EdgeInsets.all(10),
    //                   color: Colors.grey[100],
    //                   child: Row(
    //                     children: [
    //                       Text(
    //                         "Categories",
    //                         style: TextStyle(
    //                           color: Colors.grey,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: MediaQuery.of(context).size.height * 0.01,
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Container(
    //                     width: MediaQuery.of(context).size.width,
    //                     // height: MediaQuery.of(context).size.height * 0.07,
    //                     padding: EdgeInsets.symmetric(
    //                       horizontal: 15,
    //                     ),
    //                     decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       border: Border.all(
    //                         color: Colors.grey.shade300,
    //                       ),
    //                       borderRadius: BorderRadius.circular(10),
    //                     ),
    //                     child: DropdownButton(
    //                       underline: SizedBox(),
    //                       isExpanded: true,
    //                       hint: Text("Select categories"),
    //                       icon: Icon(
    //                         Icons.keyboard_arrow_down,
    //                       ),
    //                       value: _itemVal,
    //                       onChanged: (value) {
    //                         setState(() {
    //                           isFilter = true;
    //                           _itemVal = value;
    //                           endPoint = _itemVal;
    //                           print("this is end point$endPoint");

    //                           ///For selected item filter;
    //                           // for (var i = 0;
    //                           //     i <= _productsModel.data.length;
    //                           //     i++) {
    //                           //   if (_productsModel.data[i].category != null) {
    //                           //     if (_productsModel.data[i].category.name ==
    //                           //         _itemVal) {
    //                           //       print(_productsModel.data[i].name);
    //                           //       itemCountForFilter++;
    //                           //     }
    //                           //   } else {}
    //                           // }
    //                         });
    //                       },
    //                       items: itemsFromApi.map((value) {
    //                         return DropdownMenuItem(
    //                             value: value, child: Text(value));
    //                       }).toList(),
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: MediaQuery.of(context).size.height * 0.01,
    //                 ),
    //                 Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   // height: MediaQuery.of(context).size.height * 0.05,
    //                   padding: EdgeInsets.all(10),
    //                   color: Colors.grey[100],
    //                   child: Row(
    //                     children: [
    //                       Text(
    //                         "Brands",
    //                         style: TextStyle(
    //                           color: Colors.grey,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: MediaQuery.of(context).size.height * 0.01,
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Container(
    //                     width: MediaQuery.of(context).size.width,
    //                     // height: MediaQuery.of(context).size.height * 0.07,
    //                     padding: EdgeInsets.symmetric(
    //                       horizontal: 15,
    //                     ),
    //                     decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       border: Border.all(
    //                         color: Colors.grey.shade300,
    //                       ),
    //                       borderRadius: BorderRadius.circular(10),
    //                     ),
    //                     child: DropdownButton(
    //                       underline: SizedBox(),
    //                       isExpanded: true,
    //                       hint: Text("Select brands"),
    //                       icon: Icon(
    //                         Icons.keyboard_arrow_down,
    //                       ),
    //                       value: _itemValue,
    //                       onChanged: (value) {
    //                         setState(() {
    //                           isBrandFilter = true;
    //                           _itemValue = value;
    //                           endPoint = _itemValue;
    //                           for (var i = 0;
    //                               i <= _productsModel.data.length - 1;
    //                               i++) {
    //                             if (_productsModel.data[i].brand != null) {
    //                               if (_productsModel.data[i].brand.name ==
    //                                   _itemVal) {
    //                                 print(_productsModel.data[i].name);
    //                                 itemBrandFilter++;
    //                               }
    //                             } else {
    //                               return;
    //                             }
    //                           }
    //                         });
    //                       },
    //                       items: brandsFromApi.map((value) {
    //                         return DropdownMenuItem(
    //                             value: value, child: Text(value));
    //                       }).toList(),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.only(
    //                   topLeft: Radius.circular(20),
    //                   topRight: Radius.circular(20)),
    //             ),
    //           ),
    //         );
    //       });
    //     });
  }

  //
  //   Product Model Method
  //
  onPress(String accessToken, {bool isRefresh}) async {
    final ProductsModel user = await getSellMethod(accessToken, currentPage);
    setState(() {
      _productsModel = user;
    });

    if (_productsModel == null) {
      setState(() {
        print(_productsModel.data.first.id);
        ToastMsg(
          Colors.red,
          "Something went Wrong,try again",
        );
      });
    } else {
      ///For Categories List;
      for (var i = 0; i <= user.data.length - 1; i++) {
        if (_productsModel.data[i].category != null) {
          print("Added");
          if (itemsFromApi.contains(_productsModel.data[i].category.name)) {
            getCategories = _productsModel.data[i].category.name;
          } else {
            itemsFromApi.add(_productsModel.data[i].category.name);
          }
        }

        if (_productsModel.data[i].brand != null) {
          print("Added");
          if (brandsFromApi
              .contains(_productsModel.data[i].brand.name.toString())) {
            print(brandsFromApi);
            print("already added");
          } else {
            brandsFromApi.add(_productsModel.data[i].brand.name.toString());
            print(brandsFromApi);
          }
        }
      }
    }
  }

  //
  //   Product Api
  //

  Future<ProductsModel> getSellMethod(
      String accessToken, int currentPage) async {
    final String productApiUrl =
        'https://erp.live/connector/api/product?page=$currentPage';

    print("GetSellMethod RUnssss");
    print("++++++++++++++___+++++++++++++++");
    print("Bearer" + " $accessToken");
    print("this is new api after end point concatination");
    print(productApiUrl + endPoint);
    locationId = _itemValforLocation.toString().split(" ");
    print(locationId);

    final response =
        await http.get(Uri.parse(productApiUrl + endPoint), headers: {
      "Authorization": "Bearer" + " $accessToken",
    });

    print("thissss is status code+++++++++++++++++++");
    print(response.statusCode);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      return productsModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ${response.statusCode}",
      );
      return null;
    }
  }

  //
  //   Function Barcode Scanner
  //

  scanBarcodeNormal() async {
    try {
      await FlutterBarcodeScanner.scanBarcode(
              '#ff6666', 'Cancel', true, ScanMode.BARCODE)
          .then((value) {
        setState(() {
          _data = value;
          searchTextEditingController.text = _data;
        });
      });
      ToastMsg(Colors.green, _data);
    } on PlatformException {
      ToastMsg(Colors.red, 'Invalid');
    }
  }

  //
  //   Search Product
  //

  onSearchPress(String accessToken) async {
    for (var i = 0; i <= _productsModel.data.length; i++) {
      if (_productsModel.data[i].sku ==
              searchTextEditingController.text.toString().toLowerCase() ||
          _productsModel.data[i].name.toLowerCase() ==
              searchTextEditingController.text.toString().toLowerCase()) {
        ToastMsg(Colors.green, "${_productsModel.data[i].name}");
        print(_productsModel.data[i].sku);
        setState(() {
          j = i;
          print('++++++++++++++++++++$i');
          print(_productsModel.data[i].name);
          print('Match');
        });
      } else if (searchTextEditingController.text == null) {
        ToastMsg(Colors.red, "Product Not Found");
        setState(() {
          onPress(accessToken);
        });

        print('END POINT ++++++++++++++++++   $endPoint');
        print('SKU ==========  ${_productsModel.data[i].sku}');
        print(i);
        print(_productsModel.data[i].name);

        print('!!!!!!!!!!!!!!!!!!!!$j');
        print("testing end point");

        print("Not Match");
      }
    }
  }

  //
  //   Location Methods
  //

  Future<LocationModel> getLocationMethod(String accessToken) async {
    print("GetLocationMethod RUnssss");
    print("++++++++++++++___+++++++++++++++");
    print("Bearer" + " $accessToken");
    print("this is new api after end point concatination");
    print(locationApiUrl);

    final response = await http.get(Uri.parse(locationApiUrl), headers: {
      "Authorization": "Bearer" + " $accessToken",
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    print("thissss is status code+++++++++++++++++++");
    print(response.statusCode);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      return locationModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ${response.statusCode}",
      );
      return null;
    }
  }

  //
  //   Add Location in List
  //

  getLocations(String accessToken) async {
    final LocationModel location = await getLocationMethod(accessToken);
    if (location == null) {
    } else {
      for (var i = 0; i <= location.data.length - 1; i++) {
        if (location.data[i].name != null) {
          locationFromApi.add(location.data[i].name);
          // print(locationId[0].to);
          var splittedValue = locationFromApi.toString().split(" ");
          print('nnnnnnn');
          print(splittedValue[0]);
          print('mmmmmmmm');
          print(locationFromApi);
        } else {
          print("No Id Found");
        }
      }
    }
  }
}
