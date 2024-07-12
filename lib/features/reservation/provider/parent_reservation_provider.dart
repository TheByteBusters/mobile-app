import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/core/routing/app_router.dart';
import 'package:mobile_app/features/auth/models/reservation_model.dart';
import 'package:mobile_app/features/reservation/repository/reservation_repository.dart';

enum ReservationState {
  gettingInput,
  pending,
  rejected,
  accepted,
}

class ParentRequestProvider extends StateNotifier<ReservationState> {
  ParentRequestProvider() : super(ReservationState.gettingInput);
  String status = 'pending';
  String babyName = 'nameTest2';
  String birthHospital = "hospitalNameTest1";
  String birthDoctorName = "doctorNameTest1";
  String birthDoctorPhone = "01012345678";
  String babyGender = 'male';
  num babyWeight = 2.5;
  num hospitalId = 3;
  num babyAge = 2;

  void sendReservation(BuildContext context) async {
    final reservation = ReservationModel(
      id: 0,
      status: status,
      babyName: babyName,
      babyWeight: babyWeight,
      babyGender: babyGender,
      babyAge: babyAge,
      birthHospital: birthHospital,
      birthDoctorName: birthDoctorName,
      birthDoctorPhone: birthDoctorPhone,
      hospitalId: hospitalId,
    );

    print('reservation provider');
    try {
      final response =
          await ReservationRepository.requestReservation(reservation);
      print('response from reservation provider: ${response.body}');

      if (context.mounted) {
        context.router.pushAndPopUntil(
          const MainRoute(),
          predicate: (Route<dynamic> route) =>
              route.settings.name == 'SearchRequestRoute',
        );
      } else {
        print("ops! not mounted");
      }
    } catch (e) {
      print('Network Or Repository error: $e');
    }
  }
}

final parentReservationProvider =
    StateNotifierProvider<ParentRequestProvider, ReservationState>(
  (ref) => ParentRequestProvider(),
);
