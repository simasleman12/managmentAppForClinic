
class Prescription {
  String? medication;
  String? dosage;
  String? frequency;
  String? duration;

  Prescription({
    this.medication,
    this.dosage,
    this.frequency,
    this.duration,
  });

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
      medication: json['medication'],
      dosage: json['dosage'],
      frequency: json['frequency'],
      duration: json['duration'],

    );
  }
}



class equipet {
  String? equipment_id;
  String? quantity;


  equipet({
    this.equipment_id,
    this.quantity,

  });

  factory equipet.fromJson(Map<String, dynamic> json) {
    return equipet(
      equipment_id: json['equipment_id'],
      quantity: json['quantity'],

    );
  }
}
