import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class HTTPAuth {
  const HTTPAuth();

  static const _urlAddress = 'backend-2-0-jftw.onrender.com';

  static Future<void> loginUser() async {
    // var dio = Dio();
    // dio.options.headers['Content-Type'] = 'application/json';
    const path = 'incubators?latitude=31.41&longitude=31.81&page=0';
    final url = Uri.https(_urlAddress, path);
    final client = http.Client();

    print('connecting...');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    ).then((response) {
      client.close();
      if (response.statusCode == 200) {
        //enter your code for change state
        print('done');
      } else {
        print(response.body);
      }
    }).catchError((onError) {
      client.close();
      print("Error: $onError");
    });

    return;
  }

  static Future<http.Response> deleteItem(String id) async {
    final path = 'shopping-list-app/$id.json';
    final url = Uri.https(_urlAddress, path);

    final response = http.delete(url);

    return response;
  }
}
