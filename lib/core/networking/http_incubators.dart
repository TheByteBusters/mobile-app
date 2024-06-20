import 'package:http/http.dart' as http;

class HttpIncubators {
  const HttpIncubators();

  static const _urlAddress = 'backend-2-0-jftw.onrender.com';

  static Future<http.Response> getIncubators(String token) async {
    const String path = 'incubators';
    final url = Uri.https(_urlAddress, path);

    print('getting incubators');
    final http.Response response = await http.get(
      url,
      headers: {'Content-Type': 'application/json', 'Authorization': token},
    );
    print(response.body);

    return response;
  }
}
