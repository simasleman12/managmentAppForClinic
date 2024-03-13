
class ProductPurchase {
  int quantity;
  int price;
    String menuItemId;
    int? foodSubCatagory;

  ProductPurchase({
   required this.price,
    required this.menuItemId,
    required this.quantity,
    this.foodSubCatagory
  });

  factory ProductPurchase.fromJson(Map<String, dynamic> json) {
    return ProductPurchase(
      price: json['price'],
      menuItemId: json['menuItemId'],
        quantity: json['quantity'],

    );
  }
}




class Orderhistory {
    int? tableNumber;
    int? totalPrice;

    DateTime? createdAt;

  Orderhistory({
      this.tableNumber,

      this.totalPrice,

      this.createdAt,
  });

  factory Orderhistory.fromJson(Map<String, dynamic> json) {
    return Orderhistory(
      tableNumber: json['tableNumber'] ,

      totalPrice: json['totalPrice']  ,

      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}






