import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/networking/websocket_reservation.dart';

enum ProgressState {
  loading,
  noRequest,
  sent,
  pending,
  accepted,
  connected,
  cancelled,
  failed,
}

class ProgressNotifier extends StateNotifier<ProgressState> {
  ProgressNotifier() : super(ProgressState.loading) {
    updateReservationState();
    listenToReservationStatus();
  }

  void updateReservationState() {
    final localStatus = AuthCache.getCacheData('reservationStatus');

    if (localStatus == null) {
      state = ProgressState.noRequest;
    } else if (localStatus == ProgressState.sent.name) {
      state = ProgressState.sent;
    } else if (localStatus == ProgressState.pending.name) {
      state = ProgressState.pending;
    } else if (localStatus == ProgressState.accepted.name) {
      state = ProgressState.connected;
    } else if (localStatus == ProgressState.failed.name) {
      state = ProgressState.failed;
    } else if (localStatus == ProgressState.cancelled.name) {
      state = ProgressState.cancelled;
    }
  }

  void listenToReservationStatus() {
    channel.stream.listen((message) {
      print(message);

      final json = jsonDecode(message);
      if (json['type'] == 'updateReservation') {
        print("===========================\nprogress:");
        print('reservation status: ${json['status']}');
        print("===========================");
        switch (json['status']) {
          case "confirmed":
            state = ProgressState.connected;
            AuthCache.insertString(
              'reservationStatus',
              ProgressState.accepted.name,
            );
          case "cancelled":
            state = ProgressState.cancelled;
            AuthCache.insertString(
              'reservationStatus',
              ProgressState.cancelled.name,
            );
          default:
            state = ProgressState.failed;
            AuthCache.insertString(
              'reservationStatus',
              ProgressState.cancelled.name,
            );
        }
      }
    });
  }
}

final progressProvider = StateNotifierProvider<ProgressNotifier, ProgressState>(
  (ref) => ProgressNotifier(),
);
