class ReservationModel {
  const ReservationModel({
    required this.id,
    required this.babyGender,
    required this.babyAge,
    required this.status,
    required this.babyName,
    required this.babyWeight,
    required this.birthHospital,
    required this.birthDoctorName,
    required this.birthDoctorPhone,
    required this.hospitalId,
  });

  final num id;
  final String status;
  final String babyName;
  final num babyWeight;
  final String babyGender;
  final num babyAge;
  final String birthHospital;
  final String birthDoctorName;
  final String birthDoctorPhone;
  final num hospitalId;

  factory ReservationModel.fromJson(json) {
    return ReservationModel(
      id: json["id"],
      status: json["status"],
      babyName: json["baby_name"],
      babyWeight: json["baby_weight"],
      babyAge: json["baby_age"],
      babyGender: json["baby_gender"],
      birthHospital: json["birth_hospital"],
      birthDoctorName: json["birth_doctor_name"],
      birthDoctorPhone: json["birth_doctor_phone"],
      hospitalId: json["hospital_id"],
    );
  }

  Map<String, Object> toMap() {
    return {
      "status": status,
      "babyName": babyName,
      "babyWeight": babyWeight,
      "babyAge": babyAge,
      "babyGender": babyGender,
      "birthHospital": birthHospital,
      "birthDoctorName": birthDoctorName,
      "birthDoctorPhone": birthDoctorPhone,
      "hospitalId": hospitalId,
    };
  }
}
