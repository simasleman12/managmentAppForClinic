class Purchase {
  int? id;
  double? totalPrice;
  bool? returned;
  DateTime? createdAt;
  List<PurchaseItem>? purchaseItems;

  Purchase({
    this.id,
    this.totalPrice,
    this.returned,
    this.createdAt,
    this.purchaseItems,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) {
    List<dynamic>? purchaseItemsList = json['purchaseItems'];
    List<PurchaseItem>? purchaseItems;

    if (purchaseItemsList != null) {
      purchaseItems = purchaseItemsList.map((item) {
        return PurchaseItem.fromJson(item);
      }).toList();
    }

    return Purchase(
      id: json['id'],
      totalPrice: json['totalPrice'].toDouble(),
      returned: json['returned'],
      createdAt: DateTime.parse(json['createdAt']),
      purchaseItems: purchaseItems,
    );
  }
}

class PurchaseItem {
  int? id;
  int? quantity;
  double? price;
  int? purchaseId;
  int? inventoryItemId;
  String? note;
  DateTime? createdAt;
  InventoryItem? inventoryItem;

  PurchaseItem({
    this.id,
    this.quantity,
    this.price,
    this.purchaseId,
    this.inventoryItemId,
    this.note,
    this.createdAt,
    this.inventoryItem,
  });

  factory PurchaseItem.fromJson(Map<String, dynamic> json) {
    return PurchaseItem(
      id: json['id'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      purchaseId: json['purchaseId'],
      inventoryItemId: json['inventoryItemId'],
      note: json['note'],
      createdAt: DateTime.parse(json['createdAt']),
      inventoryItem: InventoryItem.fromJson(json['inventoryItem']),
    );
  }
}

class InventoryItem {
  String? name;

  InventoryItem({
    this.name,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      name: json['name'],
    );
  }
}
