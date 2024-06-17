import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/features/auth/repository/user_repository.dart';

enum AuthState {
  init,
  validating,
  valid,
  signedIn,
  loggedOut,
}

enum Role { parent, staff }

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState.init);
  Role role = Role.parent;
  String email = '';
  String password = '';
  String fullName = '';
  String birthDate = '';
  String country = '';
  String phoneNumber = '';
  double? lng;
  double? lat;
  double? acc;
  BuildContext? ctx;

  void pickDate() {}

  void printAttributes() {
    print(email);
    print(password);
    print(birthDate);
    print(fullName);
    print(country);
    print(phoneNumber);
    print(lng);
    print(lat);
    print(acc);
  }

  Future<void> signupParent() async {
    state = AuthState.validating;
    http.Response response = await HttpAuthUserRepository.signupUser(
      email: email,
      password: password,
      fullName: fullName,
      birthDate: birthDate,
      country: country,
      phoneNumber: phoneNumber,
      lng: lng!,
      lat: lat!,
      acc: acc!,
    );

    if (response.statusCode != 200) {
      print('error resopnse: ${response.statusCode}');
    }

    String token = HttpAuthUserRepository.getToken(response);
    await AuthCache.insert('token', token);
    await AuthCache.insert('name', fullName);
    await AuthCache.insert('email', email);
    await AuthCache.insert('password', password);
    // await AuthCache.insert('birth_date', birthDate);
    await AuthCache.insert('city', country);
    await AuthCache.insert('phone_number', phoneNumber);
    await AuthCache.insert('lng', lng.toString());
    await AuthCache.insert('lat', lat.toString());
    await AuthCache.insert('acc', acc.toString());


    state = AuthState.signedIn;
    ctx!.pushReplacementNamed(Routes.homeScreen);
  }

  Future<void> loginParent() async {
    state = AuthState.validating;
    http.Response response = await HttpAuthUserRepository.loginUser(
      email,
      password,
    );

    print("login response: ${response.body}");

    if (response.statusCode != 200) {
      return;
    }

    String token = HttpAuthUserRepository.getToken(response);
    await AuthCache.insert('token', token);
    print('token: $token');

    state = AuthState.signedIn;
    ctx!.pushReplacementNamed(Routes.homeScreen);
  }

  Future<void> checkCache() async {
    AuthCache.getCacheData('token');
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);
