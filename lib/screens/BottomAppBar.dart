import 'package:flutter/material.dart';
import 'package:makeupshop/Models/tokenModel.dart';
import 'package:makeupshop/Models/userInfoModel.dart';
import 'package:makeupshop/screens/AllSells.dart';
import 'package:makeupshop/screens/Home.dart';
import 'package:makeupshop/screens/Home.dart';
import 'package:makeupshop/screens/ShippementSale.dart';
import 'package:makeupshop/screens/cartScreen.dart';
import 'package:makeupshop/screens/products.dart';
import 'package:shared_preferences/shared_preferences.dart';

class bottombar extends StatefulWidget {
  int index;
  bottombar(this.index);
  @override
  bottombarState createState() => bottombarState();
}

class bottombarState extends State<bottombar> {
  // final _db = Localstore.instance;
  // final _items = <String, Todo>{};
  // StreamSubscription<Map<String, dynamic>> _subscription;

  ///
  /// current index
  ///
  int _selectedPage;

  ///
  /// list of items
  ///
  final _pageOptions = [
    Home(),
    Products(),
    AllSales(),
    ShippmentSale(),
    CartScreen(),
  ];
  @override
  // void initState() {

  //   super.initState();
  // }

  void initState() {
    super.initState();
    // TODO: implement initState
    _selectedPage = widget.index;
    // isAdded = true;

    //   _subscription = _db
    //       .collection('todos')
    //       .doc("e")
    //       .collection("cart")
    //       .stream
    //       .listen((event) {
    //     setState(() {
    //       final item = Todo.fromMap(event);
    //       _items.putIfAbsent(item.id, () => item);

    //       print('/////////////////////');
    //       cartItem = _items.entries.length;
    //       print(cartItem);
    //     });
    //   });
    //   if (kIsWeb) _db.collection('todos').stream.asBroadcastStream();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pageOptions[_selectedPage],

        ///
        /// bottom navigation bar
        ///
        bottomNavigationBar: Container(
          color: Color(0xffEFF2F3),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Color(0xff8D8D8D),
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedPage,
              onTap: (int index) {
                setState(() {
                  _selectedPage = index;
                });
              },
              items: [
                ///
                /// home tab
                ///
                BottomNavigationBarItem(
                  icon: _selectedPage == 0
                      ? Image.asset('asset/home_tab_active.png')
                      : Image.asset('asset/home_inactive.png'),
                  title: Text(
                    "Home",
                    style: TextStyle(fontFamily: 'MEDIUM'),
                  ),
                ),

                ///
                /// products tab
                ///
                BottomNavigationBarItem(
                  icon: _selectedPage == 1
                      ? Image.asset('asset/products_tab_active.png')
                      : Image.asset('asset/products_tab_inactive.png'),
                  title: Text(
                    "Products",
                    style: TextStyle(fontFamily: 'MEDIUM'),
                  ),
                ),

                ///
                /// Cart
                ///
                BottomNavigationBarItem(
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        child: _selectedPage == 2
                            ? Image.asset('asset/sales_tab_active.png')
                            : Image.asset('asset/sales_tab_inactive.png'),
                      ),
                      // Positioned(
                      //     left: 0,
                      //     right: -15,
                      //     child: cartItem == null || cartItem == 0
                      //         ? Container()
                      //         : CircleAvatar(
                      //             backgroundColor: Color(0xff4957BA),
                      //             radius: 8,
                      //             child: Text(cartItem.toString(),
                      //                 textAlign: TextAlign.right,
                      //                 style: TextStyle(
                      //                     fontSize: 10,
                      //                     color: Colors.white,
                      //                     fontWeight: FontWeight.bold)),
                      //           )),
                    ],
                  ),
                  title: Text(
                    "Sale",
                    style: TextStyle(fontFamily: 'MEDIUM'),
                  ),
                ),

                ///
                /// Sales
                ///
                BottomNavigationBarItem(
                  icon: _selectedPage == 3
                      ? Image.asset('asset/shipment_tab_active.png')
                      : Image.asset('asset/shipment_tab_inactive.png'),
                  title: Text(
                    "Shipment",
                    style: TextStyle(fontFamily: 'MEDIUM'),
                  ),
                ),

                ///
                /// Shipment
                ///

                BottomNavigationBarItem(
                  icon: _selectedPage == 4
                      ? Image.asset('asset/cart_tab_active.png')
                      : Image.asset('asset/cart_tab_inactive.png'),
                  title: Text(
                    "Cart",
                    style: TextStyle(fontFamily: 'MEDIUM'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
