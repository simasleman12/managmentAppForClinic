import 'dart:ffi';

class MenuItemQuantity {
  String? appointmentId;
  String? doctorName;
  String? patientId;
  String? patientName;
  bool? patientRegistered;
  String? caseName;
  String? startTime;
  String? endTime;
  String? state;

  MenuItemQuantity({
      this.appointmentId,
      this.doctorName,
      this.patientId,
      this.patientName,
      this.patientRegistered,
      this.caseName,
      this.startTime,
      this.endTime,
      this.state,
   });

  factory MenuItemQuantity.fromJson(Map<String, dynamic> json) {
    return MenuItemQuantity(
      appointmentId: json['appointment_id'],
      doctorName: json['doctor_name'],
      patientId: json['patient_id'],
      patientName: json['patient_name'],
      patientRegistered: json['patient_registered'],
      caseName: json['case_name'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      state: json['state'],
     );
  }
}

class Orderq {
  int? date;
  String? day;
  List<MenuItemQuantity>? menuItemQuantities;

    Orderq({
      this.date,
      this.day,
       this.menuItemQuantities,
  });

  factory Orderq.fromJson(Map<String, dynamic> json) {
    final List<dynamic> menuItemQuantitiesJson = json['appointments'];
    final List<MenuItemQuantity> menuItemQuantities =
    menuItemQuantitiesJson.map((item) => MenuItemQuantity.fromJson(item)).toList();

    return Orderq(
      date: json['date'],
      day: json['day'],
      menuItemQuantities: menuItemQuantities,
    );
  }
}


class Patient {
  int patientId;
  String patientName;
  String phoneNumber;
  String email;
  String addressLineOne;
  String addressLineTwo;
  String country;
  String gender;
  String medicalDisease;
  String medicalAllergic;
  String oralHabits;
  bool sugarFood;
  bool tobacco;
  bool alcohol;
  double loan;
  String birthday;
  List<Treatment> treatments;

  Patient({
    required this.patientId,
    required this.patientName,
    required this.phoneNumber,
    required this.email,
    required this.addressLineOne,
    required this.addressLineTwo,
    required this.country,
    required this.gender,
    required this.medicalDisease,
    required this.medicalAllergic,
    required this.oralHabits,
    required this.sugarFood,
    required this.tobacco,
    required this.alcohol,
    required this.loan,
    required this.birthday,
    required this.treatments,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    List<dynamic> treatmentList = json['treatments'];
    List<Treatment> treatments = treatmentList
        .map((treatmentJson) => Treatment.fromJson(treatmentJson))
        .toList();

    return Patient(
      patientId: json['patient_id'],
      patientName: json['patient_name'],
      phoneNumber: json['phone_number'],
      email: json['email'] as String? ?? '',
      addressLineOne: json['address_line_one'],
      addressLineTwo: json['address_line_two'] as String? ?? '',
      country: json['country'],
      gender: json['gender'],
      medicalDisease: json['medical_disease'] as String? ?? '',
      medicalAllergic: json['medical_allergic'] as String? ?? '',
      oralHabits: json['oral_habits'] as String? ?? '',
      sugarFood: json['sugar_food']as bool? ?? false,
      tobacco: json['tobacco']as bool? ?? false,
      alcohol: json['alcohol']as bool? ?? false,
      loan: json['loan'].toDouble(),
      birthday: json['birthday'],
      treatments: treatments,
    );
  }
}

class Treatment {
  double totalAmount;
  double paidAmount;
  double loanAmount;
  String caseName;
  int treatment_id;

  Treatment({
    required this.totalAmount,
    required this.paidAmount,
    required this.loanAmount,
    required this.caseName,
    required this.treatment_id,

  });

  factory Treatment.fromJson(Map<String, dynamic> json) {
    return Treatment(
      totalAmount: json['total_amount'].toDouble(),
      paidAmount: json['paid_amount'].toDouble(),
      loanAmount: json['loan_amout'].toDouble(),
      caseName: json['case_name'],
      treatment_id: json['treatment_id'],

    );
  }
}

class Quest {
  String amount;
  String date;

  Quest({
    required this.amount,
    required this.date,
  });

  factory Quest.fromJson(Map<String, dynamic> json) {
    return Quest(
      amount: json['question'] ,
      date: json['answer'],
    );
  }
}


class Prescriptiona {
  int amount;
  String date;

  Prescriptiona({
    required this.amount,
    required this.date,
  });

  factory Prescriptiona.fromJson(Map<String, dynamic> json) {
    return Prescriptiona(
      amount: json['prescription_id'] ,
      date: json['date'],
    );
  }
}

class Images {
  String image_url;

  Images({
    required this.image_url,
   });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      image_url: json['image_url'] ,
     );
  }
}


class Treatments {
    int treatmentId;
    int totalAmount;
    int paidAmount;
    int loanAmount;
    String note;
    String doctorName;
    String caseName;
    List<Payment> payments;
    List<Tooth> teeth;

  Treatments({
    required this.treatmentId,
    required this.totalAmount,
    required this.paidAmount,
    required this.loanAmount,
    required this.note,
    required this.doctorName,
    required this.caseName,
    required this.payments,
    required this.teeth,
  });

