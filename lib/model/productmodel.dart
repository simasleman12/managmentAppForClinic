
class ProductPurchase {
  int? quantity;
  int? price;
  int? inventoryItemId;
  String? inventoryItemName;
  DateTime? production_date;
  String? batch_number;
  DateTime? expire_date;

  ProductPurchase({
     this.price,
     this.batch_number,
    this.inventoryItemId,
    this.inventoryItemName,
    this.production_date,
    this.expire_date,
    this.quantity,
  });

  factory ProductPurchase.fromJson(Map<String, dynamic> json) {
    return ProductPurchase(
      price: json['price'],
      batch_number: json['batchNumber'],
      inventoryItemId: json['inventoryItemId'],
      inventoryItemName: json['inventoryItemName'],
      production_date: json['productionDate'],
      expire_date: json['expirationDate'],
      quantity: json['quantity'],

    );
  }
}


