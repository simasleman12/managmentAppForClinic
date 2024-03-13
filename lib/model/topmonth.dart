class lowinstock {
  int? quantity;

  String? name;


  lowinstock({
    this.quantity,
    this.name,


  });

  factory lowinstock.fromJson(Map<String, dynamic> json) {
    return lowinstock(
      quantity: json['quantity'],
      name: json['name'],
        // Parse the string as a DateTime
    );
  }








}

class monthtop {
  int? quantity;

  String? name;


  monthtop({
    this.quantity,
    this.name,


  });

  factory monthtop.fromJson(Map<String, dynamic> json) {
    return monthtop(
      quantity: json['quantity'],
      name: json['name'],
      // Parse the string as a DateTime
    );
  }



}


class expired {
  int? daysLeft;

  String? name;


  expired({
    this.daysLeft,
    this.name,


  });

  factory expired.fromJson(Map<String, dynamic> json) {
    return expired(
      daysLeft: json['daysLeft'],
      name: json['name'],
      // Parse the string as a DateTime
    );
  }



}
