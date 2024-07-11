import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/core/networking/websocket_reservation.dart';
import 'package:mobile_app/features/auth/models/reservation_model.dart';

enum ReservationsListState {
  init,
  loading,
  received,
}

class ReservationsNotifier extends StateNotifier<List<ReservationModel>> {
  ReservationsNotifier() : super([]);

  final listState = ReservationsListState.init;

  void listenToReservations() {
    channel.stream.listen((message) {
      try {
        print(message);

        final json = jsonDecode(message);
        if (json['type'] == 'newReservation') {
          state.add(ReservationModel.fromJson(json));
        }
      } catch (e) {
        print('messqage: $message');
        print("not a message");
      }
    });
  }

  void loadReservations() {}
}

final reservationsProvider =
    StateNotifierProvider<ReservationsNotifier, List<ReservationModel>>(
  (ref) => ReservationsNotifier(),
);
