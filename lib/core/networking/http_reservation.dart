import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpReservation {
  static const _urlAddress = 'backend-2-0-jftw.onrender.com';
  // static const _header = {'Content-Type': 'application/json'};

  static Future<Response> sendReservationRequest(
      String json, String token) async {
    const path = '/reservations';
    final url = Uri.https(_urlAddress, path);

    print('sending reservation');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
      },
      body: json,
    );

    print('reservation sent');
    print('reservation response: ${response.body}');

    return response;
  }

  static Future<Response> getHospitalReservations(token) async {
    const String path = 'hospital/reservations';
    final url = Uri.https(_urlAddress, path);

    print('getting incubators');
    final http.Response response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
      },
    );
    print(response.body);

    return response;
  }
}
