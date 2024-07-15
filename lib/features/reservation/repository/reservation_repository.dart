import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/networking/http_reservation.dart';
import 'package:mobile_app/features/auth/models/reservation_model.dart';

class ReservationRepository {
  static Future<Response> requestReservation(
      ReservationModel reservation) async {
    print('entered reservation repo');

    final json = jsonEncode(reservation.toMap());
    final String token = AuthCache.getCacheData('token');

    return await HttpReservation.sendReservationRequest(json, token);
  }

  static Future<List<ReservationModel>> loadReservations() async {
    final token = AuthCache.getCacheData('token');
    final response = await HttpReservation.getHospitalReservations(token);

    final json = jsonDecode(response.body);
    final List<ReservationModel> reservationsList = [];
    for (final reservation in json['hospitalReservations']) {
      reservationsList.add(ReservationModel.fromJson(reservation));
    }

    return reservationsList;
  }

  static Future<Response> acceptReservation(String id) async {
    final token = AuthCache.getCacheData('token');
    final json = jsonEncode({"status": "confirmed"});
    final response =
        await HttpReservation.updateReservationState(json, token, id);

    return response;
  }

  static Future<Response> rejectReservation(String id) async {
    final token = AuthCache.getCacheData('token');
    final json = jsonEncode({"status": "cancelled"});
    final response =
        await HttpReservation.updateReservationState(json, token, id);

    return response;
  }
}
