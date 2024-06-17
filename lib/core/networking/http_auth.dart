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
    final response = await http.post(
      url,
      headers: _header,
      body: json,
    );
    print('server responded');

    return response;
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
}
