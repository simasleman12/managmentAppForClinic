class LogEntry {
     String? userFullName;
    String? message;
    DateTime? createdAt;

  LogEntry({

      this.userFullName,

      this.message,
      this.createdAt,
  });

  factory LogEntry.fromJson(Map<String, dynamic> json) {
    return LogEntry(

      userFullName: json['user_name'] ,

      message: json['message'] ,
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
