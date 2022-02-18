import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
// import 'package:location/location.dart';
import 'package:search_map_place/search_map_place.dart';

import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/updateSellModel.dart';
import 'package:makeupshop/main.dart';
import 'package:makeupshop/screens/BottomAppBar.dart';
import 'package:makeupshop/widget/MyDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Shipmentmap extends StatefulWidget {
  @override
  _ShipmentmapState createState() => _ShipmentmapState();
}

class _ShipmentmapState extends State<Shipmentmap> {
  UpdateSell updateSell;
  Place _place;
  // Location _location = Location();
  List shippmentStatus = [
    'ordered',
    'shipped',
    'cancelled',
    'delivered',
    'packed'
  ];
  bool additionalExpense = false;
  Object _itemValue;
  int index;
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  TextEditingController shippmentDetail = TextEditingController();
  TextEditingController shippmentCharges = TextEditingController();
  TextEditingController shippmentAddress = TextEditingController();
  TextEditingController deliveredTo = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  String Address = '';
  String location = '';

  Position _currentPosition;
  // String _currentAddress;
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    final Geolocator geolocator = Geolocator();
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  var currentLocation;
  Position position;
  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  // Map
  GoogleMapController mapController;

  Set<Marker> _markers = Set();
  void _onMapCreated(GoogleMapController _controller) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('address', address1);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      mapController = _controller;
    });
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 15)));

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];

    //  = address1;

    shippmentAddress.text = address1 =
        '${place.street} ,${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    print(address1);

    // LatLng(_currentPosition.latitude, _currentPosition.longitude), 14));
    // _location.onLocationChanged.listen(
    //   (l) {
    //     _controller.animateCamera(
    //       CameraUpdate.newCameraPosition(
    //         CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
    //       ),
    //     );
    //   },
    // );
  }

  // LocationData _locationData;
  void getLoaction() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    super.initState();

    // getLoaction();
    // _getGeoLocationPosition();
    print('mmmmmmmmmmm');
    // print(_locationData);
    print('Contact Id');
    // print(widget.contactId);
    print('Sale ID');
    // print(widget.saleId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 5),
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   decoration: BoxDecoration(
              //     border: Border.all(width: 0.5),
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.white,
              //   ),
              //   child: TextFormField(
              //     controller: shippmentDetail,
              //     decoration: InputDecoration(
              //       hintText: 'Shipping Detail',
              //       hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),
              Row(
                children: [
                  // Expanded(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       border: Border.all(width: 0.5),
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: Colors.white,
                  //     ),
                  //     child: TextFormField(
                  //       controller: shippmentCharges,
                  //       decoration: InputDecoration(
                  //         contentPadding: EdgeInsets.all(8.0),
                  //         hintText: 'Shippment Charges',
                  //         hintStyle:
                  //             TextStyle(color: Colors.grey, fontSize: 16),
                  //         border: InputBorder.none,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  // Expanded(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       border: Border.all(width: 0.5),
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: Colors.white,
                  //     ),
                  //     child: TextFormField(
                  //       controller: deliveredTo,
                  //       decoration: InputDecoration(
                  //         contentPadding: EdgeInsets.all(8),
                  //         hintText: 'Delivered To',
                  //         hintStyle:
                  //             TextStyle(color: Colors.grey, fontSize: 16),
                  //         border: InputBorder.none,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.155,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9)),
                child: TextFormField(
                  controller: shippmentAddress,
                  maxLines: 4,
                  // minLines: 2,
                  decoration: InputDecoration(
                      hintText: 'Shipping Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9))),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // Container(
              //   child: Container(
              //     padding: EdgeInsets.only(left: 16, right: 16),
              //     decoration: BoxDecoration(
              //         border: Border.all(color: Colors.grey, width: 1),
              //         borderRadius: BorderRadius.circular(9),
              //         color: Colors.white),
              //     child: DropdownButton(
              //       isExpanded: true,
              //       underline: SizedBox(),
              //       hint: Text('Select Status'),
              //       icon: Icon(Icons.arrow_drop_down_outlined),
              //       value: _itemValue,
              //       onChanged: (value) {
              //         setState(() {
              //           _itemValue = value;
              //         });
              //       },
              //       items: shippmentStatus.map((value) {
              //         return DropdownMenuItem(value: value, child: Text(value));
              //       }).toList(),
              //     ),
              //   ),
              // ),
              // SingleChildScrollView(
              //   child: InkWell(
              //     onTap: () {
              //       onPress1(accessToken);
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => bottombar(3)));
              //     },
              //     child: Container(
              //       padding: EdgeInsets.symmetric(vertical: 15),
              //       margin: EdgeInsets.symmetric(vertical: 20),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: Color(0xff23bf5a),
              //       ),
              //       child: Center(
              //         child: Text(
              //           "ADD SHIPMENT",
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 20,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xff021343),
      key: _scaffold,
      drawer: BuildMyDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff021343),
        leading: InkWell(
          onTap: () {
            String address = address1;
            Navigator.pop(context, address);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Shipment",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.9),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
        ),
        child: Container(
          child: Stack(children: [
            Container(
              // padding: EdgeInsets.all(30.0),
              height: MediaQuery.of(context).size.height / 1,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(32.166351, 74.195900),
                  zoom: 11.0,
                ),

                mapType: MapType.normal,
                myLocationEnabled: true,

                onTap: (LatLng latLng) async {
                  // location =
                  //     'Lat: ${latLng.latitude} , Long: ${latLng.longitude}';
                  // Position position = await _getGeoLocationPosition();
                  // location =
                  //     'Lat: ${position.latitude} , Long: ${position.longitude}';
                  // GetAddressFromLatLong(position);
                  // Position position1 = await Geolocator.getCurrentPosition();
                  // print(position.longitude);
                  // print(position.latitude);

                  List<Placemark> placemarks = await placemarkFromCoordinates(
                      latLng.latitude, latLng.longitude);
                  print(placemarks);
                  Placemark place = placemarks[0];

                  //  = address1;

                  shippmentAddress.text = address1 =
                      '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
                  print(address1);
                  print(place.subThoroughfare);
                  _markers.add(
                      Marker(markerId: MarkerId('mark'), position: latLng));
                  setState(() {});
                },
                markers: Set<Marker>.of(_markers),

                // onTap: isSelecting ? _selectLocation : null,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SearchMapPlaceWidget(
                hasClearButton: true,
                placeType: PlaceType.address,
                placeholder: 'Enter the Location',
                apiKey: 'AIzaSyBOqw-OiYlhEK7eOCVTuxSSBGxcPIAvE0A',
                onSelected: (Place place) async {
                  print(place.description);
                  shippmentAddress.text = place.description;
                  Geolocation geolocation = await place.geolocation;
                  mapController.animateCamera(
                      CameraUpdate.newLatLng(geolocation.coordinates));
                  mapController.animateCamera(
                      CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
                },
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: Colors.white,
            //   ),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       prefixIcon: Icon(Icons.search),
            //       border: InputBorder.none,
            //       suffixIcon: Icon(Icons.close),
            //     ),
            //   ),
          ]),
        ),
      ),
    );
  }

  onPress1(String accessToken) async {
    final UpdateSell sell = await getSellMethod1(accessToken);

    setState(() {
      updateSell = sell;
    });
    if (updateSell == null) {
      ToastMsg(
        Colors.red,
        "Something went Wrong,try again",
      );
    } else {
      return ToastMsg(
        Colors.green,
        "Data Added SuccessFully ",
      );
    }
  }

  Future<UpdateSell> getSellMethod1(String accessToken) async {
    // print(widget.saleId);
    // print(widget.contactId);
    final String apiUrl = 'https://erp.live/connector/api/sell/${''}';
    print('AAAAAAAAAAAAAAAAAAAA');
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer" + " $accessToken"
    };
    print('BBBBBBBBBBBBBBBBBBBBBBBB');
    final msg = jsonEncode({
      // "contact_id": widget.contactId,
      "transaction_date": "2020-5-7 15:20:22",
      "status": "final",
      "sub_status": "null",
      "is_quotation": true,
      "discount_amount": 10,
      "discount_type": "fixed",
      "shipping_details": shippmentDetail.text,
      "shipping_address": shippmentAddress.text,
      "shipping_status": _itemValue,
      "delivered_to": deliveredTo.text,
      "shipping_charges": shippmentCharges.text,
      "additional_expense_key_1": name.text,
      "additional_expense_value_1": amount.text,
    });
    print('CCCCCCCCCCCCCCCCCCCCCCCC');
    print(msg.toString());
    final response =
        await http.put(Uri.parse(apiUrl), headers: headers, body: msg);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(msg);
      print(responseString);
      return updateSellFromJson(responseString);
    } else {
      ToastMsg(
        Colors.red,
        "SOmething went Wrong status code is ",
      );
      return null;
    }
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
