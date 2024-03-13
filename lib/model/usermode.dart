class User {
    int? id;
    String? firstName;
    String? gender;
    String? age;
    String? password;
    String? phoneNumber;
    String? role;
    // bool? active;
    // DateTime? createdAt;

  User({
      this.id,
      this.firstName,
      this.gender,
      this.age,
      this.password,
      this.phoneNumber,
      this.role,
      // this.active,
      // this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user_id'],
      firstName: json['user_name'],
      gender: json['email'],
      age: json['medical_specialty'],
       phoneNumber: json['phone_number'],
      role: json['user_role'],
      // active: json['active'],
      // createdAt: DateTime.parse(json['createdAt']), // Parse the string as a DateTime
    );
  }








}
class Doctor {
  int? doctor_id;
  String? doctor_name;


  Doctor({
    this.doctor_id,
    this.doctor_name,

    // this.active,
    // this.createdAt,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctor_id: json['doctor_id'],
      doctor_name: json['doctor_name'],

    );
  }








}
class Pateint {
  int? patient_id;
  String? patient_name;


  Pateint({
    this.patient_id,
    this.patient_name,

    // this.active,
    // this.createdAt,
  });

  factory Pateint.fromJson(Map<String, dynamic> json) {
    return Pateint(
      patient_id: json['patient_id'],
      patient_name: json['patient_name'],

    );
  }








}
class Case {
  int? case_id;
  String? case_name;
  Case({
    this.case_id,
    this.case_name,

    // this.active,
    // this.createdAt,
  });

  factory Case.fromJson(Map<String, dynamic> json) {
    return Case(
      case_id: json['case_id'],
      case_name: json['case_name'],

    );
  }








}
class equped {
  int? case_id;
  String? case_name;
  equped({
    this.case_id,
    this.case_name,
  });
  factory equped.fromJson(Map<String, dynamic> json) {
    return equped(
      case_id: json['equipment_id'],
      case_name: json['equipment_name'],

    );
  }








}
