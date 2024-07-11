import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/networking/http_reservation.dart';
import 'package:mobile_app/features/auth/models/reservation_model.dart';

class ReservationRepository {
  static Future<Response> requestReservation(ReservationModel reservation) async {
    print('entered reservation repo');

    final json = jsonEncode(reservation.toMap());
    final String token = AuthCache.getCacheData('token');
    
    return await HttpReservation.sendReservationRequest(json, token);
  }

}
