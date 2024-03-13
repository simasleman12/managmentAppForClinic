class catagory {
  int? id;
  String? name;
  String? note;
  DateTime? createdAt;

  catagory({
    this.id,
    this.name,
    this.note,

    this.createdAt,
  });

  factory catagory.fromJson(Map<String, dynamic> json) {
    return catagory(
      id: json['id'],
      name: json['name'],
      note: json['note'],
      createdAt: DateTime.parse(json['createdAt']), // Parse the string as a DateTime
    );
  }








}
