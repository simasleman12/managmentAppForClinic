class Customer {
  int? equipment_id;
  String? equipment_name;
  double? price;
  int? quantity;

  Customer({
    this.equipment_id,
    this.equipment_name,
    this.price,
    this.quantity,

  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      equipment_id: json['equipment_id'],
      equipment_name: json['equipment_name'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
     );
  }








}


class AllGrop  {
  int? equipment_id;
  String? equipment_name;


  AllGrop({
    this.equipment_id,
    this.equipment_name,


  });

  factory AllGrop.fromJson(Map<String, dynamic> json) {
    return AllGrop(
      equipment_id: json['equipment_id'],
      equipment_name: json['equipment_name'],

    );
  }








}