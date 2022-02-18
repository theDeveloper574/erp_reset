import 'dart:convert';

LedgerModel ledgerModelFromJson(String str) =>
    LedgerModel.fromJson(json.decode(str));

String ledgerModelToJson(LedgerModel data) => json.encode(data.toJson());

class LedgerModel {
  Data data;

  LedgerModel({this.data});

  LedgerModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Ledger> ledger;
  String startDate;
  String endDate;
  int totalInvoice;
  int totalPurchase;
  int beginningBalance;
  int balanceDue;
  int totalPaid;

  Data(
      {this.ledger,
      this.startDate,
      this.endDate,
      this.totalInvoice,
      this.totalPurchase,
      this.beginningBalance,
      this.balanceDue,
      this.totalPaid});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['ledger'] != null) {
      // ignore: deprecated_member_use
      ledger = new List<Ledger>();
      json['ledger'].forEach((v) {
        ledger.add(new Ledger.fromJson(v));
      });
    }
    startDate = json['start_date'];
    endDate = json['end_date'];
    totalInvoice = json['total_invoice'];
    totalPurchase = json['total_purchase'];
    beginningBalance = json['beginning_balance'];
    balanceDue = json['balance_due'];
    totalPaid = json['total_paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ledger != null) {
      data['ledger'] = this.ledger.map((v) => v.toJson()).toList();
    }
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['total_invoice'] = this.totalInvoice;
    data['total_purchase'] = this.totalPurchase;
    data['beginning_balance'] = this.beginningBalance;
    data['balance_due'] = this.balanceDue;
    data['total_paid'] = this.totalPaid;
    return data;
  }
}

class Ledger {
  String date;
  String refNo;
  String type;
  String location;
  String paymentStatus;
  int total;
  String paymentMethod;
  String debit;
  String credit;
  String others;

  Ledger(
      {this.date,
      this.refNo,
      this.type,
      this.location,
      this.paymentStatus,
      this.total,
      this.paymentMethod,
      this.debit,
      this.credit,
      this.others});

  Ledger.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    refNo = json['ref_no'];
    type = json['type'];
    location = json['location'];
    paymentStatus = json['payment_status'];
    total = json['total'];
    paymentMethod = json['payment_method'];
    debit = json['debit'];
    credit = json['credit'];
    others = json['others'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['ref_no'] = this.refNo;
    data['type'] = this.type;
    data['location'] = this.location;
    data['payment_status'] = this.paymentStatus;
    data['total'] = this.total;
    data['payment_method'] = this.paymentMethod;
    data['debit'] = this.debit;
    data['credit'] = this.credit;
    data['others'] = this.others;
    return data;
  }
}
