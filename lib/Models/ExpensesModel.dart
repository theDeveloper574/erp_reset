// To parse this JSON data, do
//
//     final expenseModel = expenseModelFromJson(jsonString);

import 'dart:convert';

ExpenseModel expenseModelFromJson(String str) =>
    ExpenseModel.fromJson(json.decode(str));

String expenseModelToJson(ExpenseModel data) => json.encode(data.toJson());

class ExpenseModel {
  ExpenseModel({
    this.data,
  });

  Data data;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.businessId,
    this.locationId,
    this.paymentStatus,
    this.refNo,
    this.transactionDate,
    this.totalBeforeTax,
    this.taxId,
    this.taxAmount,
    this.finalTotal,
    this.expenseCategoryId,
    this.document,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.expenseFor,
    this.isRecurring,
    this.recurInterval,
    this.recurIntervalType,
    this.recurRepetitions,
    this.recurStoppedOn,
    this.recurParentId,
  });

  int id;
  int businessId;
  String locationId;
  String paymentStatus;
  String refNo;
  DateTime transactionDate;
  String totalBeforeTax;
  dynamic taxId;
  int taxAmount;
  String finalTotal;
  dynamic expenseCategoryId;
  dynamic document;
  int createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> expenseFor;
  int isRecurring;
  dynamic recurInterval;
  dynamic recurIntervalType;
  dynamic recurRepetitions;
  dynamic recurStoppedOn;
  dynamic recurParentId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        businessId: json["business_id"],
        locationId: json["location_id"],
        paymentStatus: json["payment_status"],
        refNo: json["ref_no"],
        transactionDate: DateTime.parse(json["transaction_date"]),
        totalBeforeTax: json["total_before_tax"],
        taxId: json["tax_id"],
        taxAmount: json["tax_amount"],
        finalTotal: json["final_total"],
        expenseCategoryId: json["expense_category_id"],
        document: json["document"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        expenseFor: List<dynamic>.from(json["expense_for"].map((x) => x)),
        isRecurring: json["is_recurring"],
        recurInterval: json["recur_interval"],
        recurIntervalType: json["recur_interval_type"],
        recurRepetitions: json["recur_repetitions"],
        recurStoppedOn: json["recur_stopped_on"],
        recurParentId: json["recur_parent_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "location_id": locationId,
        "payment_status": paymentStatus,
        "ref_no": refNo,
        "transaction_date": transactionDate.toIso8601String(),
        "total_before_tax": totalBeforeTax,
        "tax_id": taxId,
        "tax_amount": taxAmount,
        "final_total": finalTotal,
        "expense_category_id": expenseCategoryId,
        "document": document,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "expense_for": List<dynamic>.from(expenseFor.map((x) => x)),
        "is_recurring": isRecurring,
        "recur_interval": recurInterval,
        "recur_interval_type": recurIntervalType,
        "recur_repetitions": recurRepetitions,
        "recur_stopped_on": recurStoppedOn,
        "recur_parent_id": recurParentId,
      };
}
