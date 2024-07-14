import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/features/reservation/repository/reservation_repository.dart';

enum ReservationUpdateState {
  pending,
  loading,
  failed,
  success,
}

class ReservationDetailsNotifier extends StateNotifier<ReservationUpdateState> {
  ReservationDetailsNotifier() : super(ReservationUpdateState.pending);

  BuildContext? context;

  void acceptReservation(String id) async {
    state = ReservationUpdateState.loading;
    final response = await ReservationRepository.acceptReservation(id);

    if (response.statusCode == 200) {
      await context!.router.maybePop();
      state = ReservationUpdateState.success;
    } else {
      state = ReservationUpdateState.failed;
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text('faild! please try again'),
        ),
      );
    }

    print('response from repository: ${response.body}');
  }

  void rejectReservation(String id) async {
    state = ReservationUpdateState.loading;
    final response = await ReservationRepository.rejectReservation(id);

    if (response.statusCode == 200) {
      await context!.router.maybePop();
      await Future.delayed(const Duration(milliseconds: 50));
      state = ReservationUpdateState.success;
    } else {
      state = ReservationUpdateState.failed;
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text('faild! please try again'),
        ),
      );
    }
  }
}

final reservationDetailsProvider =
    StateNotifierProvider<ReservationDetailsNotifier, ReservationUpdateState>(
  (ref) => ReservationDetailsNotifier(),
);
