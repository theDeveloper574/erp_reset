import 'package:flutter/material.dart';
import 'package:makeupshop/Models/ProductsModel.dart';

import 'package:makeupshop/Models/searchModel.dart';
import 'package:makeupshop/screens/products.dart';
import 'package:makeupshop/screens/productsseraching.dart';
import 'package:makeupshop/widget/network.dart';

// ignore: camel_case_types
class searchList extends StatefulWidget {
  searchList({Key key}) : super(key: key);

  @override
  _searchListState createState() => _searchListState();
}

// ignore: camel_case_types
class _searchListState extends State<searchList> {
  // ignore: deprecated_member_use
  List<ProductsModel> _posts = List<ProductsModel>();
  // ignore: deprecated_member_use
  List<ProductsModel> _postDisplay = List<ProductsModel>();

  @override
  void initState() {
    fetchPost().then((value) {
      setState(() {
        _posts.addAll(value);

        _postDisplay = _posts;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Search'),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductsSerached()));
                  },
                  child: Text('Products'))
            ],
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            if (_postDisplay.length > 0) {
              return index == 0 ? _searchBar() : _listItem(index - 1);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          itemCount: _postDisplay.length + 1,
        ));
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(hintText: 'Search.......'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            for (int i = 0; i <= _postDisplay.length; i++) {
              _postDisplay = _posts.where((element) {
                var postTitle = element.data[i].name.toLowerCase();
                return postTitle.contains(text);
              }).toList();
            }
          });
        },
      ),
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
              _postDisplay[index].data[index].name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              _postDisplay[index].data[index].name,
              style: TextStyle(
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
