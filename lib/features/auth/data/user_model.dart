enum Role { parent, doctor }

class UserModel {
  UserModel({
    this.id,
    required this.role,
    required this.email,
    required this.password,
    required this.displayName,
  });

  final String? id;
  final Role role;
  final String email;
  final String password;
  final String displayName;
}
