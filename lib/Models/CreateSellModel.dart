// To parse this JSON data, do
//
//     final createSellModel = createSellModelFromJson(jsonString);

import 'dart:convert';

List<CreateSellModel> createSellModelFromJson(String str) =>
    List<CreateSellModel>.from(
        json.decode(str).map((x) => CreateSellModel.fromJson(x)));

String createSellModelToJson(List<CreateSellModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateSellModel {
  CreateSellModel({
    this.businessId,
    this.locationId,
    this.type,
    this.status,
    this.subStatus,
    this.contactId,
    this.customerGroupId,
    this.invoiceNo,
    this.refNo,
    this.source,
    this.totalBeforeTax,
    this.transactionDate,
    this.taxId,
    this.discountType,
    this.discountAmount,
    this.taxAmount,
    this.finalTotal,
    this.additionalNotes,
    this.staffNote,
    this.createdBy,
    this.document,
    this.customField1,
    this.customField2,
    this.customField3,
    this.customField4,
    this.isDirectSale,
    this.commissionAgent,
    this.isQuotation,
    this.shippingDetails,
    this.shippingAddress,
    this.shippingStatus,
    this.deliveredTo,
    this.shippingCharges,
    this.shippingCustomField1,
    this.shippingCustomField2,
    this.shippingCustomField3,
    this.shippingCustomField4,
    this.shippingCustomField5,
    this.exchangeRate,
    this.sellingPriceGroupId,
    this.payTermNumber,
    this.payTermType,
    this.isSuspend,
    this.isRecurring,
    this.recurInterval,
    this.recurIntervalType,
    this.subscriptionRepeatOn,
    this.subscriptionNo,
    this.recurRepetitions,
    this.orderAddresses,
    this.subType,
    this.rpEarned,
    this.rpRedeemed,
    this.rpRedeemedAmount,
    this.isCreatedFromApi,
    this.typesOfServiceId,
    this.packingCharge,
    this.packingChargeType,
    this.serviceCustomField1,
    this.serviceCustomField2,
    this.serviceCustomField3,
    this.serviceCustomField4,
    this.serviceCustomField5,
    this.serviceCustomField6,
    this.roundOffAmount,
    this.importBatch,
    this.importTime,
    this.resTableId,
    this.resWaiterId,
    this.salesOrderIds,
    this.preferPaymentMethod,
    this.preferPaymentAccount,
    this.isExport,
    this.exportCustomFieldsInfo,
    this.additionalExpenseValue1,
    this.additionalExpenseValue2,
    this.additionalExpenseValue3,
    this.additionalExpenseValue4,
    this.additionalExpenseKey1,
    this.additionalExpenseKey2,
    this.additionalExpenseKey3,
    this.additionalExpenseKey4,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.invoiceUrl,
    this.paymentLink,
    this.paymentLines,
    this.sellLines,
    this.contact,
  });

  int businessId;
  int locationId;
  String type;
  String status;
  dynamic subStatus;
  int contactId;
  dynamic customerGroupId;
  String invoiceNo;
  String refNo;
  dynamic source;
  int totalBeforeTax;
  DateTime transactionDate;
  dynamic taxId;
  String discountType;
  int discountAmount;
  int taxAmount;
  int finalTotal;
  dynamic additionalNotes;
  dynamic staffNote;
  int createdBy;
  dynamic document;
  dynamic customField1;
  dynamic customField2;
  dynamic customField3;
  dynamic customField4;
  int isDirectSale;
  dynamic commissionAgent;
  bool isQuotation;
  dynamic shippingDetails;
  dynamic shippingAddress;
  dynamic shippingStatus;
  dynamic deliveredTo;
  int shippingCharges;
  dynamic shippingCustomField1;
  dynamic shippingCustomField2;
  dynamic shippingCustomField3;
  dynamic shippingCustomField4;
  dynamic shippingCustomField5;
  int exchangeRate;
  dynamic sellingPriceGroupId;
  dynamic payTermNumber;
  dynamic payTermType;
  int isSuspend;
  int isRecurring;
  int recurInterval;
  dynamic recurIntervalType;
  dynamic subscriptionRepeatOn;
  dynamic subscriptionNo;
  int recurRepetitions;
  dynamic orderAddresses;
  dynamic subType;
  int rpEarned;
  int rpRedeemed;
  int rpRedeemedAmount;
  int isCreatedFromApi;
  dynamic typesOfServiceId;
  int packingCharge;
  dynamic packingChargeType;
  dynamic serviceCustomField1;
  dynamic serviceCustomField2;
  dynamic serviceCustomField3;
  dynamic serviceCustomField4;
  dynamic serviceCustomField5;
  dynamic serviceCustomField6;
  int roundOffAmount;
  dynamic importBatch;
  dynamic importTime;
  dynamic resTableId;
  dynamic resWaiterId;
  dynamic salesOrderIds;
  dynamic preferPaymentMethod;
  dynamic preferPaymentAccount;
  int isExport;
  dynamic exportCustomFieldsInfo;
  int additionalExpenseValue1;
  int additionalExpenseValue2;
  int additionalExpenseValue3;
  int additionalExpenseValue4;
  dynamic additionalExpenseKey1;
  dynamic additionalExpenseKey2;
  dynamic additionalExpenseKey3;
  dynamic additionalExpenseKey4;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  String invoiceUrl;
  String paymentLink;
  List<PaymentLine> paymentLines;
  List<SellLine> sellLines;
  Contact contact;

  factory CreateSellModel.fromJson(Map<String, dynamic> json) =>
      CreateSellModel(
        businessId: json["business_id"],
        locationId: json["location_id"],
        type: json["type"],
        status: json["status"],
        subStatus: json["sub_status"],
        contactId: json["contact_id"],
        customerGroupId: json["customer_group_id"],
        invoiceNo: json["invoice_no"],
        refNo: json["ref_no"],
        source: json["source"],
        totalBeforeTax: json["total_before_tax"],
        transactionDate: DateTime.parse(json["transaction_date"]),
        taxId: json["tax_id"],
        discountType: json["discount_type"],
        discountAmount: json["discount_amount"],
        taxAmount: json["tax_amount"],
        finalTotal: json["final_total"],
        additionalNotes: json["additional_notes"],
        staffNote: json["staff_note"],
        createdBy: json["created_by"],
        document: json["document"],
        customField1: json["custom_field_1"],
        customField2: json["custom_field_2"],
        customField3: json["custom_field_3"],
        customField4: json["custom_field_4"],
        isDirectSale: json["is_direct_sale"],
        commissionAgent: json["commission_agent"],
        isQuotation: json["is_quotation"],
        shippingDetails: json["shipping_details"],
        shippingAddress: json["shipping_address"],
        shippingStatus: json["shipping_status"],
        deliveredTo: json["delivered_to"],
        shippingCharges: json["shipping_charges"],
        shippingCustomField1: json["shipping_custom_field_1"],
        shippingCustomField2: json["shipping_custom_field_2"],
        shippingCustomField3: json["shipping_custom_field_3"],
        shippingCustomField4: json["shipping_custom_field_4"],
        shippingCustomField5: json["shipping_custom_field_5"],
        exchangeRate: json["exchange_rate"],
        sellingPriceGroupId: json["selling_price_group_id"],
        payTermNumber: json["pay_term_number"],
        payTermType: json["pay_term_type"],
        isSuspend: json["is_suspend"],
        isRecurring: json["is_recurring"],
        recurInterval: json["recur_interval"],
        recurIntervalType: json["recur_interval_type"],
        subscriptionRepeatOn: json["subscription_repeat_on"],
        subscriptionNo: json["subscription_no"],
        recurRepetitions: json["recur_repetitions"],
        orderAddresses: json["order_addresses"],
        subType: json["sub_type"],
        rpEarned: json["rp_earned"],
        rpRedeemed: json["rp_redeemed"],
        rpRedeemedAmount: json["rp_redeemed_amount"],
        isCreatedFromApi: json["is_created_from_api"],
        typesOfServiceId: json["types_of_service_id"],
        packingCharge: json["packing_charge"],
        packingChargeType: json["packing_charge_type"],
        serviceCustomField1: json["service_custom_field_1"],
        serviceCustomField2: json["service_custom_field_2"],
        serviceCustomField3: json["service_custom_field_3"],
        serviceCustomField4: json["service_custom_field_4"],
        serviceCustomField5: json["service_custom_field_5"],
        serviceCustomField6: json["service_custom_field_6"],
        roundOffAmount: json["round_off_amount"],
        importBatch: json["import_batch"],
        importTime: json["import_time"],
        resTableId: json["res_table_id"],
        resWaiterId: json["res_waiter_id"],
        salesOrderIds: json["sales_order_ids"],
        preferPaymentMethod: json["prefer_payment_method"],
        preferPaymentAccount: json["prefer_payment_account"],
        isExport: json["is_export"],
        exportCustomFieldsInfo: json["export_custom_fields_info"],
        additionalExpenseValue1: json["additional_expense_value_1"],
        additionalExpenseValue2: json["additional_expense_value_2"],
        additionalExpenseValue3: json["additional_expense_value_3"],
        additionalExpenseValue4: json["additional_expense_value_4"],
        additionalExpenseKey1: json["additional_expense_key_1"],
        additionalExpenseKey2: json["additional_expense_key_2"],
        additionalExpenseKey3: json["additional_expense_key_3"],
        additionalExpenseKey4: json["additional_expense_key_4"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        invoiceUrl: json["invoice_url"],
        paymentLink: json["payment_link"],
        paymentLines: List<PaymentLine>.from(
            json["payment_lines"].map((x) => PaymentLine.fromJson(x))),
        sellLines: List<SellLine>.from(
            json["sell_lines"].map((x) => SellLine.fromJson(x))),
        contact: Contact.fromJson(json["contact"]),
      );

  Map<String, dynamic> toJson() => {
        "business_id": businessId,
        "location_id": locationId,
        "type": type,
        "status": status,
        "sub_status": subStatus,
        "contact_id": contactId,
        "customer_group_id": customerGroupId,
        "invoice_no": invoiceNo,
        "ref_no": refNo,
        "source": source,
        "total_before_tax": totalBeforeTax,
        "transaction_date": transactionDate.toIso8601String(),
        "tax_id": taxId,
        "discount_type": discountType,
        "discount_amount": discountAmount,
        "tax_amount": taxAmount,
        "final_total": finalTotal,
        "additional_notes": additionalNotes,
        "staff_note": staffNote,
        "created_by": createdBy,
        "document": document,
        "custom_field_1": customField1,
        "custom_field_2": customField2,
        "custom_field_3": customField3,
        "custom_field_4": customField4,
        "is_direct_sale": isDirectSale,
        "commission_agent": commissionAgent,
        "is_quotation": isQuotation,
        "shipping_details": shippingDetails,
        "shipping_address": shippingAddress,
        "shipping_status": shippingStatus,
        "delivered_to": deliveredTo,
        "shipping_charges": shippingCharges,
        "shipping_custom_field_1": shippingCustomField1,
        "shipping_custom_field_2": shippingCustomField2,
        "shipping_custom_field_3": shippingCustomField3,
        "shipping_custom_field_4": shippingCustomField4,
        "shipping_custom_field_5": shippingCustomField5,
        "exchange_rate": exchangeRate,
        "selling_price_group_id": sellingPriceGroupId,
        "pay_term_number": payTermNumber,
        "pay_term_type": payTermType,
        "is_suspend": isSuspend,
        "is_recurring": isRecurring,
        "recur_interval": recurInterval,
        "recur_interval_type": recurIntervalType,
        "subscription_repeat_on": subscriptionRepeatOn,
        "subscription_no": subscriptionNo,
        "recur_repetitions": recurRepetitions,
        "order_addresses": orderAddresses,
        "sub_type": subType,
        "rp_earned": rpEarned,
        "rp_redeemed": rpRedeemed,
        "rp_redeemed_amount": rpRedeemedAmount,
        "is_created_from_api": isCreatedFromApi,
        "types_of_service_id": typesOfServiceId,
        "packing_charge": packingCharge,
        "packing_charge_type": packingChargeType,
        "service_custom_field_1": serviceCustomField1,
        "service_custom_field_2": serviceCustomField2,
        "service_custom_field_3": serviceCustomField3,
        "service_custom_field_4": serviceCustomField4,
        "service_custom_field_5": serviceCustomField5,
        "service_custom_field_6": serviceCustomField6,
        "round_off_amount": roundOffAmount,
        "import_batch": importBatch,
        "import_time": importTime,
        "res_table_id": resTableId,
        "res_waiter_id": resWaiterId,
        "sales_order_ids": salesOrderIds,
        "prefer_payment_method": preferPaymentMethod,
        "prefer_payment_account": preferPaymentAccount,
        "is_export": isExport,
        "export_custom_fields_info": exportCustomFieldsInfo,
        "additional_expense_value_1": additionalExpenseValue1,
        "additional_expense_value_2": additionalExpenseValue2,
        "additional_expense_value_3": additionalExpenseValue3,
        "additional_expense_value_4": additionalExpenseValue4,
        "additional_expense_key_1": additionalExpenseKey1,
        "additional_expense_key_2": additionalExpenseKey2,
        "additional_expense_key_3": additionalExpenseKey3,
        "additional_expense_key_4": additionalExpenseKey4,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "invoice_url": invoiceUrl,
        "payment_link": paymentLink,
        "payment_lines":
            List<dynamic>.from(paymentLines.map((x) => x.toJson())),
        "sell_lines": List<dynamic>.from(sellLines.map((x) => x.toJson())),
        "contact": contact.toJson(),
      };
}

class Contact {
  Contact({
    this.id,
    this.businessId,
    this.type,
    this.supplierBusinessName,
    this.name,
    this.prefix,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.contactId,
    this.currencyId,
    this.contactStatus,
    this.taxNumber,
    this.city,
    this.state,
    this.country,
    this.addressLine1,
    this.addressLine2,
    this.zipCode,
    this.dob,
    this.mobile,
    this.landline,
    this.alternateNumber,
    this.payTermNumber,
    this.payTermType,
    this.creditLimit,
    this.createdBy,
    this.convertedBy,
    this.convertedOn,
    this.balance,
    this.totalRp,
    this.totalRpUsed,
    this.totalRpExpired,
    this.isDefault,
    this.shippingAddress,
    this.shippingCustomFieldDetails,
    this.isExport,
    this.exportCustomField1,
    this.exportCustomField2,
    this.exportCustomField3,
    this.exportCustomField4,
    this.exportCustomField5,
    this.exportCustomField6,
    this.position,
    this.customerGroupId,
    this.crmSource,
    this.crmLifeStage,
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
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int businessId;
  String type;
  dynamic supplierBusinessName;
  String name;
  dynamic prefix;
  String firstName;
  dynamic middleName;
  dynamic lastName;
  dynamic email;
  String contactId;
  dynamic currencyId;
  String contactStatus;
  dynamic taxNumber;
  dynamic city;
  dynamic state;
  dynamic country;
  dynamic addressLine1;
  dynamic addressLine2;
  dynamic zipCode;
  dynamic dob;
  String mobile;
  dynamic landline;
  dynamic alternateNumber;
  dynamic payTermNumber;
  dynamic payTermType;
  String creditLimit;
  int createdBy;
  dynamic convertedBy;
  dynamic convertedOn;
  String balance;
  int totalRp;
  int totalRpUsed;
  int totalRpExpired;
  int isDefault;
  dynamic shippingAddress;
  dynamic shippingCustomFieldDetails;
  int isExport;
  dynamic exportCustomField1;
  dynamic exportCustomField2;
  dynamic exportCustomField3;
  dynamic exportCustomField4;
  dynamic exportCustomField5;
  dynamic exportCustomField6;
  dynamic position;
  dynamic customerGroupId;
  dynamic crmSource;
  dynamic crmLifeStage;
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
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        businessId: json["business_id"],
        type: json["type"],
        supplierBusinessName: json["supplier_business_name"],
        name: json["name"],
        prefix: json["prefix"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        email: json["email"],
        contactId: json["contact_id"],
        currencyId: json["currency_id"],
        contactStatus: json["contact_status"],
        taxNumber: json["tax_number"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        addressLine1: json["address_line_1"],
        addressLine2: json["address_line_2"],
        zipCode: json["zip_code"],
        dob: json["dob"],
        mobile: json["mobile"],
        landline: json["landline"],
        alternateNumber: json["alternate_number"],
        payTermNumber: json["pay_term_number"],
        payTermType: json["pay_term_type"],
        creditLimit: json["credit_limit"],
        createdBy: json["created_by"],
        convertedBy: json["converted_by"],
        convertedOn: json["converted_on"],
        balance: json["balance"],
        totalRp: json["total_rp"],
        totalRpUsed: json["total_rp_used"],
        totalRpExpired: json["total_rp_expired"],
        isDefault: json["is_default"],
        shippingAddress: json["shipping_address"],
        shippingCustomFieldDetails: json["shipping_custom_field_details"],
        isExport: json["is_export"],
        exportCustomField1: json["export_custom_field_1"],
        exportCustomField2: json["export_custom_field_2"],
        exportCustomField3: json["export_custom_field_3"],
        exportCustomField4: json["export_custom_field_4"],
        exportCustomField5: json["export_custom_field_5"],
        exportCustomField6: json["export_custom_field_6"],
        position: json["position"],
        customerGroupId: json["customer_group_id"],
        crmSource: json["crm_source"],
        crmLifeStage: json["crm_life_stage"],
        customField1: json["custom_field1"],
        customField2: json["custom_field2"],
        customField3: json["custom_field3"],
        customField4: json["custom_field4"],
        customField5: json["custom_field5"],
        customField6: json["custom_field6"],
        customField7: json["custom_field7"],
        customField8: json["custom_field8"],
        customField9: json["custom_field9"],
        customField10: json["custom_field10"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "type": type,
        "supplier_business_name": supplierBusinessName,
        "name": name,
        "prefix": prefix,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "email": email,
        "contact_id": contactId,
        "currency_id": currencyId,
        "contact_status": contactStatus,
        "tax_number": taxNumber,
        "city": city,
        "state": state,
        "country": country,
        "address_line_1": addressLine1,
        "address_line_2": addressLine2,
        "zip_code": zipCode,
        "dob": dob,
        "mobile": mobile,
        "landline": landline,
        "alternate_number": alternateNumber,
        "pay_term_number": payTermNumber,
        "pay_term_type": payTermType,
        "credit_limit": creditLimit,
        "created_by": createdBy,
        "converted_by": convertedBy,
        "converted_on": convertedOn,
        "balance": balance,
        "total_rp": totalRp,
        "total_rp_used": totalRpUsed,
        "total_rp_expired": totalRpExpired,
        "is_default": isDefault,
        "shipping_address": shippingAddress,
        "shipping_custom_field_details": shippingCustomFieldDetails,
        "is_export": isExport,
        "export_custom_field_1": exportCustomField1,
        "export_custom_field_2": exportCustomField2,
        "export_custom_field_3": exportCustomField3,
        "export_custom_field_4": exportCustomField4,
        "export_custom_field_5": exportCustomField5,
        "export_custom_field_6": exportCustomField6,
        "position": position,
        "customer_group_id": customerGroupId,
        "crm_source": crmSource,
        "crm_life_stage": crmLifeStage,
        "custom_field1": customField1,
        "custom_field2": customField2,
        "custom_field3": customField3,
        "custom_field4": customField4,
        "custom_field5": customField5,
        "custom_field6": customField6,
        "custom_field7": customField7,
        "custom_field8": customField8,
        "custom_field9": customField9,
        "custom_field10": customField10,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class PaymentLine {
  PaymentLine({
    this.id,
    this.transactionId,
    this.businessId,
    this.isReturn,
    this.amount,
    this.method,
    this.transactionNo,
    this.cardTransactionNumber,
    this.cardNumber,
    this.cardType,
    this.cardHolderName,
    this.cardMonth,
    this.cardYear,
    this.cardSecurity,
    this.chequeNumber,
    this.bankAccountNumber,
    this.paidOn,
    this.createdBy,
    this.paidThroughLink,
    this.gateway,
    this.isAdvance,
    this.paymentFor,
    this.parentId,
    this.note,
    this.document,
    this.paymentRefNo,
    this.accountId,
    this.drCr,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int transactionId;
  int businessId;
  int isReturn;
  String amount;
  String method;
  dynamic transactionNo;
  dynamic cardTransactionNumber;
  dynamic cardNumber;
  dynamic cardType;
  dynamic cardHolderName;
  dynamic cardMonth;
  dynamic cardYear;
  dynamic cardSecurity;
  dynamic chequeNumber;
  dynamic bankAccountNumber;
  DateTime paidOn;
  int createdBy;
  int paidThroughLink;
  dynamic gateway;
  int isAdvance;
  int paymentFor;
  dynamic parentId;
  dynamic note;
  dynamic document;
  String paymentRefNo;
  dynamic accountId;
  dynamic drCr;
  DateTime createdAt;
  DateTime updatedAt;

  factory PaymentLine.fromJson(Map<String, dynamic> json) => PaymentLine(
        id: json["id"],
        transactionId: json["transaction_id"],
        businessId: json["business_id"],
        isReturn: json["is_return"],
        amount: json["amount"],
        method: json["method"],
        transactionNo: json["transaction_no"],
        cardTransactionNumber: json["card_transaction_number"],
        cardNumber: json["card_number"],
        cardType: json["card_type"],
        cardHolderName: json["card_holder_name"],
        cardMonth: json["card_month"],
        cardYear: json["card_year"],
        cardSecurity: json["card_security"],
        chequeNumber: json["cheque_number"],
        bankAccountNumber: json["bank_account_number"],
        paidOn: DateTime.parse(json["paid_on"]),
        createdBy: json["created_by"],
        paidThroughLink: json["paid_through_link"],
        gateway: json["gateway"],
        isAdvance: json["is_advance"],
        paymentFor: json["payment_for"],
        parentId: json["parent_id"],
        note: json["note"],
        document: json["document"],
        paymentRefNo: json["payment_ref_no"],
        accountId: json["account_id"],
        drCr: json["dr_cr"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_id": transactionId,
        "business_id": businessId,
        "is_return": isReturn,
        "amount": amount,
        "method": method,
        "transaction_no": transactionNo,
        "card_transaction_number": cardTransactionNumber,
        "card_number": cardNumber,
        "card_type": cardType,
        "card_holder_name": cardHolderName,
        "card_month": cardMonth,
        "card_year": cardYear,
        "card_security": cardSecurity,
        "cheque_number": chequeNumber,
        "bank_account_number": bankAccountNumber,
        "paid_on": paidOn.toIso8601String(),
        "created_by": createdBy,
        "paid_through_link": paidThroughLink,
        "gateway": gateway,
        "is_advance": isAdvance,
        "payment_for": paymentFor,
        "parent_id": parentId,
        "note": note,
        "document": document,
        "payment_ref_no": paymentRefNo,
        "account_id": accountId,
        "dr_cr": drCr,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class SellLine {
  SellLine({
    this.id,
    this.transactionId,
    this.productId,
    this.variationId,
    this.quantity,
    this.mfgWastePercent,
    this.mfgIngredientGroupId,
    this.quantityReturned,
    this.unitPriceBeforeDiscount,
    this.unitPrice,
    this.lineDiscountType,
    this.lineDiscountAmount,
    this.unitPriceIncTax,
    this.itemTax,
    this.taxId,
    this.discountId,
    this.lotNoLineId,
    this.sellLineNote,
    this.soLineId,
    this.soQuantityInvoiced,
    this.woocommerceLineItemsId,
    this.resServiceStaffId,
    this.resLineOrderStatus,
    this.parentSellLineId,
    this.childrenType,
    this.subUnitId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int transactionId;
  int productId;
  int variationId;
  int quantity;
  String mfgWastePercent;
  dynamic mfgIngredientGroupId;
  String quantityReturned;
  String unitPriceBeforeDiscount;
  String unitPrice;
  String lineDiscountType;
  String lineDiscountAmount;
  String unitPriceIncTax;
  String itemTax;
  dynamic taxId;
  dynamic discountId;
  dynamic lotNoLineId;
  String sellLineNote;
  dynamic soLineId;
  String soQuantityInvoiced;
  dynamic woocommerceLineItemsId;
  dynamic resServiceStaffId;
  dynamic resLineOrderStatus;
  dynamic parentSellLineId;
  String childrenType;
  dynamic subUnitId;
  DateTime createdAt;
  DateTime updatedAt;

  factory SellLine.fromJson(Map<String, dynamic> json) => SellLine(
        id: json["id"],
        transactionId: json["transaction_id"],
        productId: json["product_id"],
        variationId: json["variation_id"],
        quantity: json["quantity"],
        mfgWastePercent: json["mfg_waste_percent"],
        mfgIngredientGroupId: json["mfg_ingredient_group_id"],
        quantityReturned: json["quantity_returned"],
        unitPriceBeforeDiscount: json["unit_price_before_discount"],
        unitPrice: json["unit_price"],
        lineDiscountType: json["line_discount_type"],
        lineDiscountAmount: json["line_discount_amount"],
        unitPriceIncTax: json["unit_price_inc_tax"],
        itemTax: json["item_tax"],
        taxId: json["tax_id"],
        discountId: json["discount_id"],
        lotNoLineId: json["lot_no_line_id"],
        sellLineNote: json["sell_line_note"],
        soLineId: json["so_line_id"],
        soQuantityInvoiced: json["so_quantity_invoiced"],
        woocommerceLineItemsId: json["woocommerce_line_items_id"],
        resServiceStaffId: json["res_service_staff_id"],
        resLineOrderStatus: json["res_line_order_status"],
        parentSellLineId: json["parent_sell_line_id"],
        childrenType: json["children_type"],
        subUnitId: json["sub_unit_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_id": transactionId,
        "product_id": productId,
        "variation_id": variationId,
        "quantity": quantity,
        "mfg_waste_percent": mfgWastePercent,
        "mfg_ingredient_group_id": mfgIngredientGroupId,
        "quantity_returned": quantityReturned,
        "unit_price_before_discount": unitPriceBeforeDiscount,
        "unit_price": unitPrice,
        "line_discount_type": lineDiscountType,
        "line_discount_amount": lineDiscountAmount,
        "unit_price_inc_tax": unitPriceIncTax,
        "item_tax": itemTax,
        "tax_id": taxId,
        "discount_id": discountId,
        "lot_no_line_id": lotNoLineId,
        "sell_line_note": sellLineNote,
        "so_line_id": soLineId,
        "so_quantity_invoiced": soQuantityInvoiced,
        "woocommerce_line_items_id": woocommerceLineItemsId,
        "res_service_staff_id": resServiceStaffId,
        "res_line_order_status": resLineOrderStatus,
        "parent_sell_line_id": parentSellLineId,
        "children_type": childrenType,
        "sub_unit_id": subUnitId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
