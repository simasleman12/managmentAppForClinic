class notifi {
  int? id;
  String? status;
  int? totalPrice;
  bool? showHistory;
  bool? returned;
  bool? paymentLoan;
  bool? paymentStatus;
  String? notification;
  int?tableId;
  int?customerId;
  int?userId;
  DateTime? createdAt;

  notifi({
    this.id,
    this.totalPrice,
    this.showHistory,
    this.returned,
    this.paymentLoan,
    this.paymentStatus,
    this.status,
    this.notification,
    this.tableId,
    this.customerId,
    this.userId,
    this.createdAt,
  });

  factory notifi.fromJson(Map<String, dynamic> json) {
    return notifi(
      id: json['id'],
      totalPrice: json['totalPrice'],
      showHistory: json['showHistory'],
      returned: json['returned'],
      paymentLoan: json['paymentLoan'],
      paymentStatus: json['paymentStatus'],
      status: json['status'],

      notification: json['notification'],
      tableId: json['tableId'],
      customerId: json['customerId'],
      userId: json['userId'],

      createdAt: DateTime.parse(json['createdAt']), // Parse the string as a DateTime
    );
  }








}