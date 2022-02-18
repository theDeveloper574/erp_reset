// To parse this JSON data, do
//
//     final getBusinessDetail = getBusinessDetailFromJson(jsonString);

import 'dart:convert';

GetBusinessDetail getBusinessDetailFromJson(String str) =>
    GetBusinessDetail.fromJson(json.decode(str));

String getBusinessDetailToJson(GetBusinessDetail data) =>
    json.encode(data.toJson());

class GetBusinessDetail {
  GetBusinessDetail({
    this.data,
  });

  Data data;

  factory GetBusinessDetail.fromJson(Map<String, dynamic> json) =>
      GetBusinessDetail(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.currencyId,
    this.startDate,
    this.taxNumber1,
    this.taxLabel1,
    this.taxNumber2,
    this.taxLabel2,
    this.codeLabel1,
    this.code1,
    this.codeLabel2,
    this.code2,
    this.defaultSalesTax,
    this.defaultProfitPercent,
    this.ownerId,
    this.timeZone,
    this.fyStartMonth,
    this.accountingMethod,
    this.defaultSalesDiscount,
    this.sellPriceTax,
    this.logo,
    this.skuPrefix,
    this.enableProductExpiry,
    this.expiryType,
    this.onProductExpiry,
    this.stopSellingBefore,
    this.enableTooltip,
    this.purchaseInDiffCurrency,
    this.purchaseCurrencyId,
    this.pExchangeRate,
    this.transactionEditDays,
    this.stockExpiryAlertDays,
    this.keyboardShortcuts,
    this.posSettings,
    this.weighingScaleSetting,
    this.woocommerceSkippedOrders,
    this.woocommerceWhOcSecret,
    this.woocommerceWhOuSecret,
    this.woocommerceWhOdSecret,
    this.woocommerceWhOrSecret,
    this.essentialsSettings,
    this.manufacturingSettings,
    this.enableBrand,
    this.enableCategory,
    this.enableSubCategory,
    this.enablePriceTax,
    this.enablePurchaseStatus,
    this.enableLotNumber,
    this.defaultUnit,
    this.enableSubUnits,
    this.enableRacks,
    this.enableRow,
    this.enablePosition,
    this.enableEditingProductFromPurchase,
    this.salesCmsnAgnt,
    this.itemAdditionMethod,
    this.enableInlineTax,
    this.currencySymbolPlacement,
    this.enabledModules,
    this.dateFormat,
    this.timeFormat,
    this.refNoPrefixes,
    this.themeColor,
    this.createdBy,
    this.crmSettings,
    this.repairSettings,
    this.enableRp,
    this.rpName,
    this.amountForUnitRp,
    this.minOrderTotalForRp,
    this.maxRpPerOrder,
    this.redeemAmountPerUnitRp,
    this.minOrderTotalForRedeem,
    this.minRedeemPoint,
    this.maxRedeemPoint,
    this.rpExpiryPeriod,
    this.rpExpiryType,
    this.emailSettings,
    this.smsSettings,
    this.customLabels,
    this.commonSettings,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.locations,
    this.currency,
    this.printers,
    this.currencyPrecision,
    this.quantityPrecision,
  });

  int id;
  String name;
  int currencyId;
  DateTime startDate;
  dynamic taxNumber1;
  dynamic taxLabel1;
  dynamic taxNumber2;
  dynamic taxLabel2;
  dynamic codeLabel1;
  dynamic code1;
  dynamic codeLabel2;
  dynamic code2;
  dynamic defaultSalesTax;
  int defaultProfitPercent;
  int ownerId;
  String timeZone;
  int fyStartMonth;
  String accountingMethod;
  String defaultSalesDiscount;
  String sellPriceTax;
  dynamic logo;
  dynamic skuPrefix;
  int enableProductExpiry;
  String expiryType;
  String onProductExpiry;
  int stopSellingBefore;
  int enableTooltip;
  int purchaseInDiffCurrency;
  dynamic purchaseCurrencyId;
  String pExchangeRate;
  int transactionEditDays;
  int stockExpiryAlertDays;
  KeyboardShortcuts keyboardShortcuts;
  PosSettings posSettings;
  WeighingScaleSetting weighingScaleSetting;
  dynamic woocommerceSkippedOrders;
  dynamic woocommerceWhOcSecret;
  dynamic woocommerceWhOuSecret;
  dynamic woocommerceWhOdSecret;
  dynamic woocommerceWhOrSecret;
  dynamic essentialsSettings;
  dynamic manufacturingSettings;
  int enableBrand;
  int enableCategory;
  int enableSubCategory;
  int enablePriceTax;
  int enablePurchaseStatus;
  int enableLotNumber;
  dynamic defaultUnit;
  int enableSubUnits;
  int enableRacks;
  int enableRow;
  int enablePosition;
  int enableEditingProductFromPurchase;
  String salesCmsnAgnt;
  int itemAdditionMethod;
  int enableInlineTax;
  String currencySymbolPlacement;
  List<String> enabledModules;
  String dateFormat;
  String timeFormat;
  RefNoPrefixes refNoPrefixes;
  String themeColor;
  dynamic createdBy;
  dynamic crmSettings;
  dynamic repairSettings;
  int enableRp;
  dynamic rpName;
  String amountForUnitRp;
  String minOrderTotalForRp;
  dynamic maxRpPerOrder;
  String redeemAmountPerUnitRp;
  String minOrderTotalForRedeem;
  dynamic minRedeemPoint;
  dynamic maxRedeemPoint;
  dynamic rpExpiryPeriod;
  String rpExpiryType;
  EmailSettings emailSettings;
  SmsSettings smsSettings;
  CustomLabels customLabels;
  CommonSettings commonSettings;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;
  List<LocationElement> locations;
  Currency currency;
  List<dynamic> printers;
  int currencyPrecision;
  int quantityPrecision;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        currencyId: json["currency_id"],
        startDate: DateTime.parse(json["start_date"]),
        taxNumber1: json["tax_number_1"],
        taxLabel1: json["tax_label_1"],
        taxNumber2: json["tax_number_2"],
        taxLabel2: json["tax_label_2"],
        codeLabel1: json["code_label_1"],
        code1: json["code_1"],
        codeLabel2: json["code_label_2"],
        code2: json["code_2"],
        defaultSalesTax: json["default_sales_tax"],
        defaultProfitPercent: json["default_profit_percent"],
        ownerId: json["owner_id"],
        timeZone: json["time_zone"],
        fyStartMonth: json["fy_start_month"],
        accountingMethod: json["accounting_method"],
        defaultSalesDiscount: json["default_sales_discount"],
        sellPriceTax: json["sell_price_tax"],
        logo: json["logo"],
        skuPrefix: json["sku_prefix"],
        enableProductExpiry: json["enable_product_expiry"],
        expiryType: json["expiry_type"],
        onProductExpiry: json["on_product_expiry"],
        stopSellingBefore: json["stop_selling_before"],
        enableTooltip: json["enable_tooltip"],
        purchaseInDiffCurrency: json["purchase_in_diff_currency"],
        purchaseCurrencyId: json["purchase_currency_id"],
        pExchangeRate: json["p_exchange_rate"],
        transactionEditDays: json["transaction_edit_days"],
        stockExpiryAlertDays: json["stock_expiry_alert_days"],
        keyboardShortcuts:
            KeyboardShortcuts.fromJson(json["keyboard_shortcuts"]),
        posSettings: PosSettings.fromJson(json["pos_settings"]),
        weighingScaleSetting:
            WeighingScaleSetting.fromJson(json["weighing_scale_setting"]),
        woocommerceSkippedOrders: json["woocommerce_skipped_orders"],
        woocommerceWhOcSecret: json["woocommerce_wh_oc_secret"],
        woocommerceWhOuSecret: json["woocommerce_wh_ou_secret"],
        woocommerceWhOdSecret: json["woocommerce_wh_od_secret"],
        woocommerceWhOrSecret: json["woocommerce_wh_or_secret"],
        essentialsSettings: json["essentials_settings"],
        manufacturingSettings: json["manufacturing_settings"],
        enableBrand: json["enable_brand"],
        enableCategory: json["enable_category"],
        enableSubCategory: json["enable_sub_category"],
        enablePriceTax: json["enable_price_tax"],
        enablePurchaseStatus: json["enable_purchase_status"],
        enableLotNumber: json["enable_lot_number"],
        defaultUnit: json["default_unit"],
        enableSubUnits: json["enable_sub_units"],
        enableRacks: json["enable_racks"],
        enableRow: json["enable_row"],
        enablePosition: json["enable_position"],
        enableEditingProductFromPurchase:
            json["enable_editing_product_from_purchase"],
        salesCmsnAgnt: json["sales_cmsn_agnt"],
        itemAdditionMethod: json["item_addition_method"],
        enableInlineTax: json["enable_inline_tax"],
        currencySymbolPlacement: json["currency_symbol_placement"],
        enabledModules:
            List<String>.from(json["enabled_modules"].map((x) => x)),
        dateFormat: json["date_format"],
        timeFormat: json["time_format"],
        refNoPrefixes: RefNoPrefixes.fromJson(json["ref_no_prefixes"]),
        themeColor: json["theme_color"],
        createdBy: json["created_by"],
        crmSettings: json["crm_settings"],
        repairSettings: json["repair_settings"],
        enableRp: json["enable_rp"],
        rpName: json["rp_name"],
        amountForUnitRp: json["amount_for_unit_rp"],
        minOrderTotalForRp: json["min_order_total_for_rp"],
        maxRpPerOrder: json["max_rp_per_order"],
        redeemAmountPerUnitRp: json["redeem_amount_per_unit_rp"],
        minOrderTotalForRedeem: json["min_order_total_for_redeem"],
        minRedeemPoint: json["min_redeem_point"],
        maxRedeemPoint: json["max_redeem_point"],
        rpExpiryPeriod: json["rp_expiry_period"],
        rpExpiryType: json["rp_expiry_type"],
        emailSettings: EmailSettings.fromJson(json["email_settings"]),
        smsSettings: SmsSettings.fromJson(json["sms_settings"]),
        customLabels: CustomLabels.fromJson(json["custom_labels"]),
        commonSettings: CommonSettings.fromJson(json["common_settings"]),
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        locations: List<LocationElement>.from(
            json["locations"].map((x) => LocationElement.fromJson(x))),
        currency: Currency.fromJson(json["currency"]),
        printers: List<dynamic>.from(json["printers"].map((x) => x)),
        currencyPrecision: json["currency_precision"],
        quantityPrecision: json["quantity_precision"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "currency_id": currencyId,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "tax_number_1": taxNumber1,
        "tax_label_1": taxLabel1,
        "tax_number_2": taxNumber2,
        "tax_label_2": taxLabel2,
        "code_label_1": codeLabel1,
        "code_1": code1,
        "code_label_2": codeLabel2,
        "code_2": code2,
        "default_sales_tax": defaultSalesTax,
        "default_profit_percent": defaultProfitPercent,
        "owner_id": ownerId,
        "time_zone": timeZone,
        "fy_start_month": fyStartMonth,
        "accounting_method": accountingMethod,
        "default_sales_discount": defaultSalesDiscount,
        "sell_price_tax": sellPriceTax,
        "logo": logo,
        "sku_prefix": skuPrefix,
        "enable_product_expiry": enableProductExpiry,
        "expiry_type": expiryType,
        "on_product_expiry": onProductExpiry,
        "stop_selling_before": stopSellingBefore,
        "enable_tooltip": enableTooltip,
        "purchase_in_diff_currency": purchaseInDiffCurrency,
        "purchase_currency_id": purchaseCurrencyId,
        "p_exchange_rate": pExchangeRate,
        "transaction_edit_days": transactionEditDays,
        "stock_expiry_alert_days": stockExpiryAlertDays,
        "keyboard_shortcuts": keyboardShortcuts.toJson(),
        "pos_settings": posSettings.toJson(),
        "weighing_scale_setting": weighingScaleSetting.toJson(),
        "woocommerce_skipped_orders": woocommerceSkippedOrders,
        "woocommerce_wh_oc_secret": woocommerceWhOcSecret,
        "woocommerce_wh_ou_secret": woocommerceWhOuSecret,
        "woocommerce_wh_od_secret": woocommerceWhOdSecret,
        "woocommerce_wh_or_secret": woocommerceWhOrSecret,
        "essentials_settings": essentialsSettings,
        "manufacturing_settings": manufacturingSettings,
        "enable_brand": enableBrand,
        "enable_category": enableCategory,
        "enable_sub_category": enableSubCategory,
        "enable_price_tax": enablePriceTax,
        "enable_purchase_status": enablePurchaseStatus,
        "enable_lot_number": enableLotNumber,
        "default_unit": defaultUnit,
        "enable_sub_units": enableSubUnits,
        "enable_racks": enableRacks,
        "enable_row": enableRow,
        "enable_position": enablePosition,
        "enable_editing_product_from_purchase":
            enableEditingProductFromPurchase,
        "sales_cmsn_agnt": salesCmsnAgnt,
        "item_addition_method": itemAdditionMethod,
        "enable_inline_tax": enableInlineTax,
        "currency_symbol_placement": currencySymbolPlacement,
        "enabled_modules": List<dynamic>.from(enabledModules.map((x) => x)),
        "date_format": dateFormat,
        "time_format": timeFormat,
        "ref_no_prefixes": refNoPrefixes.toJson(),
        "theme_color": themeColor,
        "created_by": createdBy,
        "crm_settings": crmSettings,
        "repair_settings": repairSettings,
        "enable_rp": enableRp,
        "rp_name": rpName,
        "amount_for_unit_rp": amountForUnitRp,
        "min_order_total_for_rp": minOrderTotalForRp,
        "max_rp_per_order": maxRpPerOrder,
        "redeem_amount_per_unit_rp": redeemAmountPerUnitRp,
        "min_order_total_for_redeem": minOrderTotalForRedeem,
        "min_redeem_point": minRedeemPoint,
        "max_redeem_point": maxRedeemPoint,
        "rp_expiry_period": rpExpiryPeriod,
        "rp_expiry_type": rpExpiryType,
        "email_settings": emailSettings.toJson(),
        "sms_settings": smsSettings.toJson(),
        "custom_labels": customLabels.toJson(),
        "common_settings": commonSettings.toJson(),
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        "currency": currency.toJson(),
        "printers": List<dynamic>.from(printers.map((x) => x)),
        "currency_precision": currencyPrecision,
        "quantity_precision": quantityPrecision,
      };
}

