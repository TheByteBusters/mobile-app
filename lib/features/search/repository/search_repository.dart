import 'package:http/http.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/networking/http_search.dart';
import 'package:mobile_app/features/search/models/location.dart';

class HttpSearchRepository {
  static Future<Response> getHospital(int searchAttempt) async {
    final double lat = AuthCache.getCacheData('latitude') ?? 1.01;
    final double lng = AuthCache.getCacheData('longitude') ?? 1.01;
    final double acc = AuthCache.getCacheData('accuracy') ?? 1.01;

    print("lat: $lat, lng: $lng, acc: $acc");

    final location = LocationModel(
      lat: lat,
      lng: lng,
      acc: acc,
    );

    final response = await HttpSearch.getHospital(location, searchAttempt);

    return response;
  }
}
