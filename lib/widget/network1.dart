import 'package:flutter/foundation.dart';
import 'package:makeupshop/Models/ProductsModel.dart';

import 'package:makeupshop/Models/searchModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<ProductsModel> parsePost(String responsebody) {
  var list = json.decode(responsebody) as List<dynamic>;
  var posts = list.map((model) => productsModelFromJson(model)).toList();
  return posts;
}

Future<List<ProductsModel>> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://erp.live/connector/api/product'));

  print(response.statusCode);

  // ignore: unrelated_type_equality_checks
  if (response.statusCode == 200) {
    return compute(parsePost, response.body);
  } else {
    throw Exception("Request Api Error");
  }
}
