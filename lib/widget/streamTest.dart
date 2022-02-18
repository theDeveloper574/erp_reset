import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:makeupshop/Models/todoModel.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  var accessToken;
  MyHomePage(this.accessToken);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _db = Localstore.instance;
  final _items = <String, Todo>{};
  StreamSubscription<Map<String, dynamic>> _subscription;

  @override
  void initState() {
    _subscription = _db
        .collection('todos')
        .doc("e")
        .collection("cart")
        .stream
        .listen((event) {
      setState(() {
        final item = Todo.fromMap(event);
        _items.putIfAbsent(item.id, () => item);
      });
    });
    if (kIsWeb) _db.collection('todos').stream.asBroadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Testing page")),
      body: ListView.builder(
        itemCount: _items.keys.length,
        itemBuilder: (context, index) {
          final key = _items.keys.elementAt(index);
          final item = _items[key];
          return Card(
            child: CheckboxListTile(
              value: item.done,
              title: Text('${item.title}'),
              onChanged: (value) {
                // item.done = value;
                // item.save();
              },
              secondary: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    item.delete(widget.accessToken.toString().characters.first);
                    _items.remove(item.id);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    if (_subscription != null) _subscription?.cancel();
    super.dispose();
  }
}
