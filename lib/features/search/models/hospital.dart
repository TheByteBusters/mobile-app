class Hospital {
  final int id;
  final String name;
  final String address;
  final String city;
  final String type;
  final String phoneNumber;

  const Hospital({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.type,
    required this.phoneNumber,
  });

  factory Hospital.fromJson(json) {
    return Hospital(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      city: json['city'],
      type: json['type'],
      phoneNumber: json['phone_number'],
    );
  }

  Map<String, Object> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'city': city,
      'type': type,
      'phone_number': phoneNumber,
    };
  }
}
