class Allorder {
  int? id;
  String? status;
  int? totalPrice;
  bool? paymentStatus;
  bool? paymentLoan;
  bool? returned;
  bool? showHistory;
  String? notification;
  int? tableId;
  int? customerId;
  int? userId;
  String? note;
  DateTime? createdAt;

  Allorder({
    this.id,
    this.status,
    this.note,
    this.totalPrice,
    this.paymentStatus,
    this.paymentLoan,
    this.returned,
    this.showHistory,
    this.notification,
    this.createdAt,
    this.userId,
    this.tableId,
    this.customerId,
  });

  factory Allorder.fromJson(Map<String, dynamic> json) {
    return Allorder(
      id: json['id'],
      status: json['status'],
      note: json['note'],
      totalPrice: json['totalPrice'],
      paymentStatus: json['paymentStatus'],
      paymentLoan: json['paymentLoan'],
      returned: json['returned'],
      showHistory: json['showHistory'],
      notification: json['notification'],
      tableId: json['tableId'],
      customerId: json['customerId'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']), // Parse the string as a DateTime
    );
  }
}
