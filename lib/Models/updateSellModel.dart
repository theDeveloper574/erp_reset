// To parse this JSON data, do
//
//     final updateSell = updateSellFromJson(jsonString);

import 'dart:convert';

UpdateSell updateSellFromJson(String str) =>
    UpdateSell.fromJson(json.decode(str));

String updateSellToJson(UpdateSell data) => json.encode(data.toJson());

class UpdateSell {
  UpdateSell({
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
    this.invoiceUrl,
    this.paymentLink,
    this.paymentLines,
  });

  int id;
  int businessId;
  int locationId;
  dynamic resTableId;
  dynamic resWaiterId;
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
  dynamic source;
  dynamic subscriptionNo;
  dynamic subscriptionRepeatOn;
  DateTime transactionDate;
  String totalBeforeTax;
  dynamic taxId;
  String taxAmount;
  String discountType;
  String discountAmount;
  int rpRedeemed;
  String rpRedeemedAmount;
  String shippingDetails;
  String shippingAddress;
  String shippingStatus;
  String deliveredTo;
  String shippingCharges;
  dynamic shippingCustomField1;
  dynamic shippingCustomField2;
  dynamic shippingCustomField3;
  dynamic shippingCustomField4;
  dynamic shippingCustomField5;
  dynamic additionalNotes;
  dynamic staffNote;
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
  dynamic expenseFor;
  dynamic commissionAgent;
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
  dynamic typesOfServiceId;
  String packingCharge;
  dynamic packingChargeType;
  dynamic serviceCustomField1;
  dynamic serviceCustomField2;
  dynamic serviceCustomField3;
  dynamic serviceCustomField4;
  dynamic serviceCustomField5;
  dynamic serviceCustomField6;
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
  dynamic payTermNumber;
  dynamic payTermType;
  dynamic pjtProjectId;
  dynamic pjtTitle;
  dynamic sellingPriceGroupId;
  dynamic drCr;
  DateTime createdAt;
  DateTime updatedAt;
  String invoiceUrl;
  String paymentLink;
  List<PaymentLine> paymentLines;

  factory UpdateSell.fromJson(Map<String, dynamic> json) => UpdateSell(
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
        subscriptionNo: json["subscription_no"],
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
        serviceCustomField1: json["service_custom_field_1"],
        serviceCustomField2: json["service_custom_field_2"],
        serviceCustomField3: json["service_custom_field_3"],
        serviceCustomField4: json["service_custom_field_4"],
        serviceCustomField5: json["service_custom_field_5"],
        serviceCustomField6: json["service_custom_field_6"],
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
        recurIntervalType: json["recur_interval_type"],
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
        invoiceUrl: json["invoice_url"],
        paymentLink: json["payment_link"],
        paymentLines: List<PaymentLine>.from(
            json["payment_lines"].map((x) => PaymentLine.fromJson(x))),
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
        "subscription_no": subscriptionNo,
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
        "service_custom_field_1": serviceCustomField1,
        "service_custom_field_2": serviceCustomField2,
        "service_custom_field_3": serviceCustomField3,
        "service_custom_field_4": serviceCustomField4,
        "service_custom_field_5": serviceCustomField5,
        "service_custom_field_6": serviceCustomField6,
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
        "recur_interval_type": recurIntervalType,
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
        "invoice_url": invoiceUrl,
        "payment_link": paymentLink,
        "payment_lines":
            List<dynamic>.from(paymentLines.map((x) => x.toJson())),
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
  String cardType;
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
