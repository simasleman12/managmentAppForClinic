class quatity {
  int? id;
  String? type;
  String? note;

  DateTime? createdAt;

  quatity({
    this.id,
    this.type,
    this.note,

    this.createdAt,
  });

  factory quatity.fromJson(Map<String, dynamic> json) {
    return quatity(
      id: json['id'],
      type: json['type'],
      note: json['note'],

      createdAt: DateTime.parse(json['createdAt']), // Parse the string as a DateTime
    );
  }








}
