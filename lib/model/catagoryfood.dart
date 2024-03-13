class catagoryfood {
  int? id;
  String? name;
   DateTime? createdAt;

  catagoryfood({
    this.id,
    this.name,

    this.createdAt,
  });

  factory catagoryfood.fromJson(Map<String, dynamic> json) {
    return catagoryfood(
      id: json['id'],
      name: json['name'],
       createdAt: DateTime.parse(json['createdAt']), // Parse the string as a DateTime
    );
  }








  }


class catagoryfoodsubOne {
  int? id;
  String? name;

  catagoryfoodsubOne({
    this.id,
    this.name,

   });

  factory catagoryfoodsubOne.fromJson(Map<String, dynamic> json) {
    return catagoryfoodsubOne(
      id: json['id'],
      name: json['name'],
     );
  }}

class catagoryfoodsub {
  int? id;
  String? name;
  DateTime? createdAt;

  catagoryfoodsub({
    this.id,
    this.name,

    this.createdAt,
  });

  factory catagoryfoodsub.fromJson(Map<String, dynamic> json) {
    return catagoryfoodsub(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']), // Parse the string as a DateTime
    );
  }}