import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/core/networking/websocket_reservation.dart';
import 'package:mobile_app/features/auth/models/reservation_model.dart';
import 'package:mobile_app/features/reservation/repository/reservation_repository.dart';

enum ReservationsListState {
  init,
  loading,
  received,
}

class ReservationsNotifier extends StateNotifier<List<ReservationModel>> {
  ReservationsNotifier() : super([]) {
    loadReservations();
    listenToReservations();
  }

  final listState = ReservationsListState.init;

  void listenToReservations() {
    channel.stream.listen((message) {
      print(message);

      final json = jsonDecode(message);
      if (json['type'] == 'newReservation') {
        print("===========================\ntrying to accesss reservation");
        print('reservation: ${json['reservation']}');
        state = [...state, ReservationModel.fromJson(json['reservation'])];
      }
    });
  }

  void loadReservations() async {
    final storedReservations = await ReservationRepository.loadReservations();

    state = [...state, ...storedReservations];
  }
}

final reservationsProvider =
    StateNotifierProvider<ReservationsNotifier, List<ReservationModel>>(
  (ref) => ReservationsNotifier(),
);
