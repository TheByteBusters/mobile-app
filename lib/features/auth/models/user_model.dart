class UserModel {
  UserModel({
    required this.email,
    required this.password,
    required this.fullName,
    required this.birthDate,
    required this.country,
    required this.phoneNumber,
    required this.lng,
    required this.lat,
    required this.acc,
  });

  final String email;
  final String password;
  final String fullName;
  final String birthDate;
  final String country;
  final String phoneNumber;
  final double lng;
  final double lat;
  final double acc;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      fullName: json['fullName'],
      birthDate: '20/2/2002',
      country: json['country'],
      phoneNumber: json['phoneNumber'],
      lng: json['lng'],
      lat: json['lat'],
      acc: json['acc'],
    );
  }

  Map<String, Object> toMap() {
    Map<String, Object> map = {
      'email': email,
      'password': password,
      'name': fullName,
      // 'birthDate': birthDate,
      'city': country,
      'address': country,
      'phoneNumber': phoneNumber,
      'longitude': lng,
      'latitude': lat,
      'accuracy': acc,
      'nationalId': '30203030350529'
    };

    return map;
  }
}
