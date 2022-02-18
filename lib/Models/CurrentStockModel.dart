// To parse this JSON data, do
//
//     final currentStockModel = currentStockModelFromJson(jsonString);

import 'dart:convert';

CurrentStockModel currentStockModelFromJson(String str) =>
    CurrentStockModel.fromJson(json.decode(str));

String currentStockModelToJson(CurrentStockModel data) =>
    json.encode(data.toJson());

class CurrentStockModel {
  CurrentStockModel({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum> data;
  Links links;
  Meta meta;

  factory CurrentStockModel.fromJson(Map<String, dynamic> json) =>
      CurrentStockModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Datum {
  Datum({
    this.totalSold,
    this.totalTransfered,
    this.totalAdjusted,
    this.stockPrice,
    this.stock,
    this.sku,
    this.product,
    this.type,
    this.productId,
    this.unit,
    this.enableStock,
    this.unitPrice,
    this.productVariation,
    this.variationName,
    this.locationName,
    this.locationId,
    this.variationId,
  });

  String totalSold;
  dynamic totalTransfered;
  dynamic totalAdjusted;
  String stockPrice;
  String stock;
  String sku;
  String product;
  String type;
  int productId;
  String unit;
  int enableStock;
  String unitPrice;
  String productVariation;
  String variationName;
  String locationName;
  int locationId;
  int variationId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        totalSold: json["total_sold"] == null ? null : json["total_sold"],
        totalTransfered: json["total_transfered"],
        totalAdjusted: json["total_adjusted"],
        stockPrice: json["stock_price"] == null ? null : json["stock_price"],
        stock: json["stock"] == null ? null : json["stock"],
        sku: json["sku"],
        product: json["product"],
        type: json["type"],
        productId: json["product_id"],
        unit: json["unit"],
        enableStock: json["enable_stock"],
        unitPrice: json["unit_price"],
        productVariation: json["product_variation"],
        variationName: json["variation_name"],
        locationName:
            json["location_name"] == null ? null : json["location_name"],
        locationId: json["location_id"] == null ? null : json["location_id"],
        variationId: json["variation_id"],
      );

  Map<String, dynamic> toJson() => {
        "total_sold": totalSold == null ? null : totalSold,
        "total_transfered": totalTransfered,
        "total_adjusted": totalAdjusted,
        "stock_price": stockPrice == null ? null : stockPrice,
        "stock": stock == null ? null : stock,
        "sku": sku,
        "product": product,
        "type": type,
        "product_id": productId,
        "unit": unit,
        "enable_stock": enableStock,
        "unit_price": unitPrice,
        "product_variation": productVariation,
        "variation_name": variationName,
        "location_name": locationName == null ? null : locationName,
        "location_id": locationId == null ? null : locationId,
        "variation_id": variationId,
      };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String first;
  String last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
