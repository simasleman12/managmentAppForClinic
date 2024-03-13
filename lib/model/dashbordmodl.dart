class MenuItem {
    String? phone_number;
    String? patient_name;
    String? email;
    String? address_line_one;
    String? gender;
    int? loan;
    String? birthday;
    int? patient_id;

  MenuItem({
      this.phone_number,
      this.patient_name,
      this.patient_id,
    this.email,
    this.address_line_one,
    this.gender,
    this.loan,
    this.birthday,
   });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      phone_number: json['phone_number'] ,
      patient_name: json['patient_name'] ,
      patient_id: json['patient_id'] ,
      email: json['email'] ,
      address_line_one: json['address_line_one'] ,
      gender: json['gender'] ,
      loan: json['loan'] ,
      birthday: json['birthday'] ,
     );
  }
}

class ordergetss {
  int? case_id;
  String? case_name;
  int? price;

  ordergetss({
    this.case_id,
    this.case_name,
    this.price,
  });

  factory ordergetss.fromJson(Map<String, dynamic> json) {
    return ordergetss(
      case_id: json['case_id'] ,
      case_name: json['case_name'] ,
      price: json['price'] ,
    );
  }
}


class OrderGet {
  String? day;
  int? orders;

  OrderGet({
    this.day,
    this.orders,
  });

  factory OrderGet.fromJson(Map<String, dynamic> json) {
    return OrderGet(
      day: json['day'],
      orders: json['orders'],
    );
  }
}


class ern {
  int? totalOrders;
  int? totalEarned;

  ern({
    this.totalOrders,
    this.totalEarned,
  });

  factory ern.fromJson(Map<String, dynamic> json) {
    return ern(
      totalOrders: json['totalOrders'],
      totalEarned: json['totalEarned'],
    );
  }
}

class purchase {
  int? totalPurchases;
  int? totalReturnedPurchases;

  purchase({
    this.totalPurchases,
    this.totalReturnedPurchases,
  });

  factory purchase.fromJson(Map<String, dynamic> json) {
    return purchase(
      totalPurchases: json['totalPurchases'],
      totalReturnedPurchases: json['totalReturnedPurchases'],
    );
  }
}
