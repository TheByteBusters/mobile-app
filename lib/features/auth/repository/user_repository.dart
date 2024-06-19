import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/networking/http_auth.dart';
import 'package:mobile_app/features/auth/models/user_model.dart';

class HttpAuthUserRepository {
  static Future<http.Response> signupUser({
    required String email,
    required String password,
    required String fullName,
    required String birthDate,
    required String country,
    required String phoneNumber,
    required double lat,
    required double lng,
    required double acc,
  }) async {
    UserModel user = UserModel(
      email: email,
      password: password,
      fullName: fullName,
      birthDate: birthDate,
      country: country,
      phoneNumber: phoneNumber,
      lat: lat,
      lng: lng,
      acc: acc,
    );

    String json = jsonEncode(user.toMap());
    dynamic response = await HTTPAuth.signupUser(json);

    return response;
  }

  static String getToken(http.Response response) {
    return jsonDecode(response.body)['authorizationToken'];
  }

  static String getErrorMessage(http.Response errorResponse) {
    return jsonDecode(errorResponse.body)['error']['message'];
  }

  static Future<http.Response> loginUser(String email, String password) async {
    String json = jsonEncode({
      'email': email,
      'password': password,
    });
    dynamic response = await HTTPAuth.loginUser(json);

    return response;
  }

  static storeUserData(String token) async {
    http.Response response = await HTTPAuth.getUserData(token);
    dynamic data = jsonDecode(response.body);
    print(response.body);
    AuthCache.insertString('token', token);
    AuthCache.insertMap(data);
  }
}
