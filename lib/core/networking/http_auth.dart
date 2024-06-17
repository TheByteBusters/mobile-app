import 'package:http/http.dart' as http;

class HTTPAuth {
  const HTTPAuth();

  static const _urlAddress = 'backend-2-0-jftw.onrender.com';
  static const _header = {'Content-Type': 'application/json'};

  static Future<http.Response> signupUser(String json) async {
    const path = 'users/auth/signup';
    final url = Uri.https(_urlAddress, path);

    final response = await http.post(
      url,
      headers: _header,
      body: json,
    );

    return response;
  }

  static Future<http.Response> loginUser(String json) async {
    const path = 'users/auth/login';
    final url = Uri.https(_urlAddress, path);

    final response = await http.post(
      url,
      headers: _header,
      body: json,
    );

    return response;
  }
}
