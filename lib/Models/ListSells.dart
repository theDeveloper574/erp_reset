// To parse this JSON data, do
//
//     final listSells = listSellsFromJson(jsonString);

import 'dart:convert';

ListSells listSellsFromJson(String str) => ListSells.fromJson(json.decode(str));

String listSellsToJson(ListSells data) => json.encode(data.toJson());

class ListSells {
  ListSells({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum> data;
  Links links;
  Meta meta;

  factory ListSells.fromJson(Map<String, dynamic> json) => ListSells(
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
    this.id,
    this.businessId,
    this.locationId,
    this.resTableId,
    this.resWaiterId,
    this.resOrderStatus,
    this.type,
    this.subType,
    this.status,
    this.subStatus,
    this.isQuotation,
    this.paymentStatus,
    this.adjustmentType,
    this.contactId,
    this.customerGroupId,
    this.invoiceNo,
    this.refNo,
    this.source,
    this.subscriptionNo,
    this.subscriptionRepeatOn,
    this.transactionDate,
    this.totalBeforeTax,
    this.taxId,
    this.taxAmount,
    this.discountType,
    this.discountAmount,
    this.rpRedeemed,
    this.rpRedeemedAmount,
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
    this.additionalNotes,
    this.staffNote,
    this.isExport,
    this.exportCustomFieldsInfo,
    this.roundOffAmount,
    this.additionalExpenseKey1,
    this.additionalExpenseValue1,
    this.additionalExpenseKey2,
    this.additionalExpenseValue2,
    this.additionalExpenseKey3,
    this.additionalExpenseValue3,
    this.additionalExpenseKey4,
    this.additionalExpenseValue4,
    this.finalTotal,
    this.expenseCategoryId,
    this.expenseSubCategoryId,
    this.expenseFor,
    this.commissionAgent,
    this.document,
    this.isDirectSale,
    this.isSuspend,
    this.exchangeRate,
    this.totalAmountRecovered,
    this.transferParentId,
    this.returnParentId,
    this.openingStockProductId,
    this.createdBy,
    this.crmIsOrderRequest,
    this.preferPaymentMethod,
    this.preferPaymentAccount,
    this.salesOrderIds,
    this.purchaseOrderIds,
    this.customField1,
    this.customField2,
    this.customField3,
    this.customField4,
    this.repairCompletedOn,
    this.repairWarrantyId,
    this.repairBrandId,
    this.repairStatusId,
    this.repairModelId,
    this.repairJobSheetId,
    this.repairDefects,
    this.repairSerialNo,
    this.repairChecklist,
    this.repairSecurityPwd,
    this.repairSecurityPattern,
    this.repairDueDate,
    this.repairDeviceId,
    this.repairUpdatesNotif,
    this.importBatch,
    this.importTime,
    this.typesOfServiceId,
    this.packingCharge,
    this.packingChargeType,
    this.serviceCustomField1,
    this.serviceCustomField2,
    this.serviceCustomField3,
    this.serviceCustomField4,
    this.serviceCustomField5,
    this.serviceCustomField6,
    this.woocommerceOrderId,
    this.essentialsDuration,
    this.essentialsDurationUnit,
    this.essentialsAmountPerUnitDuration,
    this.essentialsAllowances,
    this.essentialsDeductions,
    this.mfgParentProductionPurchaseId,
    this.mfgWastedUnits,
    this.mfgProductionCost,
    this.mfgProductionCostType,
    this.mfgIsFinal,
    this.isCreatedFromApi,
    this.rpEarned,
    this.orderAddresses,
    this.isRecurring,
    this.recurInterval,
    this.recurIntervalType,
    this.recurRepetitions,
    this.recurStoppedOn,
    this.recurParentId,
    this.invoiceToken,
    this.payTermNumber,
    this.payTermType,
    this.pjtProjectId,
    this.pjtTitle,
    this.sellingPriceGroupId,
    this.drCr,
    this.createdAt,
    this.updatedAt,
    this.sellLines,
    this.paymentLines,
    this.contact,
    this.invoiceUrl,
    this.paymentLink,
  });

  int id;
  int businessId;
  int locationId;
  int resTableId;
  int resWaiterId;
  dynamic resOrderStatus;
  String type;
  dynamic subType;
  String status;
  String subStatus;
  int isQuotation;
  String paymentStatus;
  dynamic adjustmentType;
  int contactId;
  dynamic customerGroupId;
  String invoiceNo;
  String refNo;
  String source;
  String subscriptionNo;
  String subscriptionRepeatOn;
  DateTime transactionDate;
  String totalBeforeTax;
  dynamic taxId;
  String taxAmount;
  String discountType;
  String discountAmount;
  int rpRedeemed;
  String rpRedeemedAmount;
  dynamic shippingDetails;
  dynamic shippingAddress;
  dynamic shippingStatus;
  dynamic deliveredTo;
  String shippingCharges;
  dynamic shippingCustomField1;
  dynamic shippingCustomField2;
  dynamic shippingCustomField3;
  dynamic shippingCustomField4;
  dynamic shippingCustomField5;
  String additionalNotes;
  String staffNote;
  int isExport;
  dynamic exportCustomFieldsInfo;
  String roundOffAmount;
  dynamic additionalExpenseKey1;
  String additionalExpenseValue1;
  dynamic additionalExpenseKey2;
  String additionalExpenseValue2;
  dynamic additionalExpenseKey3;
  String additionalExpenseValue3;
  dynamic additionalExpenseKey4;
  String additionalExpenseValue4;
  String finalTotal;
  dynamic expenseCategoryId;
  dynamic expenseSubCategoryId;
  dynamic expenseFor;
  int commissionAgent;
  dynamic document;
  int isDirectSale;
  int isSuspend;
  String exchangeRate;
  dynamic totalAmountRecovered;
  dynamic transferParentId;
  dynamic returnParentId;
  dynamic openingStockProductId;
  int createdBy;
  int crmIsOrderRequest;
  dynamic preferPaymentMethod;
  dynamic preferPaymentAccount;
  dynamic salesOrderIds;
  dynamic purchaseOrderIds;
  dynamic customField1;
  dynamic customField2;
  dynamic customField3;
  dynamic customField4;
  dynamic repairCompletedOn;
  dynamic repairWarrantyId;
  dynamic repairBrandId;
  dynamic repairStatusId;
  dynamic repairModelId;
  dynamic repairJobSheetId;
  dynamic repairDefects;
  dynamic repairSerialNo;
  dynamic repairChecklist;
  dynamic repairSecurityPwd;
  dynamic repairSecurityPattern;
  dynamic repairDueDate;
  dynamic repairDeviceId;
  int repairUpdatesNotif;
  dynamic importBatch;
  dynamic importTime;
  int typesOfServiceId;
  String packingCharge;
  dynamic packingChargeType;
  String serviceCustomField1;
  String serviceCustomField2;
  String serviceCustomField3;
  String serviceCustomField4;
  String serviceCustomField5;
  String serviceCustomField6;
  dynamic woocommerceOrderId;
  String essentialsDuration;
  dynamic essentialsDurationUnit;
  String essentialsAmountPerUnitDuration;
  dynamic essentialsAllowances;
  dynamic essentialsDeductions;
  dynamic mfgParentProductionPurchaseId;
  dynamic mfgWastedUnits;
  String mfgProductionCost;
  String mfgProductionCostType;
  int mfgIsFinal;
  int isCreatedFromApi;
  int rpEarned;
  dynamic orderAddresses;
  int isRecurring;
  int recurInterval;
  String recurIntervalType;
  int recurRepetitions;
  dynamic recurStoppedOn;
  dynamic recurParentId;
  String invoiceToken;
  int payTermNumber;
  String payTermType;
  dynamic pjtProjectId;
  dynamic pjtTitle;
  int sellingPriceGroupId;
  dynamic drCr;
  DateTime createdAt;
  DateTime updatedAt;
  List<SellLine> sellLines;
  List<PaymentLine> paymentLines;
  Contact contact;
  String invoiceUrl;
  String paymentLink;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        businessId: json["business_id"],
        locationId: json["location_id"],
        resTableId: json["res_table_id"],
        resWaiterId: json["res_waiter_id"],
        resOrderStatus: json["res_order_status"],
        type: json["type"],
        subType: json["sub_type"],
        status: json["status"],
        subStatus: json["sub_status"],
        isQuotation: json["is_quotation"],
        paymentStatus: json["payment_status"],
        adjustmentType: json["adjustment_type"],
        contactId: json["contact_id"],
        customerGroupId: json["customer_group_id"],
        invoiceNo: json["invoice_no"],
        refNo: json["ref_no"],
        source: json["source"],
        subscriptionNo:
            json["subscription_no"] == null ? null : json["subscription_no"],
        subscriptionRepeatOn: json["subscription_repeat_on"],
        transactionDate: DateTime.parse(json["transaction_date"]),
        totalBeforeTax: json["total_before_tax"],
        taxId: json["tax_id"],
        taxAmount: json["tax_amount"],
        discountType: json["discount_type"],
        discountAmount: json["discount_amount"],
        rpRedeemed: json["rp_redeemed"],
        rpRedeemedAmount: json["rp_redeemed_amount"],
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
        additionalNotes: json["additional_notes"],
        staffNote: json["staff_note"],
        isExport: json["is_export"],
        exportCustomFieldsInfo: json["export_custom_fields_info"],
        roundOffAmount: json["round_off_amount"],
        additionalExpenseKey1: json["additional_expense_key_1"],
        additionalExpenseValue1: json["additional_expense_value_1"],
        additionalExpenseKey2: json["additional_expense_key_2"],
        additionalExpenseValue2: json["additional_expense_value_2"],
        additionalExpenseKey3: json["additional_expense_key_3"],
        additionalExpenseValue3: json["additional_expense_value_3"],
        additionalExpenseKey4: json["additional_expense_key_4"],
        additionalExpenseValue4: json["additional_expense_value_4"],
        finalTotal: json["final_total"],
        expenseCategoryId: json["expense_category_id"],
        expenseSubCategoryId: json["expense_sub_category_id"],
        expenseFor: json["expense_for"],
        commissionAgent: json["commission_agent"],
        document: json["document"],
        isDirectSale: json["is_direct_sale"],
        isSuspend: json["is_suspend"],
        exchangeRate: json["exchange_rate"],
        totalAmountRecovered: json["total_amount_recovered"],
        transferParentId: json["transfer_parent_id"],
        returnParentId: json["return_parent_id"],
        openingStockProductId: json["opening_stock_product_id"],
        createdBy: json["created_by"],
        crmIsOrderRequest: json["crm_is_order_request"],
        preferPaymentMethod: json["prefer_payment_method"],
        preferPaymentAccount: json["prefer_payment_account"],
        salesOrderIds: json["sales_order_ids"],
        purchaseOrderIds: json["purchase_order_ids"],
        customField1: json["custom_field_1"],
        customField2: json["custom_field_2"],
        customField3: json["custom_field_3"],
        customField4: json["custom_field_4"],
        repairCompletedOn: json["repair_completed_on"],
        repairWarrantyId: json["repair_warranty_id"],
        repairBrandId: json["repair_brand_id"],
        repairStatusId: json["repair_status_id"],
        repairModelId: json["repair_model_id"],
        repairJobSheetId: json["repair_job_sheet_id"],
        repairDefects: json["repair_defects"],
        repairSerialNo: json["repair_serial_no"],
        repairChecklist: json["repair_checklist"],
        repairSecurityPwd: json["repair_security_pwd"],
        repairSecurityPattern: json["repair_security_pattern"],
        repairDueDate: json["repair_due_date"],
        repairDeviceId: json["repair_device_id"],
        repairUpdatesNotif: json["repair_updates_notif"],
        importBatch: json["import_batch"],
        importTime: json["import_time"],
        typesOfServiceId: json["types_of_service_id"],
        packingCharge: json["packing_charge"],
        packingChargeType: json["packing_charge_type"],
        serviceCustomField1: json["service_custom_field_1"] == null
            ? null
            : json["service_custom_field_1"],
        serviceCustomField2: json["service_custom_field_2"] == null
            ? null
            : json["service_custom_field_2"],
        serviceCustomField3: json["service_custom_field_3"] == null
            ? null
            : json["service_custom_field_3"],
        serviceCustomField4: json["service_custom_field_4"] == null
            ? null
            : json["service_custom_field_4"],
        serviceCustomField5: json["service_custom_field_5"] == null
            ? null
            : json["service_custom_field_5"],
        serviceCustomField6: json["service_custom_field_6"] == null
            ? null
            : json["service_custom_field_6"],
        woocommerceOrderId: json["woocommerce_order_id"],
        essentialsDuration: json["essentials_duration"],
        essentialsDurationUnit: json["essentials_duration_unit"],
        essentialsAmountPerUnitDuration:
            json["essentials_amount_per_unit_duration"],
        essentialsAllowances: json["essentials_allowances"],
        essentialsDeductions: json["essentials_deductions"],
        mfgParentProductionPurchaseId:
            json["mfg_parent_production_purchase_id"],
        mfgWastedUnits: json["mfg_wasted_units"],
        mfgProductionCost: json["mfg_production_cost"],
        mfgProductionCostType: json["mfg_production_cost_type"],
        mfgIsFinal: json["mfg_is_final"],
        isCreatedFromApi: json["is_created_from_api"],
        rpEarned: json["rp_earned"],
        orderAddresses: json["order_addresses"],
        isRecurring: json["is_recurring"],
        recurInterval: json["recur_interval"],
        recurIntervalType: json["recur_interval_type"] == null
            ? null
            : json["recur_interval_type"],
        recurRepetitions: json["recur_repetitions"],
        recurStoppedOn: json["recur_stopped_on"],
        recurParentId: json["recur_parent_id"],
        invoiceToken: json["invoice_token"],
        payTermNumber: json["pay_term_number"],
        payTermType: json["pay_term_type"],
        pjtProjectId: json["pjt_project_id"],
        pjtTitle: json["pjt_title"],
        sellingPriceGroupId: json["selling_price_group_id"],
        drCr: json["dr_cr"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        sellLines: List<SellLine>.from(
            json["sell_lines"].map((x) => SellLine.fromJson(x))),
        paymentLines: List<PaymentLine>.from(
            json["payment_lines"].map((x) => PaymentLine.fromJson(x))),
        contact: Contact.fromJson(json["contact"]),
        invoiceUrl: json["invoice_url"],
        paymentLink: json["payment_link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "location_id": locationId,
        "res_table_id": resTableId,
        "res_waiter_id": resWaiterId,
        "res_order_status": resOrderStatus,
        "type": type,
        "sub_type": subType,
        "status": status,
        "sub_status": subStatus,
        "is_quotation": isQuotation,
        "payment_status": paymentStatus,
        "adjustment_type": adjustmentType,
        "contact_id": contactId,
        "customer_group_id": customerGroupId,
        "invoice_no": invoiceNo,
        "ref_no": refNo,
        "source": source,
        "subscription_no": subscriptionNo == null ? null : subscriptionNo,
        "subscription_repeat_on": subscriptionRepeatOn,
        "transaction_date": transactionDate.toIso8601String(),
        "total_before_tax": totalBeforeTax,
        "tax_id": taxId,
        "tax_amount": taxAmount,
        "discount_type": discountType,
        "discount_amount": discountAmount,
        "rp_redeemed": rpRedeemed,
        "rp_redeemed_amount": rpRedeemedAmount,
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
        "additional_notes": additionalNotes,
        "staff_note": staffNote,
        "is_export": isExport,
        "export_custom_fields_info": exportCustomFieldsInfo,
        "round_off_amount": roundOffAmount,
        "additional_expense_key_1": additionalExpenseKey1,
        "additional_expense_value_1": additionalExpenseValue1,
        "additional_expense_key_2": additionalExpenseKey2,
        "additional_expense_value_2": additionalExpenseValue2,
        "additional_expense_key_3": additionalExpenseKey3,
        "additional_expense_value_3": additionalExpenseValue3,
        "additional_expense_key_4": additionalExpenseKey4,
        "additional_expense_value_4": additionalExpenseValue4,
        "final_total": finalTotal,
        "expense_category_id": expenseCategoryId,
        "expense_sub_category_id": expenseSubCategoryId,
        "expense_for": expenseFor,
        "commission_agent": commissionAgent,
        "document": document,
        "is_direct_sale": isDirectSale,
        "is_suspend": isSuspend,
        "exchange_rate": exchangeRate,
        "total_amount_recovered": totalAmountRecovered,
        "transfer_parent_id": transferParentId,
        "return_parent_id": returnParentId,
        "opening_stock_product_id": openingStockProductId,
        "created_by": createdBy,
        "crm_is_order_request": crmIsOrderRequest,
        "prefer_payment_method": preferPaymentMethod,
        "prefer_payment_account": preferPaymentAccount,
        "sales_order_ids": salesOrderIds,
        "purchase_order_ids": purchaseOrderIds,
        "custom_field_1": customField1,
        "custom_field_2": customField2,
        "custom_field_3": customField3,
        "custom_field_4": customField4,
        "repair_completed_on": repairCompletedOn,
        "repair_warranty_id": repairWarrantyId,
        "repair_brand_id": repairBrandId,
        "repair_status_id": repairStatusId,
        "repair_model_id": repairModelId,
        "repair_job_sheet_id": repairJobSheetId,
        "repair_defects": repairDefects,
        "repair_serial_no": repairSerialNo,
        "repair_checklist": repairChecklist,
        "repair_security_pwd": repairSecurityPwd,
        "repair_security_pattern": repairSecurityPattern,
        "repair_due_date": repairDueDate,
        "repair_device_id": repairDeviceId,
        "repair_updates_notif": repairUpdatesNotif,
        "import_batch": importBatch,
        "import_time": importTime,
        "types_of_service_id": typesOfServiceId,
        "packing_charge": packingCharge,
        "packing_charge_type": packingChargeType,
        "service_custom_field_1":
            serviceCustomField1 == null ? null : serviceCustomField1,
        "service_custom_field_2":
            serviceCustomField2 == null ? null : serviceCustomField2,
        "service_custom_field_3":
            serviceCustomField3 == null ? null : serviceCustomField3,
        "service_custom_field_4":
            serviceCustomField4 == null ? null : serviceCustomField4,
        "service_custom_field_5":
            serviceCustomField5 == null ? null : serviceCustomField5,
        "service_custom_field_6":
            serviceCustomField6 == null ? null : serviceCustomField6,
        "woocommerce_order_id": woocommerceOrderId,
        "essentials_duration": essentialsDuration,
        "essentials_duration_unit": essentialsDurationUnit,
        "essentials_amount_per_unit_duration": essentialsAmountPerUnitDuration,
        "essentials_allowances": essentialsAllowances,
        "essentials_deductions": essentialsDeductions,
        "mfg_parent_production_purchase_id": mfgParentProductionPurchaseId,
        "mfg_wasted_units": mfgWastedUnits,
        "mfg_production_cost": mfgProductionCost,
        "mfg_production_cost_type": mfgProductionCostType,
        "mfg_is_final": mfgIsFinal,
        "is_created_from_api": isCreatedFromApi,
        "rp_earned": rpEarned,
        "order_addresses": orderAddresses,
        "is_recurring": isRecurring,
        "recur_interval": recurInterval,
        "recur_interval_type":
            recurIntervalType == null ? null : recurIntervalType,
        "recur_repetitions": recurRepetitions,
        "recur_stopped_on": recurStoppedOn,
        "recur_parent_id": recurParentId,
        "invoice_token": invoiceToken,
        "pay_term_number": payTermNumber,
        "pay_term_type": payTermType,
        "pjt_project_id": pjtProjectId,
        "pjt_title": pjtTitle,
        "selling_price_group_id": sellingPriceGroupId,
        "dr_cr": drCr,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "sell_lines": List<dynamic>.from(sellLines.map((x) => x.toJson())),
        "payment_lines":
            List<dynamic>.from(paymentLines.map((x) => x.toJson())),
        "contact": contact.toJson(),
        "invoice_url": invoiceUrl,
        "payment_link": paymentLink,
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
  String supplierBusinessName;
  String name;
  String prefix;
  String firstName;
  String middleName;
  String lastName;
  dynamic email;
  String contactId;
  dynamic currencyId;
  String contactStatus;
  dynamic taxNumber;
  String city;
  String state;
  String country;
  String addressLine1;
  String addressLine2;
  dynamic zipCode;
  dynamic dob;
  String mobile;
  dynamic landline;
  dynamic alternateNumber;
  int payTermNumber;
  String payTermType;
  dynamic creditLimit;
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
        middleName: json["middle_name"] == null ? null : json["middle_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"],
        contactId: json["contact_id"],
        currencyId: json["currency_id"],
        contactStatus: json["contact_status"],
        taxNumber: json["tax_number"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        country: json["country"] == null ? null : json["country"],
        addressLine1:
            json["address_line_1"] == null ? null : json["address_line_1"],
        addressLine2:
            json["address_line_2"] == null ? null : json["address_line_2"],
        zipCode: json["zip_code"],
        dob: json["dob"],
        mobile: json["mobile"],
        landline: json["landline"],
        alternateNumber: json["alternate_number"],
        payTermNumber:
            json["pay_term_number"] == null ? null : json["pay_term_number"],
        payTermType:
            json["pay_term_type"] == null ? null : json["pay_term_type"],
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
        "middle_name": middleName == null ? null : middleName,
        "last_name": lastName == null ? null : lastName,
        "email": email,
        "contact_id": contactId,
        "currency_id": currencyId,
        "contact_status": contactStatus,
        "tax_number": taxNumber,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "address_line_1": addressLine1 == null ? null : addressLine1,
        "address_line_2": addressLine2 == null ? null : addressLine2,
        "zip_code": zipCode,
        "dob": dob,
        "mobile": mobile,
        "landline": landline,
        "alternate_number": alternateNumber,
        "pay_term_number": payTermNumber == null ? null : payTermNumber,
        "pay_term_type": payTermType == null ? null : payTermType,
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
  Method method;
  dynamic transactionNo;
  String cardTransactionNumber;
  String cardNumber;
  String cardType;
  String cardHolderName;
  String cardMonth;
  dynamic cardYear;
  String cardSecurity;
  String chequeNumber;
  String bankAccountNumber;
  DateTime paidOn;
  int createdBy;
  int paidThroughLink;
  dynamic gateway;
  int isAdvance;
  int paymentFor;
  dynamic parentId;
  String note;
  dynamic document;
  String paymentRefNo;
  int accountId;
  dynamic drCr;
  DateTime createdAt;
  DateTime updatedAt;

  factory PaymentLine.fromJson(Map<String, dynamic> json) => PaymentLine(
        id: json["id"],
        transactionId: json["transaction_id"],
        businessId: json["business_id"],
        isReturn: json["is_return"],
        amount: json["amount"],
        method: methodValues.map[json["method"]],
        transactionNo: json["transaction_no"],
        cardTransactionNumber: json["card_transaction_number"] == null
            ? null
            : json["card_transaction_number"],
        cardNumber: json["card_number"] == null ? null : json["card_number"],
        cardType: json["card_type"] == null ? null : json["card_type"],
        cardHolderName:
            json["card_holder_name"] == null ? null : json["card_holder_name"],
        cardMonth: json["card_month"] == null ? null : json["card_month"],
        cardYear: json["card_year"],
        cardSecurity:
            json["card_security"] == null ? null : json["card_security"],
        chequeNumber:
            json["cheque_number"] == null ? null : json["cheque_number"],
        bankAccountNumber: json["bank_account_number"] == null
            ? null
            : json["bank_account_number"],
        paidOn: DateTime.parse(json["paid_on"]),
        createdBy: json["created_by"],
        paidThroughLink: json["paid_through_link"],
        gateway: json["gateway"],
        isAdvance: json["is_advance"],
        paymentFor: json["payment_for"],
        parentId: json["parent_id"],
        note: json["note"] == null ? null : json["note"],
        document: json["document"],
        paymentRefNo: json["payment_ref_no"],
        accountId: json["account_id"] == null ? null : json["account_id"],
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
        "method": methodValues.reverse[method],
        "transaction_no": transactionNo,
        "card_transaction_number":
            cardTransactionNumber == null ? null : cardTransactionNumber,
        "card_number": cardNumber == null ? null : cardNumber,
        "card_type": cardType == null ? null : cardType,
        "card_holder_name": cardHolderName == null ? null : cardHolderName,
        "card_month": cardMonth == null ? null : cardMonth,
        "card_year": cardYear,
        "card_security": cardSecurity == null ? null : cardSecurity,
        "cheque_number": chequeNumber == null ? null : chequeNumber,
        "bank_account_number":
            bankAccountNumber == null ? null : bankAccountNumber,
        "paid_on": paidOn.toIso8601String(),
        "created_by": createdBy,
        "paid_through_link": paidThroughLink,
        "gateway": gateway,
        "is_advance": isAdvance,
        "payment_for": paymentFor,
        "parent_id": parentId,
        "note": note == null ? null : note,
        "document": document,
        "payment_ref_no": paymentRefNo,
        "account_id": accountId == null ? null : accountId,
        "dr_cr": drCr,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Method { CASH }

final methodValues = EnumValues({"cash": Method.CASH});

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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
