class menuitem {
  int? id;
  String? name;
  int? categoryId;
  int? price;
   String? image;
  bool? status;
  String? note;
  DateTime? createdAt;

  menuitem({
    this.id,
    this.name,
    this.categoryId,
    this.price,
     this.image,
    this.status,
    this.note,
    this.createdAt,
  });

  factory menuitem.fromJson(Map<String, dynamic> json) {
    return menuitem(
      id: json['id'],
      name: json['name'],
      categoryId: json['categoryId'],
      price: json['price'],
       image: json['image'],
      status: json['status'],
        note: json['note'],
      createdAt: DateTime.parse(json['createdAt']), // Parse the string as a DateTime
    );
  }








}
