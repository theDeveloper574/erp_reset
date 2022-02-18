import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstore/localstore.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';

import 'package:makeupshop/Models/ProductsModel.dart';
import 'package:makeupshop/Models/localdataBaseModel.dart';
import 'package:makeupshop/Models/searchProductModel.dart';
import 'package:makeupshop/screens/BottomAppBar.dart';
import 'package:makeupshop/screens/checkoutCash.dart';
import 'package:makeupshop/widget/ListViewContainer.dart';
import 'package:makeupshop/widget/MyDrawer.dart';
import '../main.dart';
import 'package:makeupshop/Models/todoModel.dart';

///
/// CART
///
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ///
  /// global key for drawer
  ///
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  Object _discountType;
  Grocery grocery;
  Object _taxRateItem;
  bool isEditColor = false;
  var discountTypeItem = ['A', 'B'];
  var taxRateItem = ['C', 'D'];
  bool isVisible = false;
  bool isChange = false;
  var getPrice;
  String data = "";
  bool isedit = false;
  var subTotal = 0.0;
  int counter = 0;
  double total = 0.0;
  bool isAdded;
  var totalAmout;
  int selectedIndex;
  int quantity = 1;
  String unitId;
  var finalAmount = 0.0;
  // var singlePrice = 0.0;
  var productIdmatch;
  var idmatch;
  var titlematch;
  var pricematch;
  var quantitymatch;
  var imagematch;
  var expireydatematch;
  var locationidmatch;
  var variationIdmatch;
  var unitIdmatch;
  var payment;
  
  double unitpriceedit;
  String productId, variationId, locationId;
  @override
  final _db = Localstore.instance;
  final _items = <String, Todo>{};
  StreamSubscription<Map<String, dynamic>> _subscription;
  TextEditingController discountItems = TextEditingController();
  TextEditingController discountSingleItem = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController unitPrice = TextEditingController();
  TextEditingController searchTextEditingController = TextEditingController();
  bool isSearch = false;
  SearchProductsModel searchProductsModel;
  var singleItemPrice;
  ProductsModel productsModel;
  int currentPage = 1;
  bool isProduct = false;
  var unitPrice1;
  double maxTotal = 0.0;
  String _data = "";
  double discountedit;
  List itemname = [
    'Fix',
    'Percentage',
  ];
  List itemname1 = [
    'Fix',
    'Percentage',
  ];
  Object _discountType1;
  List allProductId = [];
  List allvariationId = [];

  List allunitId = [];
  List allquantity = [];
  List sortProductsId = [];
  List sortVariationId = [];
  List sortlocationId = [];
  List sortUnitId = [];
  List sortquantity = [];
  double discount = 0.0;
  void initState() {
    onPressAllProduct(currentPage);
    getTodoModel();
    super.initState();
  }

  getTodoModel() {
    totalAmout = 0;
    isAdded = false;
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
            maxTotal = maxTotal + (double.parse(item.price));
            total = total + double.parse(item.price);
            // subTotal = maxTotal;

          }
        });
      }
    });

    if (kIsWeb) _db.collection('todos').stream.asBroadcastStream();
  }

  double subTotalCountMethod(Todo item) {
    setState(() {
      print("heeeeeeeeeeeeeeeeeee");
      subTotal = subTotal + (double.parse(item.price));
      maxTotal = maxTotal + (double.parse(item.price));
      print(subTotal);
      print("mmm");
    });
  }

  double subTotalCountMethodMinus(Todo item) {
    setState(() {
      print("heeeeeeeeeeeeeeeeeee");
      subTotal = subTotal - (double.parse(item.price));

      maxTotal = maxTotal - (double.parse(item.price));
      print(subTotal);
      print("mmm");
    });
  }

  ///Total amout on buttom sheet after plus
  // ignore: missing_return

  var calculatedValue;
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
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => bottombar(4)),
          (route) => false);

      // --cartItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    //  onWill Pop Function
    //
    //
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure'),
              content: new Text('Do you want to exit an App?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text(
                    'No',
                    style: TextStyle(color: Color(0xff4957BA)),
                  ),
                ),
                TextButton(
                  onPressed: () => exit(0),
                  child: new Text(
                    'Yes',
                    style: TextStyle(color: Color(0xff4957BA)),
                  ),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          key: _scaffold,

          ///
          /// side menu or sider
          ///
          drawer: BuildMyDrawer(),
          backgroundColor: Color(0xff031344),

          ///
          /// app bar
          ///
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xff031344),
            leading: InkWell(
                onTap: () {
                  ///
                  /// when user click on menu icon side menu is opened.
                  ///
                  _scaffold.currentState.openDrawer();
                },

                ///
                ///  menu icon
                ///
                child: Container(
                    margin: EdgeInsets.only(top: 17, bottom: 14, left: 7),
                    child: Image(image: AssetImage("asset/menu_ic.png")))),

            ///
            /// app bar text
            ///
            title: Text('Carts'),
            actions: [
              Container(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isProduct = true;
                        });
                      },
                      child: Icon(Icons.add)))
            ],
          ),
          body: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'asset/bgColor.png',
                  ),
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),

                ///
                /// background gradient color
                ///
                gradient: LinearGradient(colors: [
                  Color(0xffF3FCFE),
                  Color(0xffE8F8F0),
                  Color(0xffDAF1F9),
                ]),
              ),
              child: Column(children: [
                Expanded(
                    child: Stack(children: [
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 120),
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final key = _items.keys.elementAt(index);
                        final item = _items[key];
                        final i = item;
                        // singlePrice = singlePrice + double.parse(item.price);
                        // totalAmout = double.parse(item.price);
                        // singleItemPrice =
                        //     double.parse(item.price) * item.quantity;
                        // singlePrice = singleItemPrice;
                        // // price = item.price;
                        // print('KKKKKKKKKKKKKKKKKKKKKKK');
                        // print(item.productId);
                        allProductId.add(item.productId);
                        sortProductsId = allProductId.toSet().toList();

                        allvariationId.add(item.variationID);
                        sortVariationId = allvariationId.toSet().toList();
                        allunitId.add(item.unitId);
                        sortUnitId = allunitId.toSet().toList();
                        // alllocationId.add(item.locationID);
                        // sortlocationId = alllocationId.toSet().toList();
                        allquantity.add(item.quantity);
                        sortquantity = allquantity.toSet().toList();
                        locationId = item.locationID;

                        ///
                        /// call cart items
                        ///
                        return InkWell(
                            onTap: () {
                              // print('product id' + item.productId);
                              // print('variation id' + item.variationID);
                              // print('Unit Id ' + item.unitId);
                              // setState(() {
                              //   selectedIndex = index;
                              //   finalAmount = double.parse(item.price);
                              //   total = double.parse(item.price);
                              //   quantity = item.quantity;
                              //   productId = item.productId;
                              //   locationId = item.locationID;
                              //   variationId = item.variationID;
                              //   unitId = item.unitId;
                              // });
                            },
                            child: Card(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: 5,
                                  bottom: 13,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: selectedIndex == index
                                        ? Border.all(color: Colors.blue)
                                        : Border.all(
                                            color:
                                                Colors.black.withOpacity(0.1)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    ///
                                    /// product image, name, expiry date, batch, price, increement and decrement
                                    ///
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    gradient:
                                                        LinearGradient(colors: [
                                                      Color(0xffF3FCFE),
                                                      Color(0xffF3FCFE),
                                                      Color(0xffF3FCFE),
                                                    ]),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    height: 70,
                                                    margin: EdgeInsets.all(7),
                                                    child: Center(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: item.image ==
                                                                null
                                                            ? Image.network('')
                                                            : Image.network(
                                                                item.image,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          Expanded(
                                              flex: 6,
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ///
                                                    /// product name
                                                    ///
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 3),
                                                      child: Text(
                                                        item.title,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Batch #: ${item.productId}',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5)),
                                                        ),
                                                        Text(
                                                          'Expiry Date: ${item.expiryDate.toString()}',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5)),
                                                        )
                                                      ],
                                                    ),

                                                    ///
                                                    /// price and increment and decrement
                                                    ///
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              '$currencySymbol ${((double.parse(item.price)))}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      15)),
                                                          Row(
                                                            children: [
                                                              ///
                                                              /// remove or minus
                                                              ///
                                                              InkWell(
                                                                onTap: () {
                                                                  if (item.quantity >
                                                                      1) {
                                                                    setState(
                                                                        () {
                                                                      // item.quantity ++;

                                                                      String
                                                                          newValue =
                                                                          (item.quantity--)
                                                                              .toString();

                                                                      double
                                                                          counter =
                                                                          double.parse(
                                                                              item.price);
                                                                      var testCounter =
                                                                          counter *
                                                                              item.quantity;
                                                                      testCounter = double.parse(
                                                                              newValue) -
                                                                          double.parse(
                                                                              item.price);
                                                                      print(
                                                                          "this is new counter $testCounter this is new Value ");
                                                                      subTotalCountMethodMinus(
                                                                          item);
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              4,
                                                                          vertical:
                                                                              4),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .remove,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            18,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.25),
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                7),
                                                                        bottomLeft:
                                                                            Radius.circular(7)),
                                                                  ),
                                                                ),
                                                              ),

                                                              ///
                                                              /// quantity
                                                              ///
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            9,
                                                                        vertical:
                                                                            3.5),
                                                                color: Color(
                                                                    0xffEFF2F3),
                                                                child: Text(
                                                                  '${item.quantity}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                              ),

                                                              ///
                                                              /// add
                                                              ///
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    // item.quantity ++;

                                                                    String
                                                                        newValue =
                                                                        (item.quantity++)
                                                                            .toString();

                                                                    double
                                                                        counter =
                                                                        double.parse(
                                                                            item.price);
                                                                    var testCounter =
                                                                        counter *
                                                                            item.quantity;
                                                                    testCounter = double.parse(
                                                                            newValue) *
                                                                        double.parse(
                                                                            item.price);
                                                                    print(
                                                                        "this is new counter $testCounter this is new Value ");
                                                                    subTotalCountMethod(
                                                                        item);
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              4,
                                                                          vertical:
                                                                              4),
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 18,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xff031344),
                                                                    borderRadius: BorderRadius.only(
                                                                        topRight:
                                                                            Radius.circular(
                                                                                7),
                                                                        bottomRight:
                                                                            Radius.circular(7)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Divider(),

                                    ///
                                    /// edit, delete
                                    ///
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: Row(
                                            children: [
                                              Text(
                                                'Total: ',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                "$currencySymbol ${double.parse(item.price) * item.quantity}",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ))),
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      deleteFunction(item);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.delete,
                                                          color: Colors.red,
                                                        ),
                                                        Text(
                                                          'Delete',
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 15),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        unitPrice.text =
                                                            double.parse(
                                                                    item.price)
                                                                .toString();
                                                        getPrice = item.id;
                                                        productIdmatch =
                                                            item.productId;
                                                        print(productIdmatch);
                                                        idmatch = item.id;
                                                        print(idmatch);
                                                        titlematch = item.title;
                                                        print(titlematch);
                                                        quantitymatch =
                                                            item.quantity;
                                                        print(quantitymatch);
                                                        imagematch = item.image;
                                                        expireydatematch =
                                                            item.expiryDate;
                                                        print(expireydatematch);
                                                        locationidmatch =
                                                            item.locationID;
                                                        print(locationidmatch);
                                                        variationIdmatch =
                                                            item.variationID;
                                                        print(variationIdmatch);

                                                        productIdmatch =
                                                            item.productId;
                                                        print(productIdmatch);
                                                        unitIdmatch =
                                                            item.unitId;
                                                        print(unitIdmatch);

                                                        isedit = !isedit;
                                                        print('Get Price');

                                                        print(getPrice);
                                                      });
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.edit,
                                                          color: Colors.blue,
                                                        ),
                                                        Text(
                                                          " Edit",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    getPrice == item.id
                                        ? isedit == false
                                            ? SingleChildScrollView(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 15),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300)),
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  unitPrice,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  unitpriceedit =
                                                                      double.parse(
                                                                          value
                                                                              .toString());
                                                                });
                                                              },
                                                              decoration:
                                                                  InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      hintText:
                                                                          "Unit Price",
                                                                      hintStyle:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                      )),
                                                            ),
                                                          )),
                                                          SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.02),
                                                          Expanded(
                                                              child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300)),
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  description,
                                                              decoration:
                                                                  InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      hintText:
                                                                          "Description",
                                                                      hintStyle:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                      )),
                                                            ),
                                                          )),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.02),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade300)),
                                                              child:
                                                                  DropdownButton(
                                                                underline:
                                                                    SizedBox(),
                                                                isExpanded:
                                                                    true,
                                                                hint: Text(
                                                                    "Discount Type"),
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down,
                                                                ),
                                                                value:
                                                                    _discountType,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    _discountType =
                                                                        value;
                                                                  });
                                                                },
                                                                items: itemname
                                                                    .map(
                                                                        (value) {
                                                                  return DropdownMenuItem(
                                                                      value:
                                                                          value,
                                                                      child: Text(
                                                                          value));
                                                                }).toList(),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.02),
                                                          Expanded(
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade300)),
                                                              child: TextField(
                                                                controller:
                                                                    discountSingleItem,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    discountedit =
                                                                        double.parse(
                                                                            value.toString());
                                                                  });
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        border: InputBorder
                                                                            .none,
                                                                        hintText:
                                                                            "Discount",
                                                                        hintStyle:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.grey,
                                                                        )),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          if (_discountType ==
                                                              'Fix') {
                                                            unitpriceedit =
                                                                double.parse(
                                                                        unitPrice
                                                                            .text) -
                                                                    discountedit;

                                                            deleteFunction(i);
                                                            final id = Localstore
                                                                .instance
                                                                .collection(
                                                                    'todos')
                                                                .doc(accessToken
                                                                    .toString()
                                                                    .characters
                                                                    .first)
                                                                .collection(
                                                                    "cart")
                                                                .doc()
                                                                .id;

                                                            final item = Todo(
                                                                id: idmatch,
                                                                productId:
                                                                    productIdmatch,
                                                                title:
                                                                    titlematch,
                                                                price: unitpriceedit
                                                                    .toString(),
                                                                done: false,
                                                                quantity:
                                                                    quantitymatch,
                                                                image:
                                                                    imagematch,
                                                                expiryDate:
                                                                    expireydatematch,
                                                                locationID:
                                                                    locationidmatch,
                                                                variationID:
                                                                    variationIdmatch,
                                                                discount:
                                                                    discountSingleItem
                                                                        .text,
                                                                discountType:
                                                                    _discountType,
                                                                description:
                                                                    description
                                                                        .text);

                                                            // setState(() {});
                                                            ToastMsg(
                                                                Colors.green,
                                                                "Save SuccessFully");
                                                            item.save(
                                                                accessToken
                                                                    .toString()
                                                                    .characters
                                                                    .first);
                                                            _items.putIfAbsent(
                                                                item.id,
                                                                () => item);
                                                          } else if (_discountType ==
                                                              'Percentage') {
                                                            unitpriceedit = (double.parse(
                                                                        unitPrice
                                                                            .text
                                                                            .toString()) *
                                                                    (double.parse(
                                                                        discountedit
                                                                            .toString()))) /
                                                                100;
                                                            deleteFunction(i);
                                                            final id = Localstore
                                                                .instance
                                                                .collection(
                                                                    'todos')
                                                                .doc(accessToken
                                                                    .toString()
                                                                    .characters
                                                                    .first)
                                                                .collection(
                                                                    "cart")
                                                                .doc()
                                                                .id;

                                                            final item = Todo(
                                                                id: idmatch,
                                                                productId:
                                                                    productIdmatch,
                                                                title:
                                                                    titlematch,
                                                                price: unitpriceedit
                                                                    .toString(),
                                                                done: false,
                                                                quantity:
                                                                    quantitymatch,
                                                                image:
                                                                    imagematch,
                                                                expiryDate:
                                                                    expireydatematch,
                                                                locationID:
                                                                    locationidmatch,
                                                                variationID:
                                                                    variationIdmatch,
                                                                discount:
                                                                    discountSingleItem
                                                                        .text,
                                                                discountType:
                                                                    _discountType,
                                                                description:
                                                                    description
                                                                        .text);

                                                            ToastMsg(
                                                                Colors.green,
                                                                "Save SuccessFully");
                                                            item.save(
                                                                accessToken
                                                                    .toString()
                                                                    .characters
                                                                    .first);
                                                            _items.putIfAbsent(
                                                                item.id,
                                                                () => item);
                                                          } else {
                                                            deleteFunction(i);
                                                            final id = Localstore
                                                                .instance
                                                                .collection(
                                                                    'todos')
                                                                .doc(accessToken
                                                                    .toString()
                                                                    .characters
                                                                    .first)
                                                                .collection(
                                                                    "cart")
                                                                .doc()
                                                                .id;

                                                            final item = Todo(
                                                                id: idmatch,
                                                                productId:
                                                                    productIdmatch,
                                                                title:
                                                                    titlematch,
                                                                price: unitpriceedit
                                                                    .toString(),
                                                                done: false,
                                                                quantity:
                                                                    quantitymatch,
                                                                image:
                                                                    imagematch,
                                                                expiryDate:
                                                                    expireydatematch,
                                                                locationID:
                                                                    locationidmatch,
                                                                variationID:
                                                                    variationIdmatch,
                                                                discount:
                                                                    discountSingleItem
                                                                        .text,
                                                                discountType:
                                                                    _discountType,
                                                                description:
                                                                    description
                                                                        .text);

                                                            ToastMsg(
                                                                Colors.green,
                                                                "Save SuccessFully");
                                                            item.save(
                                                                accessToken
                                                                    .toString()
                                                                    .characters
                                                                    .first);
                                                            _items.putIfAbsent(
                                                                item.id,
                                                                () => item);
                                                          }
                                                        },
                                                        child: Align(
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color: Colors
                                                                    .blue),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        10),
                                                            child: Text('Save',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Container()
                                        : Container()
                                  ],
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                  Positioned(
                      child: Visibility(
                          visible: isProduct,
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 20, bottom: 100, left: 30, right: 30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.1),
                                  )),
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 6,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 50,
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Expanded(
                                                        flex: 10,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.1))),
                                                          child: TextFormField(
                                                            controller:
                                                                searchTextEditingController,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _data = value;
                                                                isSearch = true;
                                                              });
                                                              print(_data);
                                                            },
                                                            decoration: InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    'Search...',
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        bottom:
                                                                            10,
                                                                        left:
                                                                            10),
                                                                hintStyle:
                                                                    TextStyle(
                                                                        fontSize:
                                                                            14)),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                            child: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    isProduct =
                                                                        false;
                                                                  });
                                                                },
                                                                child: Icon(Icons
                                                                    .close)))),
                                                  ],
                                                )),
                                            Expanded(
                                              child: productsModel == null
                                                  ? CircularProgressIndicator()
                                                  : isSearch
                                                      ? ListView.builder(
                                                          itemCount:
                                                              productsModel
                                                                  .data.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            for (int i = 0;
                                                                i <
                                                                    productsModel
                                                                        .data
                                                                        .length;
                                                                i++) {
                                                              if (productsModel
                                                                  .data[index]
                                                                  .name
                                                                  .toLowerCase()
                                                                  .contains(_data
                                                                      .toLowerCase())) {
                                                                return ListViewContainer(
                                                                    productsModel,
                                                                    index,
                                                                    accessToken,
                                                                    isSearch,
                                                                    searchProductsModel);
                                                              }
                                                            }
                                                            return Container();
                                                          })
                                                      : ListView.builder(
                                                          itemCount:
                                                              productsModel
                                                                  .data.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return ListViewContainer(
                                                                productsModel,
                                                                index,
                                                                accessToken,
                                                                isSearch,
                                                                searchProductsModel);
                                                          }),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Expanded(
                                      // flex: 1,
                                      child: Container(
                                    // padding:
                                    //     EdgeInsets.only(bottom: 7, right: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (currentPage > 1) {
                                                  setState(() {
                                                    currentPage =
                                                        currentPage - 1;
                                                  });
                                                }
                                                onPressAllProduct(currentPage);
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 7,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Color(0xff021343)),
                                                  child: Text(
                                                    "<",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  )),
                                            ),
                                            Text(currentPage.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16)),
                                            InkWell(
                                              onTap: () {
                                                if (currentPage <
                                                    productsModel
                                                        .meta.lastPage) {
                                                  setState(() {
                                                    currentPage =
                                                        currentPage + 1;
                                                  });
                                                  onPressAllProduct(
                                                      currentPage);
                                                }
                                              },
                                              child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 7,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Color(0xff021343)),
                                                  child: Text(
                                                    ">",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          )))
                ]))
              ])),

          ///
          /// bottom sheet
          ///
          bottomSheet: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.green[200],
                Colors.pink[50],
              ]),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                padding: EdgeInsets.only(top: 0, left: 15, right: 15),
                height: 125,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'SubTotal:$currencySymbol ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.5),
                                ),
                                Text(
                                  subTotal.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total:$currencySymbol ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.5),
                                ),
                                Text(
                                  (maxTotal - discount).toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),

                            ///
                            /// total amount
                            ///
                          ],
                        ),
                      )),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                            child: DropdownButton(
                              underline: SizedBox(),
                              isExpanded: true,
                              hint: Text(
                                "Discount Type",
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                              ),
                              value: _discountType1,
                              onChanged: (value) {
                                setState(() {
                                  _discountType1 = value;
                                });
                              },
                              items: itemname1.map((value) {
                                return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                    ));
                              }).toList(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 30,
                                    left: 5,
                                  ),
                                  child: Text(
                                    'Discount:',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.white))),
                                  child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      onChanged: (text) {
                                        setState(() {
                                          if (text.isEmpty) {
                                            discount = 0.0;
                                          } else if (_discountType1 == 'Fix') {
                                            discount =
                                                double.parse(text.toString());
                                          } else if (_discountType1 ==
                                              'Percentage') {
                                            setState(() {
                                              discount = (double.parse(
                                                          text.toString()) *
                                                      maxTotal) /
                                                  100;
                                            });
                                          }
                                        });
                                      },
                                      controller: discountItems,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                            top: 25,
                                          ),
                                          hintText: "0",
                                          hintStyle: TextStyle(
                                            color: Colors.white,
                                          ))),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ///
                      /// navigate to check out
                      ///

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckOutCash(
                                  double.parse(maxTotal.toString()),
                                  sortquantity,
                                  sortProductsId,
                                  locationId,
                                  sortVariationId,
                                  maxTotal - discount,
                                  sortUnitId)));
                    },

                    // /
                    // / check out button
                    // /
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            // margin: EdgeInsets.only(left: 20, top: 10),
                            // padding: EdgeInsets.only(top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(10)),
                            child:

                                ///
                                /// check out text
                                ///
                                Text(
                              'CHECK OUT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ));
  }

  onPressAllProduct(int currentPage) async {
    final ProductsModel model = await getAllProducts(currentPage);
    setState(() {
      productsModel = model;
    });
    if (productsModel == null) {
      ToastMsg(Colors.red, 'Null Values');
    } else {
      print('Sussessfully');
    }
  }

  Future<ProductsModel> getAllProducts(currentPage) async {
    final String apiUrl =
        'https://erp.live/connector/api/product?page=$currentPage';
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {"Authorization": "Bearer" + " $accessToken"},
    );

    if (response.statusCode == 200) {
      final String responseString = response.body;
      // data = json.decode(response.body);
      // result = data.map((e) => ProductModel.fromJson(e)).toList();
      return productsModelFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "Something Goes Wrong",
      );
      return null;
    }
  }
}
