class StatusOrder {
  int? totalOrders;
  int? totalEarned;

  StatusOrder({
    this.totalOrders,
    this.totalEarned,
  });

  factory StatusOrder.fromJson(Map<String, dynamic> json) {
    // Check if 'table' key exists and is not null

    return StatusOrder(
      totalOrders: json['totalOrders'],
      totalEarned: json['totalEarned'],
    );
  }
}

class OrderItems {
  int? quantity;
  int? price;
  String? name;

  OrderItems({
      this.quantity,
      this.price,
      this.name,
  });

  factory OrderItems.fromJson(Map<String, dynamic> json) {
    return OrderItems(
      quantity: json['quantity']  ,// Provide a default value if it's null
      price: json['price'],  // Provide a default value if it's null
      name: json['name'] ,    // Provide a default value if it's null
    );
  }
}

class Orders {
  int? id;
   int? tableNumber;
  DateTime? createdAt;
  List<OrderItems>? orderItems;

  Orders({
      this.id,
       this.tableNumber,
      this.createdAt,
      this.orderItems,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    var orderItemsList = json['orderItems'];
    List<OrderItems> orderItems = (orderItemsList as List<dynamic>)
        .map((item) => OrderItems.fromJson(item))
        .toList();

    return Orders(
      id: json['id'],                  // Provide a default value if it's null
      tableNumber: json['tableNumber'], // Provide a default value if it's null
      createdAt: DateTime.parse(json['createdAt']), // Provide a default value if it's null
      orderItems: orderItems,
    );
  }
}
