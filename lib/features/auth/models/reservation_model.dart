class ReservationModel {
  const ReservationModel(
  {
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
      status: json["status"],
      babyName: json["babyName"],
      babyWeight: json["babyWeight"],
      babyAge: json["babyAge"],
      babyGender: json["babyGender"],
      birthHospital: json["birthHospital"],
      birthDoctorName: json["birthDoctorName"],
      birthDoctorPhone: json["birthDoctorPhone"],
      hospitalId: json["hospitalId"],
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
