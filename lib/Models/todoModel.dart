import 'package:localstore/localstore.dart';

/// Data Model
class Todo {
  final String id;
  String title;
  // DateTime time;
  bool done;
  String price;
  int quantity;
  String image;
  String expiryDate;
  String locationID;
  String variationID;
  String productId;
  String unitId;
  String discount;
  String discountType;
  String description;
  Todo(
      {this.id,
      this.title,
      // this.time,
      this.done,
      this.price,
      this.quantity,
      this.image,
      this.expiryDate,
      this.locationID,
      this.variationID,
      this.productId,
      this.unitId,
      this.discount,
      this.discountType,
      this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      // 'time': time.millisecondsSinceEpoch,
      'done': done,
      'price': price,
      'quantity': quantity,
      'image': image,
      'expiryDate': expiryDate,
      'locationID': locationID,
      'variationID': variationID,
      'productId': productId,
      'unitId': unitId,
      'discount': discount,
      'discountType': discountType,
      'description': description
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
        id: map['id'],
        title: map['title'],
        // time: DateTime.fromMillisecondsSinceEpoch(map['time']),
        done: map['done'],
        price: map['price'],
        quantity: map['quantity'],
        image: map['image'],
        expiryDate: map['expiryDate'],
        locationID: map['locationID'],
        variationID: map['variationID'],
        productId: map['productId'],
        unitId: map['unitId'],
        discount: map['discount'],
        discountType: map['discountType'],
        description: map['description']);
  }
}

extension ExtTodo on Todo {
  Future save(String first) async {
    print("Save method");
    print(quantity);
    final _db = Localstore.instance;
    return _db
        .collection('todos')
        .doc(first)
        .collection("cart")
        .doc(id)
        .set(toMap());
  }

  Future delete(String first) async {
    final _db = Localstore.instance;
    return _db
        .collection('todos')
        .doc(first)
        .collection("cart")
        .doc(id)
        .delete();
  }
}
