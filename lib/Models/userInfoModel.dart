// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  UserInfoModel({
    this.data,
  });

  Data data;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.userType,
    this.surname,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.language,
    this.contactNo,
    this.address,
    this.businessId,
    this.maxSalesDiscountPercent,
    this.allowLogin,
    this.essentialsDepartmentId,
    this.essentialsDesignationId,
    this.essentialsSalary,
    this.essentialsPayPeriod,
    this.essentialsPayCycle,
    this.status,
    this.crmContactId,
    this.isCmmsnAgnt,
    this.cmmsnPercent,
    this.selectedContacts,
    this.dob,
    this.gender,
    this.maritalStatus,
    this.bloodGroup,
    this.contactNumber,
    this.altNumber,
    this.familyNumber,
    this.fbLink,
    this.twitterLink,
    this.socialMedia1,
    this.socialMedia2,
    this.permanentAddress,
    this.currentAddress,
    this.guardianName,
    this.customField1,
    this.customField2,
    this.customField3,
    this.customField4,
    this.bankDetails,
    this.idProofName,
    this.idProofNumber,
    this.locationId,
    this.crmDepartment,
    this.crmDesignation,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.isAdmin,
    this.business,
  });

  int id;
  String userType;
  String surname;
  String firstName;
  String lastName;
  String username;
  String email;
  String language;
  dynamic contactNo;
  dynamic address;
  int businessId;
  dynamic maxSalesDiscountPercent;
  int allowLogin;
  dynamic essentialsDepartmentId;
  dynamic essentialsDesignationId;
  dynamic essentialsSalary;
  dynamic essentialsPayPeriod;
  dynamic essentialsPayCycle;
  String status;
  dynamic crmContactId;
  int isCmmsnAgnt;
  String cmmsnPercent;
  int selectedContacts;
  dynamic dob;
  dynamic gender;
  dynamic maritalStatus;
  dynamic bloodGroup;
  dynamic contactNumber;
  dynamic altNumber;
  dynamic familyNumber;
  dynamic fbLink;
  dynamic twitterLink;
  dynamic socialMedia1;
  dynamic socialMedia2;
  dynamic permanentAddress;
  dynamic currentAddress;
  dynamic guardianName;
  dynamic customField1;
  dynamic customField2;
  dynamic customField3;
  dynamic customField4;
  String bankDetails;
  dynamic idProofName;
  dynamic idProofNumber;
  dynamic locationId;
  dynamic crmDepartment;
  dynamic crmDesignation;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  bool isAdmin;
  Business business;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userType: json["user_type"],
        surname: json["surname"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
        language: json["language"],
        contactNo: json["contact_no"],
        address: json["address"],
        businessId: json["business_id"],
        maxSalesDiscountPercent: json["max_sales_discount_percent"],
        allowLogin: json["allow_login"],
        essentialsDepartmentId: json["essentials_department_id"],
        essentialsDesignationId: json["essentials_designation_id"],
        essentialsSalary: json["essentials_salary"],
        essentialsPayPeriod: json["essentials_pay_period"],
        essentialsPayCycle: json["essentials_pay_cycle"],
        status: json["status"],
        crmContactId: json["crm_contact_id"],
        isCmmsnAgnt: json["is_cmmsn_agnt"],
        cmmsnPercent: json["cmmsn_percent"],
        selectedContacts: json["selected_contacts"],
        dob: json["dob"],
        gender: json["gender"],
        maritalStatus: json["marital_status"],
        bloodGroup: json["blood_group"],
        contactNumber: json["contact_number"],
        altNumber: json["alt_number"],
        familyNumber: json["family_number"],
        fbLink: json["fb_link"],
        twitterLink: json["twitter_link"],
        socialMedia1: json["social_media_1"],
        socialMedia2: json["social_media_2"],
        permanentAddress: json["permanent_address"],
        currentAddress: json["current_address"],
        guardianName: json["guardian_name"],
        customField1: json["custom_field_1"],
        customField2: json["custom_field_2"],
        customField3: json["custom_field_3"],
        customField4: json["custom_field_4"],
        bankDetails: json["bank_details"],
        idProofName: json["id_proof_name"],
        idProofNumber: json["id_proof_number"],
        locationId: json["location_id"],
        crmDepartment: json["crm_department"],
        crmDesignation: json["crm_designation"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isAdmin: json["is_admin"],
        business: Business.fromJson(json["business"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_type": userType,
        "surname": surname,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "language": language,
        "contact_no": contactNo,
        "address": address,
        "business_id": businessId,
        "max_sales_discount_percent": maxSalesDiscountPercent,
        "allow_login": allowLogin,
        "essentials_department_id": essentialsDepartmentId,
        "essentials_designation_id": essentialsDesignationId,
        "essentials_salary": essentialsSalary,
        "essentials_pay_period": essentialsPayPeriod,
        "essentials_pay_cycle": essentialsPayCycle,
        "status": status,
        "crm_contact_id": crmContactId,
        "is_cmmsn_agnt": isCmmsnAgnt,
        "cmmsn_percent": cmmsnPercent,
        "selected_contacts": selectedContacts,
        "dob": dob,
        "gender": gender,
        "marital_status": maritalStatus,
        "blood_group": bloodGroup,
        "contact_number": contactNumber,
        "alt_number": altNumber,
        "family_number": familyNumber,
        "fb_link": fbLink,
        "twitter_link": twitterLink,
        "social_media_1": socialMedia1,
        "social_media_2": socialMedia2,
        "permanent_address": permanentAddress,
        "current_address": currentAddress,
        "guardian_name": guardianName,
        "custom_field_1": customField1,
        "custom_field_2": customField2,
        "custom_field_3": customField3,
        "custom_field_4": customField4,
        "bank_details": bankDetails,
        "id_proof_name": idProofName,
        "id_proof_number": idProofNumber,
        "location_id": locationId,
        "crm_department": crmDepartment,
        "crm_designation": crmDesignation,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_admin": isAdmin,
        "business": business.toJson(),
      };
}

class Business {
  Business({
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
  String keyboardShortcuts;
  String posSettings;
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
  String customLabels;
  CommonSettings commonSettings;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory Business.fromJson(Map<String, dynamic> json) => Business(
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
        keyboardShortcuts: json["keyboard_shortcuts"],
        posSettings: json["pos_settings"],
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
        customLabels: json["custom_labels"],
        commonSettings: CommonSettings.fromJson(json["common_settings"]),
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "keyboard_shortcuts": keyboardShortcuts,
        "pos_settings": posSettings,
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
        "custom_labels": customLabels,
        "common_settings": commonSettings.toJson(),
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
