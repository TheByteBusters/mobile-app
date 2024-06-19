import 'package:http/http.dart' as http;
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/features/search/models/location.dart';

class HttpSearch {
  static const _urlAddress = 'backend-2-0-jftw.onrender.com';
  // static const _header = {'Content-Type': 'application/json'};

  static Future<http.Response> getHospital(
      LocationModel location, int searchAttempt) async {
    final token = AuthCache.getCacheData('token');
    final url =
        'https://$_urlAddress/hospitals?latitude=${location.lat}&longitude=${location.lat}&page=$searchAttempt';
    // final url = Uri.https(query);

    print(url);
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': token},
    );

    print(response.body);
    return response;
  }
}
