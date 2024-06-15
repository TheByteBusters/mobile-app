import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthState {
  init,
  localValidation,
  remoteValidation,
  complete,
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState.init);
  var email = '';
  var password = '';
  var fullName = '';
  var birthDate = '';
  var country = '';
  var phoneNumber = '';

  void pickDate() {}
  void printAttributes() {
    print(email);
    print(password);
    print(birthDate);
    print(fullName);
    print(country);
    print(phoneNumber);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);