class CommonSettings {
  CommonSettings({
    this.defaultCreditLimit,
    this.defaultDatatablePageEntries,
  });

  dynamic defaultCreditLimit;
  String defaultDatatablePageEntries;

  factory CommonSettings.fromJson(Map<String, dynamic> json) => CommonSettings(
        defaultCreditLimit: json["default_credit_limit"],
        defaultDatatablePageEntries: json["default_datatable_page_entries"],
      );

  Map<String, dynamic> toJson() => {
        "default_credit_limit": defaultCreditLimit,
        "default_datatable_page_entries": defaultDatatablePageEntries,
      };
}

class Currency {
  Currency({
    this.id,
    this.country,
    this.currency,
    this.code,
    this.symbol,
    this.thousandSeparator,
    this.decimalSeparator,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String country;
  String currency;
  String code;
  String symbol;
  String thousandSeparator;
  String decimalSeparator;
  dynamic createdAt;
  dynamic updatedAt;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        country: json["country"],
        currency: json["currency"],
        code: json["code"],
        symbol: json["symbol"],
        thousandSeparator: json["thousand_separator"],
        decimalSeparator: json["decimal_separator"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "currency": currency,
        "code": code,
        "symbol": symbol,
        "thousand_separator": thousandSeparator,
        "decimal_separator": decimalSeparator,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class CustomLabels {
  CustomLabels({
    this.payments,
    this.contact,
    this.product,
    this.location,
    this.user,
    this.purchase,
    this.purchaseShipping,
    this.sell,
    this.shipping,
    this.typesOfService,
  });

  Payments payments;
  Contact contact;
  ProductClass product;
  ProductClass location;
  ProductClass user;
  ProductClass purchase;
  ProductClass purchaseShipping;
  ProductClass sell;
  ProductClass shipping;
  ProductClass typesOfService;

  factory CustomLabels.fromJson(Map<String, dynamic> json) => CustomLabels(
        payments: Payments.fromJson(json["payments"]),
        contact: Contact.fromJson(json["contact"]),
        product: ProductClass.fromJson(json["product"]),
        location: ProductClass.fromJson(json["location"]),
        user: ProductClass.fromJson(json["user"]),
        purchase: ProductClass.fromJson(json["purchase"]),
        purchaseShipping: ProductClass.fromJson(json["purchase_shipping"]),
        sell: ProductClass.fromJson(json["sell"]),
        shipping: ProductClass.fromJson(json["shipping"]),
        typesOfService: ProductClass.fromJson(json["types_of_service"]),
      );

  Map<String, dynamic> toJson() => {
        "payments": payments.toJson(),
        "contact": contact.toJson(),
        "product": product.toJson(),
        "location": location.toJson(),
        "user": user.toJson(),
        "purchase": purchase.toJson(),
        "purchase_shipping": purchaseShipping.toJson(),
        "sell": sell.toJson(),
        "shipping": shipping.toJson(),
        "types_of_service": typesOfService.toJson(),
      };
}

class Contact {
  Contact({
    this.customField1,
    this.customField2,
    this.customField3,
    this.customField4,
    this.customField5,
    this.customField6,
    this.customField7,
    this.customField8,
    this.customField9,
    this.customField10,
  });

  dynamic customField1;
  dynamic customField2;
  dynamic customField3;
  dynamic customField4;
  dynamic customField5;
  dynamic customField6;
  dynamic customField7;
  dynamic customField8;
  dynamic customField9;
  dynamic customField10;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        customField1: json["custom_field_1"],
        customField2: json["custom_field_2"],
        customField3: json["custom_field_3"],
        customField4: json["custom_field_4"],
        customField5: json["custom_field_5"],
        customField6: json["custom_field_6"],
        customField7: json["custom_field_7"],
        customField8: json["custom_field_8"],
        customField9: json["custom_field_9"],
        customField10: json["custom_field_10"],
      );

  Map<String, dynamic> toJson() => {
        "custom_field_1": customField1,
        "custom_field_2": customField2,
        "custom_field_3": customField3,
        "custom_field_4": customField4,
        "custom_field_5": customField5,
        "custom_field_6": customField6,
        "custom_field_7": customField7,
        "custom_field_8": customField8,
        "custom_field_9": customField9,
        "custom_field_10": customField10,
      };
}

class ProductClass {
  ProductClass({
    this.customField1,
    this.customField2,
    this.customField3,
    this.customField4,
    this.customField5,
    this.customField6,
  });

  String customField1;
  dynamic customField2;
  dynamic customField3;
  dynamic customField4;
  dynamic customField5;
  dynamic customField6;

  factory ProductClass.fromJson(Map<String, dynamic> json) => ProductClass(
        customField1:
            json["custom_field_1"] == null ? null : json["custom_field_1"],
        customField2: json["custom_field_2"],
        customField3: json["custom_field_3"],
        customField4: json["custom_field_4"],
        customField5: json["custom_field_5"],
        customField6: json["custom_field_6"],
      );

  Map<String, dynamic> toJson() => {
        "custom_field_1": customField1 == null ? null : customField1,
        "custom_field_2": customField2,
        "custom_field_3": customField3,
        "custom_field_4": customField4,
        "custom_field_5": customField5,
        "custom_field_6": customField6,
      };
}

class Payments {
  Payments({
    this.customPay1,
    this.customPay2,
    this.customPay3,
    this.customPay4,
    this.customPay5,
    this.customPay6,
    this.customPay7,
  });

  String customPay1;
  String customPay2;
  dynamic customPay3;
  dynamic customPay4;
  dynamic customPay5;
  dynamic customPay6;
  dynamic customPay7;

  factory Payments.fromJson(Map<String, dynamic> json) => Payments(
        customPay1: json["custom_pay_1"],
        customPay2: json["custom_pay_2"],
        customPay3: json["custom_pay_3"],
        customPay4: json["custom_pay_4"],
        customPay5: json["custom_pay_5"],
        customPay6: json["custom_pay_6"],
        customPay7: json["custom_pay_7"],
      );

  Map<String, dynamic> toJson() => {
        "custom_pay_1": customPay1,
        "custom_pay_2": customPay2,
        "custom_pay_3": customPay3,
        "custom_pay_4": customPay4,
        "custom_pay_5": customPay5,
        "custom_pay_6": customPay6,
        "custom_pay_7": customPay7,
      };
}

class EmailSettings {
  EmailSettings({
    this.useSuperadminSettings,
    this.mailDriver,
    this.mailHost,
    this.mailPort,
    this.mailUsername,
    this.mailPassword,
    this.mailEncryption,
    this.mailFromAddress,
    this.mailFromName,
  });

  String useSuperadminSettings;
  String mailDriver;
  dynamic mailHost;
  dynamic mailPort;
  dynamic mailUsername;
  dynamic mailPassword;
  dynamic mailEncryption;
  dynamic mailFromAddress;
  dynamic mailFromName;

  factory EmailSettings.fromJson(Map<String, dynamic> json) => EmailSettings(
        useSuperadminSettings: json["use_superadmin_settings"],
        mailDriver: json["mail_driver"],
        mailHost: json["mail_host"],
        mailPort: json["mail_port"],
        mailUsername: json["mail_username"],
        mailPassword: json["mail_password"],
        mailEncryption: json["mail_encryption"],
        mailFromAddress: json["mail_from_address"],
        mailFromName: json["mail_from_name"],
      );

  Map<String, dynamic> toJson() => {
        "use_superadmin_settings": useSuperadminSettings,
        "mail_driver": mailDriver,
        "mail_host": mailHost,
        "mail_port": mailPort,
        "mail_username": mailUsername,
        "mail_password": mailPassword,
        "mail_encryption": mailEncryption,
        "mail_from_address": mailFromAddress,
        "mail_from_name": mailFromName,
      };
}

class KeyboardShortcuts {
  KeyboardShortcuts({
    this.pos,
  });

  Pos pos;

  factory KeyboardShortcuts.fromJson(Map<String, dynamic> json) =>
      KeyboardShortcuts(
        pos: Pos.fromJson(json["pos"]),
      );

  Map<String, dynamic> toJson() => {
        "pos": pos.toJson(),
      };
}

class Pos {
  Pos({
    this.expressCheckout,
    this.payNCkeckout,
    this.draft,
    this.cancel,
    this.recentProductQuantity,
    this.weighingScale,
    this.editDiscount,
    this.editOrderTax,
    this.addPaymentRow,
    this.finalizePayment,
    this.addNewProduct,
  });

  String expressCheckout;
  String payNCkeckout;
  String draft;
  String cancel;
  String recentProductQuantity;
  dynamic weighingScale;
  String editDiscount;
  String editOrderTax;
  String addPaymentRow;
  String finalizePayment;
  String addNewProduct;

  factory Pos.fromJson(Map<String, dynamic> json) => Pos(
        expressCheckout: json["express_checkout"],
        payNCkeckout: json["pay_n_ckeckout"],
        draft: json["draft"],
        cancel: json["cancel"],
        recentProductQuantity: json["recent_product_quantity"],
        weighingScale: json["weighing_scale"],
        editDiscount: json["edit_discount"],
        editOrderTax: json["edit_order_tax"],
        addPaymentRow: json["add_payment_row"],
        finalizePayment: json["finalize_payment"],
        addNewProduct: json["add_new_product"],
      );

  Map<String, dynamic> toJson() => {
        "express_checkout": expressCheckout,
        "pay_n_ckeckout": payNCkeckout,
        "draft": draft,
        "cancel": cancel,
        "recent_product_quantity": recentProductQuantity,
        "weighing_scale": weighingScale,
        "edit_discount": editDiscount,
        "edit_order_tax": editOrderTax,
        "add_payment_row": addPaymentRow,
        "finalize_payment": finalizePayment,
        "add_new_product": addNewProduct,
      };
}

class LocationElement {
  LocationElement({
    this.id,
    this.businessId,
    this.locationId,
    this.name,
    this.landmark,
    this.country,
    this.state,
    this.city,
    this.zipCode,
    this.invoiceSchemeId,
    this.invoiceLayoutId,
    this.saleInvoiceLayoutId,
    this.sellingPriceGroupId,
    this.printReceiptOnInvoice,
    this.receiptPrinterType,
    this.printerId,
    this.mobile,
    this.alternateNumber,
    this.email,
    this.website,
    this.featuredProducts,
    this.defaultPaymentAccounts,
    this.isActive,
    this.customField1,
    this.customField2,
    this.customField3,
    this.customField4,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int businessId;
  String locationId;
  String name;
  String landmark;
  String country;
  String state;
  String city;
  String zipCode;
  int invoiceSchemeId;
  int invoiceLayoutId;
  int saleInvoiceLayoutId;
  dynamic sellingPriceGroupId;
  int printReceiptOnInvoice;
  String receiptPrinterType;
  dynamic printerId;
  String mobile;
  String alternateNumber;
  String email;
  dynamic website;
  dynamic featuredProducts;
  DefaultPaymentAccounts defaultPaymentAccounts;
  int isActive;
  dynamic customField1;
  dynamic customField2;
  dynamic customField3;
  dynamic customField4;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory LocationElement.fromJson(Map<String, dynamic> json) =>
      LocationElement(
        id: json["id"],
        businessId: json["business_id"],
        locationId: json["location_id"],
        name: json["name"],
        landmark: json["landmark"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        zipCode: json["zip_code"],
        invoiceSchemeId: json["invoice_scheme_id"],
        invoiceLayoutId: json["invoice_layout_id"],
        saleInvoiceLayoutId: json["sale_invoice_layout_id"],
        sellingPriceGroupId: json["selling_price_group_id"],
        printReceiptOnInvoice: json["print_receipt_on_invoice"],
        receiptPrinterType: json["receipt_printer_type"],
        printerId: json["printer_id"],
        mobile: json["mobile"],
        alternateNumber: json["alternate_number"],
        email: json["email"] == null ? null : json["email"],
        website: json["website"],
        featuredProducts: json["featured_products"],
        defaultPaymentAccounts:
            DefaultPaymentAccounts.fromJson(json["default_payment_accounts"]),
        isActive: json["is_active"],
        customField1: json["custom_field1"],
        customField2: json["custom_field2"],
        customField3: json["custom_field3"],
        customField4: json["custom_field4"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "location_id": locationId,
        "name": name,
        "landmark": landmark,
        "country": country,
        "state": state,
        "city": city,
        "zip_code": zipCode,
        "invoice_scheme_id": invoiceSchemeId,
        "invoice_layout_id": invoiceLayoutId,
        "sale_invoice_layout_id": saleInvoiceLayoutId,
        "selling_price_group_id": sellingPriceGroupId,
        "print_receipt_on_invoice": printReceiptOnInvoice,
        "receipt_printer_type": receiptPrinterType,
        "printer_id": printerId,
        "mobile": mobile,
        "alternate_number": alternateNumber,
        "email": email == null ? null : email,
        "website": website,
        "featured_products": featuredProducts,
        "default_payment_accounts": defaultPaymentAccounts.toJson(),
        "is_active": isActive,
        "custom_field1": customField1,
        "custom_field2": customField2,
        "custom_field3": customField3,
        "custom_field4": customField4,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class DefaultPaymentAccounts {
  DefaultPaymentAccounts({
    this.cash,
    this.cheque,
    this.bankTransfer,
    this.customPay1,
    this.customPay2,
  });

  BankTransfer cash;
  BankTransfer cheque;
  BankTransfer bankTransfer;
  BankTransfer customPay1;
  BankTransfer customPay2;

  factory DefaultPaymentAccounts.fromJson(Map<String, dynamic> json) =>
      DefaultPaymentAccounts(
        cash: BankTransfer.fromJson(json["cash"]),
        cheque: BankTransfer.fromJson(json["cheque"]),
        bankTransfer: BankTransfer.fromJson(json["bank_transfer"]),
        customPay1: BankTransfer.fromJson(json["custom_pay_1"]),
        customPay2: BankTransfer.fromJson(json["custom_pay_2"]),
      );

  Map<String, dynamic> toJson() => {
        "cash": cash.toJson(),
        "cheque": cheque.toJson(),
        "bank_transfer": bankTransfer.toJson(),
        "custom_pay_1": customPay1.toJson(),
        "custom_pay_2": customPay2.toJson(),
      };
}

class BankTransfer {
  BankTransfer({
    this.isEnabled,
  });

  String isEnabled;

  factory BankTransfer.fromJson(Map<String, dynamic> json) => BankTransfer(
        isEnabled: json["is_enabled"],
      );

  Map<String, dynamic> toJson() => {
        "is_enabled": isEnabled,
      };
}

class PosSettings {
  PosSettings({
    this.cmmsnCalculationType,
    this.amountRoundingMethod,
    this.razorPayKeyId,
    this.razorPayKeySecret,
    this.stripePublicKey,
    this.stripeSecretKey,
    this.cashDenominations,
    this.disablePayCheckout,
    this.disableDraft,
    this.disableExpressCheckout,
    this.hideProductSuggestion,
    this.hideRecentTrans,
    this.disableDiscount,
    this.disableOrderTax,
    this.isPosSubtotalEditable,
  });

  String cmmsnCalculationType;
  String amountRoundingMethod;
  dynamic razorPayKeyId;
  dynamic razorPayKeySecret;
  dynamic stripePublicKey;
  dynamic stripeSecretKey;
  dynamic cashDenominations;
  int disablePayCheckout;
  int disableDraft;
  int disableExpressCheckout;
  int hideProductSuggestion;
  int hideRecentTrans;
  int disableDiscount;
  int disableOrderTax;
  int isPosSubtotalEditable;

  factory PosSettings.fromJson(Map<String, dynamic> json) => PosSettings(
        cmmsnCalculationType: json["cmmsn_calculation_type"],
        amountRoundingMethod: json["amount_rounding_method"],
        razorPayKeyId: json["razor_pay_key_id"],
        razorPayKeySecret: json["razor_pay_key_secret"],
        stripePublicKey: json["stripe_public_key"],
        stripeSecretKey: json["stripe_secret_key"],
        cashDenominations: json["cash_denominations"],
        disablePayCheckout: json["disable_pay_checkout"],
        disableDraft: json["disable_draft"],
        disableExpressCheckout: json["disable_express_checkout"],
        hideProductSuggestion: json["hide_product_suggestion"],
        hideRecentTrans: json["hide_recent_trans"],
        disableDiscount: json["disable_discount"],
        disableOrderTax: json["disable_order_tax"],
        isPosSubtotalEditable: json["is_pos_subtotal_editable"],
      );

  Map<String, dynamic> toJson() => {
        "cmmsn_calculation_type": cmmsnCalculationType,
        "amount_rounding_method": amountRoundingMethod,
        "razor_pay_key_id": razorPayKeyId,
        "razor_pay_key_secret": razorPayKeySecret,
        "stripe_public_key": stripePublicKey,
        "stripe_secret_key": stripeSecretKey,
        "cash_denominations": cashDenominations,
        "disable_pay_checkout": disablePayCheckout,
        "disable_draft": disableDraft,
        "disable_express_checkout": disableExpressCheckout,
        "hide_product_suggestion": hideProductSuggestion,
        "hide_recent_trans": hideRecentTrans,
        "disable_discount": disableDiscount,
        "disable_order_tax": disableOrderTax,
        "is_pos_subtotal_editable": isPosSubtotalEditable,
      };
}

class RefNoPrefixes {
  RefNoPrefixes({
    this.purchase,
    this.purchaseReturn,
    this.purchaseOrder,
    this.stockTransfer,
    this.stockAdjustment,
    this.sellReturn,
    this.expense,
    this.contacts,
    this.purchasePayment,
    this.sellPayment,
    this.expensePayment,
    this.businessLocation,
    this.username,
    this.subscription,
    this.draft,
    this.salesOrder,
  });

  String purchase;
  dynamic purchaseReturn;
  dynamic purchaseOrder;
  String stockTransfer;
  String stockAdjustment;
  String sellReturn;
  String expense;
  String contacts;
  String purchasePayment;
  String sellPayment;
  dynamic expensePayment;
  String businessLocation;
  dynamic username;
  dynamic subscription;
  dynamic draft;
  dynamic salesOrder;

  factory RefNoPrefixes.fromJson(Map<String, dynamic> json) => RefNoPrefixes(
        purchase: json["purchase"],
        purchaseReturn: json["purchase_return"],
        purchaseOrder: json["purchase_order"],
        stockTransfer: json["stock_transfer"],
        stockAdjustment: json["stock_adjustment"],
        sellReturn: json["sell_return"],
        expense: json["expense"],
        contacts: json["contacts"],
        purchasePayment: json["purchase_payment"],
        sellPayment: json["sell_payment"],
        expensePayment: json["expense_payment"],
        businessLocation: json["business_location"],
        username: json["username"],
        subscription: json["subscription"],
        draft: json["draft"],
        salesOrder: json["sales_order"],
      );

  Map<String, dynamic> toJson() => {
        "purchase": purchase,
        "purchase_return": purchaseReturn,
        "purchase_order": purchaseOrder,
        "stock_transfer": stockTransfer,
        "stock_adjustment": stockAdjustment,
        "sell_return": sellReturn,
        "expense": expense,
        "contacts": contacts,
        "purchase_payment": purchasePayment,
        "sell_payment": sellPayment,
        "expense_payment": expensePayment,
        "business_location": businessLocation,
        "username": username,
        "subscription": subscription,
        "draft": draft,
        "sales_order": salesOrder,
      };
}

class SmsSettings {
  SmsSettings({
    this.smsService,
    this.nexmoKey,
    this.nexmoSecret,
    this.nexmoFrom,
    this.twilioSid,
    this.twilioToken,
    this.twilioFrom,
    this.url,
    this.sendToParamName,
    this.msgParamName,
    this.requestMethod,
    this.header1,
    this.headerVal1,
    this.header2,
    this.headerVal2,
    this.header3,
    this.headerVal3,
    this.param1,
    this.paramVal1,
    this.param2,
    this.paramVal2,
    this.param3,
    this.paramVal3,
    this.param4,
    this.paramVal4,
    this.param5,
    this.paramVal5,
    this.param6,
    this.paramVal6,
    this.param7,
    this.paramVal7,
    this.param8,
    this.paramVal8,
    this.param9,
    this.paramVal9,
    this.param10,
    this.paramVal10,
  });

  String smsService;
  dynamic nexmoKey;
  dynamic nexmoSecret;
  dynamic nexmoFrom;
  dynamic twilioSid;
  dynamic twilioToken;
  dynamic twilioFrom;
  dynamic url;
  String sendToParamName;
  String msgParamName;
  String requestMethod;
  dynamic header1;
  dynamic headerVal1;
  dynamic header2;
  dynamic headerVal2;
  dynamic header3;
  dynamic headerVal3;
  dynamic param1;
  dynamic paramVal1;
  dynamic param2;
  dynamic paramVal2;
  dynamic param3;
  dynamic paramVal3;
  dynamic param4;
  dynamic paramVal4;
  dynamic param5;
  dynamic paramVal5;
  dynamic param6;
  dynamic paramVal6;
  dynamic param7;
  dynamic paramVal7;
  dynamic param8;
  dynamic paramVal8;
  dynamic param9;
  dynamic paramVal9;
  dynamic param10;
  dynamic paramVal10;

  factory SmsSettings.fromJson(Map<String, dynamic> json) => SmsSettings(
        smsService: json["sms_service"],
        nexmoKey: json["nexmo_key"],
        nexmoSecret: json["nexmo_secret"],
        nexmoFrom: json["nexmo_from"],
        twilioSid: json["twilio_sid"],
        twilioToken: json["twilio_token"],
        twilioFrom: json["twilio_from"],
        url: json["url"],
        sendToParamName: json["send_to_param_name"],
        msgParamName: json["msg_param_name"],
        requestMethod: json["request_method"],
        header1: json["header_1"],
        headerVal1: json["header_val_1"],
        header2: json["header_2"],
        headerVal2: json["header_val_2"],
        header3: json["header_3"],
        headerVal3: json["header_val_3"],
        param1: json["param_1"],
        paramVal1: json["param_val_1"],
        param2: json["param_2"],
        paramVal2: json["param_val_2"],
        param3: json["param_3"],
        paramVal3: json["param_val_3"],
        param4: json["param_4"],
        paramVal4: json["param_val_4"],
        param5: json["param_5"],
        paramVal5: json["param_val_5"],
        param6: json["param_6"],
        paramVal6: json["param_val_6"],
        param7: json["param_7"],
        paramVal7: json["param_val_7"],
        param8: json["param_8"],
        paramVal8: json["param_val_8"],
        param9: json["param_9"],
        paramVal9: json["param_val_9"],
        param10: json["param_10"],
        paramVal10: json["param_val_10"],
      );

  Map<String, dynamic> toJson() => {
        "sms_service": smsService,
        "nexmo_key": nexmoKey,
        "nexmo_secret": nexmoSecret,
        "nexmo_from": nexmoFrom,
        "twilio_sid": twilioSid,
        "twilio_token": twilioToken,
        "twilio_from": twilioFrom,
        "url": url,
        "send_to_param_name": sendToParamName,
        "msg_param_name": msgParamName,
        "request_method": requestMethod,
        "header_1": header1,
        "header_val_1": headerVal1,
        "header_2": header2,
        "header_val_2": headerVal2,
        "header_3": header3,
        "header_val_3": headerVal3,
        "param_1": param1,
        "param_val_1": paramVal1,
        "param_2": param2,
        "param_val_2": paramVal2,
        "param_3": param3,
        "param_val_3": paramVal3,
        "param_4": param4,
        "param_val_4": paramVal4,
        "param_5": param5,
        "param_val_5": paramVal5,
        "param_6": param6,
        "param_val_6": paramVal6,
        "param_7": param7,
        "param_val_7": paramVal7,
        "param_8": param8,
        "param_val_8": paramVal8,
        "param_9": param9,
        "param_val_9": paramVal9,
        "param_10": param10,
        "param_val_10": paramVal10,
      };
}

class WeighingScaleSetting {
  WeighingScaleSetting({
    this.labelPrefix,
    this.productSkuLength,
    this.qtyLength,
    this.qtyLengthDecimal,
  });

  dynamic labelPrefix;
  String productSkuLength;
  String qtyLength;
  String qtyLengthDecimal;

  factory WeighingScaleSetting.fromJson(Map<String, dynamic> json) =>
      WeighingScaleSetting(
        labelPrefix: json["label_prefix"],
        productSkuLength: json["product_sku_length"],
        qtyLength: json["qty_length"],
        qtyLengthDecimal: json["qty_length_decimal"],
      );

  Map<String, dynamic> toJson() => {
        "label_prefix": labelPrefix,
        "product_sku_length": productSkuLength,
        "qty_length": qtyLength,
        "qty_length_decimal": qtyLengthDecimal,
      };
}
