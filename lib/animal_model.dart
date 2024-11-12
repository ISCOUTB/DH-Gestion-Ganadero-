class Animal {
  final String id;
  final String breed;
  final String gender;
  final double weight;
  final String birthDate;
  final bool isYoung;
  final String motherId;
  final String status;
  final bool vaccinated;

  Animal({
    required this.id,
    required this.breed,
    required this.gender,
    required this.weight,
    required this.birthDate,
    required this.isYoung,
    required this.motherId,
    required this.status,
    required this.vaccinated,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'breed': breed,
      'gender': gender,
      'weight': weight,
      'birthDate': birthDate,
      'isYoung': isYoung ? 1 : 0,
      'motherId': motherId,
      'status': status,
      'vaccinationStatus': vaccinated ? 1 : 0,
    };
  }
}