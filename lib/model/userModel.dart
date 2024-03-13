class food {
  int? foodId;
  String? foodFullName;
  double? price;
  double? subtotal;

  int? quantity;

  food({
    required this.foodId,
    required this.foodFullName,
    required this.price,
    required this.subtotal,
    required this.quantity,
  });

  factory food.fromJson(Map<String, dynamic> json) {
    return food(
      foodId: json['user_id'],
      foodFullName: json['user_full_name'],
      price: json['business_owner'],
      subtotal: json['business_owner'],
      quantity: json['user_role'],
    );
  }
}
