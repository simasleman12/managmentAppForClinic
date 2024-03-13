class supplier {
  int? id;
  String? name;
  String? phoneNumber;

  DateTime? createdAt;

  supplier({
    this.id,
    this.name,

    this.phoneNumber,

    this.createdAt,
  });

  factory supplier.fromJson(Map<String, dynamic> json) {
    return supplier(
      id: json['id'],
      name: json['name'],

      phoneNumber: json['phoneNumber'],

      createdAt: DateTime.parse(json['createdAt']), // Parse the string as a DateTime
    );
  }


}


class CustomerOne {
    int? id;
    String? name;
    String? phoneNumber;
    String? address;
    DateTime? createdAt;
    List<SaleItem>? purchases;

    CustomerOne({
      this.id,
      this.name,
      this.phoneNumber,
      this.address,
      this.createdAt,
      this.purchases,
  });

  factory CustomerOne.fromJson(Map<String, dynamic> json) {
    List<dynamic> purchaseList = json['purchases'];
    List<SaleItem> purchases = purchaseList.map((purchase) => SaleItem.fromJson(purchase)).toList();

    return CustomerOne(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      createdAt: DateTime.parse(json['createdAt']),
      purchases: purchases,
    );
  }
}

class SaleItem {
    int? id;
    double? totalPrice;
    bool? returned;
    DateTime? createdAt;

    SaleItem({
   this.id,
      this.totalPrice,
      this.returned,
      this.createdAt,
  });

  factory SaleItem.fromJson(Map<String, dynamic> json) {
    return SaleItem(
      id: json['id'],
      totalPrice: json['totalPrice'].toDouble(),
      returned: json['returned'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
