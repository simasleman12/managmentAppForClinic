 class withdraw {
  int? finance_id;
  String? finance_type;
  String? financeType;
  String? subject;
  int? amount;
  withdraw({
    this.finance_id,
    this.finance_type,
    this.financeType,
    this.subject,
    this.amount,
  });

  factory withdraw.fromJson(Map<String, dynamic> json) {
    return withdraw(
      finance_id: json['finance_id'],
      finance_type: json['finance_type'],
      financeType: json['financeType'],
      subject: json['subject'],
      amount: json['amount'],
    );
  }}