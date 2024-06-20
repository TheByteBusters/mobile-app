import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/networking/http_incubators.dart';
import 'package:mobile_app/features/incubators_screen/model/incubator_model.dart';

class IncubatorsRepository {
  static Future<http.Response> getIncubators() async {
    final String token = AuthCache.getCacheData('token');
    final http.Response response = await HttpIncubators.getIncubators(token);

    return response;
  }

  static List<Incubator> parseResponse(String responseBody) {
    final data = jsonDecode(responseBody);
    final List<Incubator> incubators = [];

    print(data);

    for (Object incubator in data['hospitalIncubators']) {
      print(incubator);
      incubators.add(Incubator.fromJson(incubator));
    }

    return incubators;
  }
}
