import 'package:flutter/material.dart';
import 'package:makeupshop/Models/GloballyAccess.dart';
import 'package:makeupshop/Models/ProductsModel.dart';
import 'package:makeupshop/Models/searchProductModel.dart';
import 'package:makeupshop/main.dart';
import 'package:http/http.dart' as http;
import 'package:makeupshop/widget/ListViewContainer.dart';
import 'package:makeupshop/widget/network1.dart';

class ProductsSerached extends StatefulWidget {
  @override
  _ProductsSerachedState createState() => _ProductsSerachedState();
}

class _ProductsSerachedState extends State<ProductsSerached> {
  // ignore: deprecated_member_use
  List filteredProducts = [];
  List products = []; // ignore: deprecated_member_use
  @override
  void initState() {
    super.initState();
    onPress(accessToken);
    onPress(accessToken).then((data) {
      setState(() {
        products = filteredProducts = data;
      });
    });
  }

  void _filteredProducts(value) {
    filteredProducts = products.where((product) =>
        _productsModel.data.first.name.toString() == 'Capital Premium 80');
  }

  ProductsModel _productsModel;
  List itemsFromApi = [];
  List brandsFromApi = [];
  String getCategories;
  String endPoint;
  bool search = false;
  SearchProductsModel _searchProductsModel;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products Search'),
        ),
        body: Column(children: [
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      // itemCount: products.length,
                      itemBuilder: (context, index) {
                        if (products.length > 0) {
                          return index == 0 ? searchBar() : _listItem(index);
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })))
        ]));
  }

  searchBar() {
    TextFormField(
      controller: _controller,
      onChanged: (value) {
        setState(() {
          _filteredProducts(value);
        });
      },
    );
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(
          top: 32,
          bottom: 32,
          right: 16,
          left: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              products[index].data[index].name.toString(),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              products[index].data[index].productLocations.toString(),
              style: TextStyle(
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }

  onPress(String accessToken, {bool isRefresh = false}) async {
    final ProductsModel user = await getSellMethod(accessToken);
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

    }
  }
}

//
//   Product Api
//

Future<ProductsModel> getSellMethod(String accessToken) async {
  final String productApiUrl = 'https://erp.live/connector/api/product';

  print("GetSellMethod RUnssss");
  print("++++++++++++++___+++++++++++++++");
  print("Bearer" + " $accessToken");
  print("this is new api after end point concatination");
  // print(productApiUrl + endPoint);

  final response = await http.get(Uri.parse(productApiUrl), headers: {
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
