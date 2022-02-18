// To parse this JSON data, do
//
//     final contactPaymentModel = contactPaymentModelFromJson(jsonString);

import 'dart:convert';

ContactPaymentModel contactPaymentModelFromJson(String str) =>
    ContactPaymentModel.fromJson(json.decode(str));

String contactPaymentModelToJson(ContactPaymentModel data) =>
    json.encode(data.toJson());

class ContactPaymentModel {
  ContactPaymentModel({
    this.data,
  });

  Data data;

  factory ContactPaymentModel.fromJson(Map<String, dynamic> json) =>
      ContactPaymentModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.amount,
    this.method,
    this.paidOn,
    this.createdBy,
    this.paymentFor,
    this.businessId,
    this.isAdvance,
    this.paymentRefNo,
    this.document,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String amount;
  String method;
  DateTime paidOn;
  int createdBy;
  String paymentFor;
  int businessId;
  int isAdvance;
  String paymentRefNo;
  dynamic document;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        amount: json["amount"],
        method: json["method"],
        paidOn: DateTime.parse(json["paid_on"]),
        createdBy: json["created_by"],
        paymentFor: json["payment_for"],
        businessId: json["business_id"],
        isAdvance: json["is_advance"],
        paymentRefNo: json["payment_ref_no"],
        document: json["document"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "method": method,
        "paid_on": paidOn.toIso8601String(),
        "created_by": createdBy,
        "payment_for": paymentFor,
        "business_id": businessId,
        "is_advance": isAdvance,
        "payment_ref_no": paymentRefNo,
        "document": document,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
