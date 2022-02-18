// To parse this JSON data, do
//
//     final searchProductsModel = searchProductsModelFromJson(jsonString);

import 'dart:convert';

SearchProductsModel searchProductsModelFromJson(String str) =>
    SearchProductsModel.fromJson(json.decode(str));

String searchProductsModelToJson(SearchProductsModel data) =>
    json.encode(data.toJson());

class SearchProductsModel {
  SearchProductsModel({
    this.data,
  });

  List<Datum> data;

  factory SearchProductsModel.fromJson(Map<String, dynamic> json) =>
      SearchProductsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.businessId,
    this.type,
    this.subUnitIds,
    this.enableStock,
    this.alertQuantity,
    this.sku,
    this.barcodeType,
    this.expiryPeriod,
    this.expiryPeriodType,
    this.enableSrNo,
    this.weight,
    this.productCustomField1,
    this.productCustomField2,
    this.productCustomField3,
    this.productCustomField4,
    this.image,
    this.woocommerceMediaId,
    this.productDescription,
    this.createdBy,
    this.warrantyId,
    this.woocommerceProductId,
    this.woocommerceDisableSync,
    this.isInactive,
    this.repairModelId,
    this.notForSelling,
    this.imageUrl,
    this.productVariations,
    this.brand,
    this.unit,
    this.category,
    this.subCategory,
    this.productTax,
    this.productLocations,
  });

  int id;
  String name;
  String businessId;
  String type;
  dynamic subUnitIds;
  String enableStock;
  String alertQuantity;
  String sku;
  String barcodeType;
  dynamic expiryPeriod;
  dynamic expiryPeriodType;
  String enableSrNo;
  dynamic weight;
  dynamic productCustomField1;
  dynamic productCustomField2;
  dynamic productCustomField3;
  dynamic productCustomField4;
  dynamic image;
  dynamic woocommerceMediaId;
  String productDescription;
  String createdBy;
  dynamic warrantyId;
  dynamic woocommerceProductId;
  String woocommerceDisableSync;
  String isInactive;
  dynamic repairModelId;
  String notForSelling;
  String imageUrl;
  List<ProductVariation> productVariations;
  dynamic brand;
  Unit unit;
  Category category;
  dynamic subCategory;
  dynamic productTax;
  List<ProductLocation> productLocations;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        businessId: json["business_id"],
        type: json["type"],
        subUnitIds: json["sub_unit_ids"],
        enableStock: json["enable_stock"],
        alertQuantity: json["alert_quantity"],
        sku: json["sku"],
        barcodeType: json["barcode_type"],
        expiryPeriod: json["expiry_period"],
        expiryPeriodType: json["expiry_period_type"],
        enableSrNo: json["enable_sr_no"],
        weight: json["weight"],
        productCustomField1: json["product_custom_field1"],
        productCustomField2: json["product_custom_field2"],
        productCustomField3: json["product_custom_field3"],
        productCustomField4: json["product_custom_field4"],
        image: json["image"],
        woocommerceMediaId: json["woocommerce_media_id"],
        productDescription: json["product_description"],
        createdBy: json["created_by"],
        warrantyId: json["warranty_id"],
        woocommerceProductId: json["woocommerce_product_id"],
        woocommerceDisableSync: json["woocommerce_disable_sync"],
        isInactive: json["is_inactive"],
        repairModelId: json["repair_model_id"],
        notForSelling: json["not_for_selling"],
        imageUrl: json["image_url"],
        productVariations: List<ProductVariation>.from(
            json["product_variations"]
                .map((x) => ProductVariation.fromJson(x))),
        brand: json["brand"],
        unit: Unit.fromJson(json["unit"]),
        category: Category.fromJson(json["category"]),
        subCategory: json["sub_category"],
        productTax: json["product_tax"],
        productLocations: List<ProductLocation>.from(
            json["product_locations"].map((x) => ProductLocation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "business_id": businessId,
        "type": type,
        "sub_unit_ids": subUnitIds,
        "enable_stock": enableStock,
        "alert_quantity": alertQuantity,
        "sku": sku,
        "barcode_type": barcodeType,
        "expiry_period": expiryPeriod,
        "expiry_period_type": expiryPeriodType,
        "enable_sr_no": enableSrNo,
        "weight": weight,
        "product_custom_field1": productCustomField1,
        "product_custom_field2": productCustomField2,
        "product_custom_field3": productCustomField3,
        "product_custom_field4": productCustomField4,
        "image": image,
        "woocommerce_media_id": woocommerceMediaId,
        "product_description": productDescription,
        "created_by": createdBy,
        "warranty_id": warrantyId,
        "woocommerce_product_id": woocommerceProductId,
        "woocommerce_disable_sync": woocommerceDisableSync,
        "is_inactive": isInactive,
        "repair_model_id": repairModelId,
        "not_for_selling": notForSelling,
        "image_url": imageUrl,
        "product_variations":
            List<dynamic>.from(productVariations.map((x) => x.toJson())),
        "brand": brand,
        "unit": unit.toJson(),
        "category": category.toJson(),
        "sub_category": subCategory,
        "product_tax": productTax,
        "product_locations":
            List<dynamic>.from(productLocations.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.businessId,
    this.shortCode,
    this.parentId,
    this.createdBy,
    this.categoryType,
    this.description,
    this.slug,
    this.woocommerceCatId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String businessId;
  dynamic shortCode;
  String parentId;
  String createdBy;
  String categoryType;
  dynamic description;
  dynamic slug;
  dynamic woocommerceCatId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        businessId: json["business_id"],
        shortCode: json["short_code"],
        parentId: json["parent_id"],
        createdBy: json["created_by"],
        categoryType: json["category_type"],
        description: json["description"],
        slug: json["slug"],
        woocommerceCatId: json["woocommerce_cat_id"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "business_id": businessId,
        "short_code": shortCode,
        "parent_id": parentId,
        "created_by": createdBy,
        "category_type": categoryType,
        "description": description,
        "slug": slug,
        "woocommerce_cat_id": woocommerceCatId,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class ProductLocation {
  ProductLocation({
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
    this.pivot,
  });

  int id;
  String businessId;
  String locationId;
  String name;
  String landmark;
  String country;
  String state;
  String city;
  String zipCode;
  String invoiceSchemeId;
  String invoiceLayoutId;
  String saleInvoiceLayoutId;
  dynamic sellingPriceGroupId;
  String printReceiptOnInvoice;
  String receiptPrinterType;
  dynamic printerId;
  String mobile;
  dynamic alternateNumber;
  dynamic email;
  String website;
  dynamic featuredProducts;
  String defaultPaymentAccounts;
  String isActive;
  dynamic customField1;
  dynamic customField2;
  dynamic customField3;
  dynamic customField4;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  factory ProductLocation.fromJson(Map<String, dynamic> json) =>
      ProductLocation(
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
        email: json["email"],
        website: json["website"],
        featuredProducts: json["featured_products"],
        defaultPaymentAccounts: json["default_payment_accounts"],
        isActive: json["is_active"],
        customField1: json["custom_field1"],
        customField2: json["custom_field2"],
        customField3: json["custom_field3"],
        customField4: json["custom_field4"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
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
        "email": email,
        "website": website,
        "featured_products": featuredProducts,
        "default_payment_accounts": defaultPaymentAccounts,
        "is_active": isActive,
        "custom_field1": customField1,
        "custom_field2": customField2,
        "custom_field3": customField3,
        "custom_field4": customField4,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  Pivot({
    this.productId,
    this.locationId,
  });

  String productId;
  String locationId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        productId: json["product_id"],
        locationId: json["location_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "location_id": locationId,
      };
}

class ProductVariation {
  ProductVariation({
    this.id,
    this.variationTemplateId,
    this.name,
    this.productId,
    this.isDummy,
    this.createdAt,
    this.updatedAt,
    this.variations,
  });

  int id;
  dynamic variationTemplateId;
  String name;
  String productId;
  String isDummy;
  DateTime createdAt;
  DateTime updatedAt;
  List<Variation> variations;

  factory ProductVariation.fromJson(Map<String, dynamic> json) =>
      ProductVariation(
        id: json["id"],
        variationTemplateId: json["variation_template_id"],
        name: json["name"],
        productId: json["product_id"],
        isDummy: json["is_dummy"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        variations: List<Variation>.from(
            json["variations"].map((x) => Variation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "variation_template_id": variationTemplateId,
        "name": name,
        "product_id": productId,
        "is_dummy": isDummy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
      };
}

class Variation {
  Variation({
    this.id,
    this.name,
    this.productId,
    this.subSku,
    this.productVariationId,
    this.woocommerceVariationId,
    this.variationValueId,
    this.defaultPurchasePrice,
    this.dppIncTax,
    this.profitPercent,
    this.defaultSellPrice,
    this.sellPriceIncTax,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.comboVariations,
    this.variationLocationDetails,
    this.media,
  });

  int id;
  String name;
  String productId;
  String subSku;
  String productVariationId;
  dynamic woocommerceVariationId;
  dynamic variationValueId;
  String defaultPurchasePrice;
  String dppIncTax;
  String profitPercent;
  String defaultSellPrice;
  String sellPriceIncTax;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<dynamic> comboVariations;
  List<dynamic> variationLocationDetails;
  List<dynamic> media;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json["id"],
        name: json["name"],
        productId: json["product_id"],
        subSku: json["sub_sku"],
        productVariationId: json["product_variation_id"],
        woocommerceVariationId: json["woocommerce_variation_id"],
        variationValueId: json["variation_value_id"],
        defaultPurchasePrice: json["default_purchase_price"],
        dppIncTax: json["dpp_inc_tax"],
        profitPercent: json["profit_percent"],
        defaultSellPrice: json["default_sell_price"],
        sellPriceIncTax: json["sell_price_inc_tax"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        comboVariations:
            List<dynamic>.from(json["combo_variations"].map((x) => x)),
        variationLocationDetails: List<dynamic>.from(
            json["variation_location_details"].map((x) => x)),
        media: List<dynamic>.from(json["media"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "product_id": productId,
        "sub_sku": subSku,
        "product_variation_id": productVariationId,
        "woocommerce_variation_id": woocommerceVariationId,
        "variation_value_id": variationValueId,
        "default_purchase_price": defaultPurchasePrice,
        "dpp_inc_tax": dppIncTax,
        "profit_percent": profitPercent,
        "default_sell_price": defaultSellPrice,
        "sell_price_inc_tax": sellPriceIncTax,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "combo_variations": List<dynamic>.from(comboVariations.map((x) => x)),
        "variation_location_details":
            List<dynamic>.from(variationLocationDetails.map((x) => x)),
        "media": List<dynamic>.from(media.map((x) => x)),
      };
}

class Unit {
  Unit({
    this.id,
    this.businessId,
    this.actualName,
    this.shortName,
    this.allowDecimal,
    this.baseUnitId,
    this.baseUnitMultiplier,
    this.createdBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String businessId;
  String actualName;
  String shortName;
  String allowDecimal;
  dynamic baseUnitId;
  dynamic baseUnitMultiplier;
  String createdBy;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        businessId: json["business_id"],
        actualName: json["actual_name"],
        shortName: json["short_name"],
        allowDecimal: json["allow_decimal"],
        baseUnitId: json["base_unit_id"],
        baseUnitMultiplier: json["base_unit_multiplier"],
        createdBy: json["created_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "actual_name": actualName,
        "short_name": shortName,
        "allow_decimal": allowDecimal,
        "base_unit_id": baseUnitId,
        "base_unit_multiplier": baseUnitMultiplier,
        "created_by": createdBy,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
