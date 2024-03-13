class OrderItem {
    int? quantity;
    double? price;
    String? name;
    String foodSubCategory;
  OrderItem({
      this.quantity,
      this.price,
      this.name,
    required this.foodSubCategory
  });


  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      name: json['name'],
      foodSubCategory: json['foodSubCategory'],

    );
  }
}

class Order {
    int? id;
    String? note;
    int? tableNumber;
    List<OrderItem>? orderItems;

  Order({
      this.id,
      this.note,
      this.tableNumber,
      this.orderItems,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    var orderItemsList = json['orderItems'] as List;
    List<OrderItem> orderItems = orderItemsList.map((item) => OrderItem.fromJson(item)).toList();
    return Order(
      id: json['id'],
      note: json['note'],
      tableNumber: json['tableNumber'],
      orderItems: orderItems,
    );
  }
}

