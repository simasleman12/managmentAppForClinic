class deposit {
  int? finance_id;
  String? finance_type;
  String? financeType;
  String? subject;
  int? amount;
  deposit({
    this.finance_id,
    this.finance_type,
    this.financeType,
    this.subject,
    this.amount,
  });

  factory deposit.fromJson(Map<String, dynamic> json) {
    return deposit(
      finance_id: json['finance_id'],
      finance_type: json['finance_type'],
      financeType: json['financeType'],
      subject: json['subject'],
      amount: json['amount'],
    );
  }

}
