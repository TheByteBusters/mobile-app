class Incubator {
  final int id;
  final String name;
  final String type;
  final int rentPerDay;
  String status;

  Incubator({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    required this.rentPerDay,
  });

  factory Incubator.fromJson(json) {
    return Incubator(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      status: json['status'],
      rentPerDay: json['rent_per_day'],
    );
  }

  void switchState() {
    if (status == 'reserved') {
      status = 'available';
    } else {
      status = 'reserved';
    }
  }
}
