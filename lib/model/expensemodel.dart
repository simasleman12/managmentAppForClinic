class expense {
  int? finance_id;
  String? finance_type;
  String? financeType;
  String? subject;
  int? amount;
  expense({
    this.finance_id,
    this.finance_type,
    this.financeType,
    this.subject,
    this.amount,
   });

  factory expense.fromJson(Map<String, dynamic> json) {
    return expense(
      finance_id: json['finance_id'],
      finance_type: json['finance_type'],
      financeType: json['financeType'],
      subject: json['subject'],
      amount: json['amount'],
     );
  }








}