  factory Treatments.fromJson(Map<String, dynamic> json) {
    // Parse payments list
    final List<dynamic> paymentsList = json['payments'];
    final List<Payment> parsedPayments = paymentsList
        .map((paymentJson) => Payment.fromJson(paymentJson))
        .toList();

    // Parse teeth list
    final List<dynamic> teethList = json['teeth'];
    final List<Tooth> parsedTeeth =
    teethList.map((toothJson) => Tooth.fromJson(toothJson)).toList();

    return Treatments(
      treatmentId: json['treatment_id'],
      totalAmount: json['total_amount']  as int? ?? 0,
      paidAmount: json['paid_amount'] as int? ?? 0,
      loanAmount: json['loan_amount'] as int? ?? 0,
      note: json['note'] as String? ?? '',
      doctorName: json['doctor_name'],
      caseName: json['case_name'],
      payments: parsedPayments,
      teeth: parsedTeeth,
    );
  }
}

class Payment {
    int amount;
    String date;

  Payment({
    required this.amount,
    required this.date,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      amount: json['amount'] ,
      date: json['date'],
    );
  }
}

class Tooth {
    int toothId;
    String note;

  Tooth({
    required this.toothId,
    required this.note,
  });

  factory Tooth.fromJson(Map<String, dynamic> json) {
    return Tooth(
      toothId: json['tooth_id'],
      note: json['note'] as String? ?? '',
    );
  }
}

class Oneprescpection {
  String patientName;
  int patientAge;
  String doctorName;
  // String date;
  String instructionOne;

  List<ListMedications> medications;

  Oneprescpection({
    required this.instructionOne,
    required this.patientName,
    // required this.date,
    required this.patientAge,
    required this.doctorName,
    required this.medications,
  });

  factory Oneprescpection.fromJson(Map<String, dynamic> json) {
    List<dynamic> medicationsList = json['medications'];
    List<ListMedications> medications = medicationsList
        .map((medicationJson) => ListMedications.fromJson(medicationJson))
        .toList();

    return Oneprescpection(
      doctorName: json['doctor_name'] ?? '',
      patientName: json['patient_name'],
      instructionOne: json['instruction_one'],
      // date: json['date'],
      patientAge: json['patient_age'],
      medications: medications,
    );
  }
}

class ListMedications {
  int medicationId;
  int prescriptionId;
  String medication;
  String dosage;
  String frequency;
  String duration;

  ListMedications({
    required this.medicationId,
    required this.prescriptionId,
    required this.medication,
    required this.dosage,
    required this.frequency,
    required this.duration,
  });

  factory ListMedications.fromJson(Map<String, dynamic> json) {
    return ListMedications(
      medicationId: json['medication_id'],
      prescriptionId: json['prescription_id'],
      medication: json['medication'],
      dosage: json['dosage'],
      frequency: json['frequency'],
      duration: json['duration'],
    );
  }
}

class oneEqupment {
  int equipment_used_id;
  String equipment_name;

  oneEqupment({
    required this.equipment_used_id,
    required this.equipment_name,
  });

  factory oneEqupment.fromJson(Map<String, dynamic> json) {
    return oneEqupment(
      equipment_used_id: json['equipment_used_id'],
      equipment_name: json['equipment_name'] as String? ?? '',
    );
  }
}

class oneEqupmentpp {
  double? price;
  String? equipment_name;
  String? doctor_name;
  String? patient_name;
  int? quantity;

  oneEqupmentpp({
    required this.price,
    required this.equipment_name,
    required this.doctor_name,
    required this.patient_name,
    required this.quantity,
  });


  factory oneEqupmentpp.fromJson(Map<String, dynamic> json) {
    return oneEqupmentpp(
      quantity: json['quantity'] ,
      equipment_name: json['equipment_name'],
      doctor_name: json['doctor_name'],
      patient_name: json['patient_name'],
      price: json['price'].toDouble(),
    );
  }
}

class report {
  double total_paid;
  double total_appointment;
  double total_equipment_used;
  double total_loan;

  List<months> monthlyReport;

  report({
    required this.monthlyReport,
    required this.total_loan,
    required this.total_equipment_used,
    required this.total_appointment,
    required this.total_paid,

  });

  factory report.fromJson(Map<String, dynamic> json) {
    List<dynamic> treatmentList = json['monthlyReport'];
    List<months> treatments = treatmentList
        .map((treatmentJson) => months.fromJson(treatmentJson))
        .toList();

    return report(
      total_paid: json['total_paid'].toDouble(),
      total_appointment: json['total_appointment'].toDouble(),
      total_equipment_used: json['total_equipment_used'].toDouble(),
      total_loan: json['total_loan'].toDouble(),

      monthlyReport: treatments,
    );
  }
}

class months {
  double total_amount;

  String month;

  months({
    required this.total_amount,

    required this.month,

  });

  factory months.fromJson(Map<String, dynamic> json) {
    return months(
      total_amount: json['total_amount'].toDouble(),
      month: json['month'],

    );
  }
}