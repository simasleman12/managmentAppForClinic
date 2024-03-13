class Item {
  int? id;
  String? name;
  int? reorderThreshold;
  int? categoryId;
  int? quantityTypeId;
  DateTime? createdAt;

  Item({
    this.id,
    this.name,
    this.reorderThreshold,
    this.categoryId,
    this.quantityTypeId,

    this.createdAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      reorderThreshold: json['reorderThreshold'],
      categoryId: json['categoryId'],
      quantityTypeId: json['quantityTypeId'],

      createdAt: DateTime.parse(json['createdAt']), // Parse the string as a DateTime
    );
  }








}


class purchaseitemall {
  int? id;
   int? totalPrice;
  bool? paymentStatus;
  String? supplier_name;
  bool? paymentLoan;
  DateTime? createdAt;

  purchaseitemall({
    this.id,
    this.totalPrice,
    this.paymentStatus,
    this.paymentLoan,
  this.supplier_name,
    this.createdAt,
  });

  factory purchaseitemall.fromJson(Map<String, dynamic> json) {
    return purchaseitemall(
      id: json['id'],
      totalPrice: json['totalPrice'],
      paymentStatus: json['paymentStatus'],
      paymentLoan: json['paymentLoan'],
      supplier_name: json['supplier_name'],

      createdAt: DateTime.parse(json['createdAt']), // Parse the string as a DateTime
    );
  }
}



class PurchaseItem {
    int? quantity;
    double? price;
    String? name;
    String? type;

  PurchaseItem({
      this.quantity,
      this.price,
      this.name,
      this.type,
  });

  factory PurchaseItem.fromJson(Map<String, dynamic> json) {
    return PurchaseItem(
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      name: json['name'],
      type: json['type'],
    );
  }
}

class PurchaseData {
  int? totalPrice;
  bool? paymentStatus;
  bool? paymentLoan;
  List<PurchaseItem>? purchaseItems;

  PurchaseData({
    this.totalPrice,
    this.paymentStatus,
    this.paymentLoan,
    this.purchaseItems,
  });

  factory PurchaseData.fromJson(Map<String, dynamic> json) {
    var purchaseItemsList = json['purchaseItems'] as List<dynamic>?;

    List<PurchaseItem> items = purchaseItemsList?.map((itemJson) {
      return PurchaseItem.fromJson(itemJson as Map<String, dynamic>);
    }).toList() ?? [];

    return PurchaseData(
      totalPrice: json['totalPrice'] as int?,
      paymentStatus: json['paymentStatus'] as bool?,
      paymentLoan: json['paymentLoan'] as bool?,
      purchaseItems: items,
    );
  }
}
