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
  invalid,
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
      print('not valid babe');
      state = AuthState.invalid;
      print('error resopnse: ${response.body}');
      return;
    }

    String token = HttpAuthUserRepository.getToken(response);
    await AuthCache.insertMap({
      'token': token,
      'name': fullName,
      'email': email,
      'password': password,
      'city': country,
      'phone_number': phoneNumber,
      'lng': lng.toString(),
      'lat': lat.toString(),
      'acc': acc.toString(),
    });

    String userRole = role == Role.parent ? 'parent' : 'staff';
    AuthCache.insertString('role', userRole);

    state = AuthState.signedIn;
    ctx!.pushReplacementNamed(Routes.homeScreen);
  }

  Future<void> loginUser() async {
    state = AuthState.validating;
    print(role);
    http.Response response = role == Role.parent
        ? await HttpAuthUserRepository.loginUser(
            email,
            password,
          )
        : await HttpAuthUserRepository.loginStaff(
            email,
            password,
          );

    print("login response: ${response.body}");

    if (response.statusCode != 200) {
      print('not valid babe');
      state = AuthState.invalid;
      ScaffoldMessenger.of(ctx!).showSnackBar(SnackBar(
        content: Text(HttpAuthUserRepository.getErrorMessage(response)),
      ));
      return;
    }

    String token = HttpAuthUserRepository.getToken(response);

    print('token: $token');

    String userRole = role == Role.parent ? 'parent' : 'staff';
    await AuthCache.insertString('role', userRole);

    role == Role.parent
        ? await HttpAuthUserRepository.storeUserData(token)
        : await HttpAuthUserRepository.storeStaffData(token);

    state = AuthState.signedIn;
    ctx!.pushNamedAndRemoveUntil(
      Routes.homeScreen,
      predicate: (Route<dynamic> route) => false,
    );
  }

  Future<void> checkCache() async {
    AuthCache.getCacheData('token');
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);
