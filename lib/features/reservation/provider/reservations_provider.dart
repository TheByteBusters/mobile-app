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
  ReservationsNotifier()
      : super([
          const ReservationModel(
            id: 0,
            babyGender: 'male',
            babyAge: 5,
            status: 'pending',
            babyName: 'ziad',
            babyWeight: 8,
            birthHospital: 'Alaasar',
            birthDoctorName: 'the doctor',
            birthDoctorPhone: '01060719095',
            hospitalId: 7,
            createdAt: '2024-7-15 20:5:30',
          )
        ]) {
    loadReservations();
    listenToReservations();
  }

  var detailsIndex = 0;
  final listState = ReservationsListState.init;

  void listenToReservations() {
    channel.stream.listen(
      (message) {
        print(message);

        final json = jsonDecode(message);
        if (json['type'] == 'newReservation') {
          print("===========================\ntrying to accesss reservation");
          print('reservation: ${json['reservation']}');
          state = [...state, ReservationModel.fromJson(json['reservation'])];
        }
      },
    );
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
