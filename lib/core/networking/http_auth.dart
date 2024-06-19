import 'dart:convert';

import 'package:http/http.dart' as http;

class HTTPAuth {
  const HTTPAuth();

  static const _urlAddress = 'backend-2-0-jftw.onrender.com';
  static const _header = {'Content-Type': 'application/json'};

  static Future<http.Response> signupUser(String json) async {
    const path = 'user/signup';
    final url = Uri.https(_urlAddress, path);

    final response = await http.post(
      url,
      headers: _header,
      body: json,
    );

    return response;
  }

  static Future<http.Response> loginUser(String json) async {
    const path = 'user/login';
    final url = Uri.https(_urlAddress, path);

    print('sent to server');
    try {
      final response = await http.post(
        url,
        headers: _header,
        body: json,
      );

      print('server responded');
      return response;
    } catch (e) {
      print('the problem is: $e');
      final errorMessage = jsonEncode({
        'error': {'message': 'server timedout, please try again!'}
      });

      return http.Response(errorMessage, 400);
    }
  }

  static Future<http.Response> loginStaff(String json) async {
    const path = 'staff/login';
    final url = Uri.https(_urlAddress, path);

    print('sent to server');
    print(json);

    try {
      final response = await http.post(
        url,
        headers: _header,
        body: json,
      );

      print('server responded');
      return response;
    } catch (e) {
      print('the problem is: $e');
      final errorMessage = jsonEncode({
        'error': {'message': 'server timedout, please try again!'}
      });

      return http.Response(errorMessage, 400);
    }
  }

  static Future<http.Response> getUserData(String token) async {
    const path = 'user';
    final url = Uri.https(_urlAddress, path);
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json', 'Authorization': token},
    );

    return response;
  }

  static Future<http.Response> getStaffData(String token) async {
    const path = 'staff/member';
    final url = Uri.https(_urlAddress, path);
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json', 'Authorization': token},
    );

    return response;
  }
}
