


class OrderItemw {
   int? orderCount;
  String? day;

  OrderItemw({
     this.orderCount,
    this.day,
  });

  factory OrderItemw.fromJson(Map<String, dynamic> json) {
    return OrderItemw(
      day: json['day']  ,// Provide a default value if it's null
      orderCount: json['orderCount'],  // Provide a default value if it's null
     );
  }
}

class Orderw {
  int? totalNumberOrders;
  double? avgTotalPrice;
  int?totalTotalPrice;
  int?totalNumberReturnedOrders;
  int?totalNumberPaidOrders;

  List<OrderItemw>? orderItems;

  Orderw({
    this.totalNumberOrders,
    this.avgTotalPrice,
    this.totalTotalPrice,
    this.totalNumberReturnedOrders,
    this.totalNumberPaidOrders,
    this.orderItems,
  });

  factory Orderw.fromJson(Map<String, dynamic> json) {
    var orderItemsList = json['weeklyReport'];
    List<OrderItemw> orderItems = (orderItemsList as List<dynamic>)
        .map((item) => OrderItemw.fromJson(item))
        .toList();

    return Orderw(
      totalNumberOrders: json['totalNumberOrders'],                  // Provide a default value if it's null
      avgTotalPrice: json['avgTotalPrice'],
      totalTotalPrice: json['totalTotalPrice'],
      totalNumberReturnedOrders: json['totalNumberReturnedOrders'],                  // Provide a default value if it's null
      totalNumberPaidOrders: json['totalNumberPaidOrders'],
        orderItems: orderItems,
    );
  }
}









