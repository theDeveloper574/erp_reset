class Grocery {
  int id;
  String title;
  String price;
  int quantity;
  String expireyDate;
  String image;
  String locationId;
  String variationId;
  String productId;
  String unitId;
  int discount;
  String discountType;
  String description;

  Grocery({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.expireyDate,
    this.image,
    this.locationId,
    this.variationId,
    this.productId,
    this.unitId,
    this.discount,
    this.discountType,
    this.description,
  });

  factory Grocery.fromMap(Map<String, dynamic> json) => new Grocery(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        quantity: json['quantity'],
        expireyDate: json['expireyDate'],
        image: json['image'],
        locationId: json['locationId'],
        variationId: json['variationId'],
        productId: json['productId'],
        unitId: json['unitId'],
        discount: json['discount'],
        discountType: json['discountType'],
        description: json['description'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'expireyDate': expireyDate,
      'image': image,
      'locationId': locationId,
      'variationId': variationId,
      'productId': productId,
      'unitId': unitId,
      'discount': discount,
      'discountType': discountType,
      'description': description,
    };
  }
}
