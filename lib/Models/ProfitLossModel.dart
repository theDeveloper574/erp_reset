// To parse this JSON data, do
//
//     final profitLossModel = profitLossModelFromJson(jsonString);

import 'dart:convert';

ProfitLossModel profitLossModelFromJson(String str) =>
    ProfitLossModel.fromJson(json.decode(str));

String profitLossModelToJson(ProfitLossModel data) =>
    json.encode(data.toJson());

class ProfitLossModel {
  ProfitLossModel({
    this.data,
  });

  Data data;

  factory ProfitLossModel.fromJson(Map<String, dynamic> json) =>
      ProfitLossModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.totalPurchaseShippingCharge,
    this.totalSellShippingCharge,
    this.totalPurchaseAdditionalExpense,
    this.totalSellAdditionalExpense,
    this.totalTransferShippingCharges,
    this.openingStock,
    this.closingStock,
    this.totalPurchase,
    this.totalPurchaseDiscount,
    this.totalPurchaseReturn,
    this.totalSell,
    this.totalSellDiscount,
    this.totalSellReturnDiscount,
    this.totalSellReturn,
    this.totalSellRoundOff,
    this.totalExpense,
    this.totalAdjustment,
    this.totalRecovered,
    this.totalRewardAmount,
    this.leftSideModuleData,
    this.rightSideModuleData,
    this.netProfit,
    this.grossProfit,
    this.totalSellBySubtype,
  });

  String totalPurchaseShippingCharge;
  String totalSellShippingCharge;
  String totalPurchaseAdditionalExpense;
  String totalSellAdditionalExpense;
  String totalTransferShippingCharges;
  String openingStock;
  String closingStock;
  String totalPurchase;
  String totalPurchaseDiscount;
  String totalPurchaseReturn;
  String totalSell;
  String totalSellDiscount;
  String totalSellReturnDiscount;
  String totalSellReturn;
  String totalSellRoundOff;
  String totalExpense;
  String totalAdjustment;
  String totalRecovered;
  String totalRewardAmount;
  List<LeftSideModuleDatum> leftSideModuleData;
  List<dynamic> rightSideModuleData;
  String netProfit;
  String grossProfit;
  List<dynamic> totalSellBySubtype;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalPurchaseShippingCharge:
            json["total_purchase_shipping_charge"].toString(),
        totalSellShippingCharge: json["total_sell_shipping_charge"].toString(),
        totalPurchaseAdditionalExpense:
            json["total_purchase_additional_expense"].toString(),
        totalSellAdditionalExpense:
            json["total_sell_additional_expense"].toString(),
        totalTransferShippingCharges:
            json["total_transfer_shipping_charges"].toString(),
        openingStock: json["opening_stock"].toString(),
        closingStock: json["closing_stock"].toString(),
        totalPurchase: json["total_purchase"].toString(),
        totalPurchaseDiscount: json["total_purchase_discount"].toString(),
        totalPurchaseReturn: json["total_purchase_return"].toString(),
        totalSell: json["total_sell"].toString(),
        totalSellDiscount: json["total_sell_discount"].toString(),
        totalSellReturnDiscount: json["total_sell_return_discount"].toString(),
        totalSellReturn: json["total_sell_return"].toString(),
        totalSellRoundOff: json["total_sell_round_off"].toString(),
        totalExpense: json["total_expense"].toString(),
        totalAdjustment: json["total_adjustment"].toString(),
        totalRecovered: json["total_recovered"].toString(),
        totalRewardAmount: json["total_reward_amount"].toString(),
        leftSideModuleData: List<LeftSideModuleDatum>.from(
            json["left_side_module_data"]
                .map((x) => LeftSideModuleDatum.fromJson(x))),
        rightSideModuleData:
            List<dynamic>.from(json["right_side_module_data"].map((x) => x)),
        netProfit: json["net_profit"].toString(),
        grossProfit: json["gross_profit"],
        totalSellBySubtype:
            List<dynamic>.from(json["total_sell_by_subtype"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "total_purchase_shipping_charge": totalPurchaseShippingCharge,
        "total_sell_shipping_charge": totalSellShippingCharge,
        "total_purchase_additional_expense": totalPurchaseAdditionalExpense,
        "total_sell_additional_expense": totalSellAdditionalExpense,
        "total_transfer_shipping_charges": totalTransferShippingCharges,
        "opening_stock": openingStock,
        "closing_stock": closingStock,
        "total_purchase": totalPurchase,
        "total_purchase_discount": totalPurchaseDiscount,
        "total_purchase_return": totalPurchaseReturn,
        "total_sell": totalSell,
        "total_sell_discount": totalSellDiscount,
        "total_sell_return_discount": totalSellReturnDiscount,
        "total_sell_return": totalSellReturn,
        "total_sell_round_off": totalSellRoundOff,
        "total_expense": totalExpense,
        "total_adjustment": totalAdjustment,
        "total_recovered": totalRecovered,
        "total_reward_amount": totalRewardAmount,
        "left_side_module_data":
            List<dynamic>.from(leftSideModuleData.map((x) => x.toJson())),
        "right_side_module_data":
            List<dynamic>.from(rightSideModuleData.map((x) => x)),
        "net_profit": netProfit,
        "gross_profit": grossProfit,
        "total_sell_by_subtype":
            List<dynamic>.from(totalSellBySubtype.map((x) => x)),
      };
}

class LeftSideModuleDatum {
  LeftSideModuleDatum({
    this.value,
    this.label,
    this.addToNetProfit,
  });

  dynamic value;
  String label;
  bool addToNetProfit;

  factory LeftSideModuleDatum.fromJson(Map<String, dynamic> json) =>
      LeftSideModuleDatum(
        value: json["value"],
        label: json["label"],
        addToNetProfit: json["add_to_net_profit"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "label": label,
        "add_to_net_profit": addToNetProfit,
      };
}
