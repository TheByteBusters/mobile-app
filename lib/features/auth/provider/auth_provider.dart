import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/core/networking/mqtt.dart';
import 'package:mqtt_client/mqtt_client.dart';

class AuthNotifier extends StateNotifier<String> {
  AuthNotifier() : super('init');
  var email = '';
  var password = '';
  var repeatedPassword = '';
  var fullName = '';
  var birthDate = '';
  var country = '';
  var phoneNumber = '';

  String? validateFullName(String? value) {
    if (value == '' || value == null) {
      return 'must provide your full name';
    }
    print('$value is validated');

    RegExp regExp = RegExp(r'[أ-ي a-zA-z]');
    var match = regExp.allMatches(value);

    if (match.length == value.length) {
      return 'your full name must contain alphabetical letters only';
    }

    return null;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, String>(
  (ref) => AuthNotifier(),
);
