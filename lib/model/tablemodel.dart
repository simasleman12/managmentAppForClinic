class table {
  int? id;
  int? tableNumber;
  String? status;
   String? note;

  DateTime? createdAt;

  table({
    this.id,
    this.tableNumber,
    this.status,
    this.note,


    this.createdAt,
  });

  factory table.fromJson(Map<String, dynamic> json) {
    return table(
      id: json['id'],
      tableNumber: json['tableNumber'],
      status: json['status'],
      note: json['note'],

      createdAt: DateTime.parse(json['createdAt']), // Parse the string as a DateTime
    );
  }








}
