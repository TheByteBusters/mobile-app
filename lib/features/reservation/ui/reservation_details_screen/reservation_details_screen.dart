import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/features/reservation/provider/reservation_details_provider.dart';
import 'package:mobile_app/features/reservation/provider/reservations_provider.dart';
import 'package:mobile_app/features/reservation/ui/reservation_details_screen/information_field.dart';
import 'package:mobile_app/core/widgets/green_button.dart';

@RoutePage()
class ReservationDetailsScreen extends ConsumerWidget {
  const ReservationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationsNotifier = ref.watch(reservationsProvider.notifier);
    final reservation =
        ref.watch(reservationsProvider)[reservationsNotifier.detailsIndex];
    final reservationDetailsState = ref.watch(reservationDetailsProvider);
    final reservationDetailsNotifier =
        ref.watch(reservationDetailsProvider.notifier);
    print('===============================');
    print('reservation state: ${reservation.status}');
    print('===============================');
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 22.h),
        child: reservationDetailsState == ReservationUpdateState.loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainGreen,
                ),
              )
            : ListView(
                children: [
                  Text(
                    'Reservation Details',
                    style: TextStyles.h1BlackBold,
                  ),
                  verticalSpace(24.h),
                  InformationField(
                    title: 'Name',
                    text: reservation.babyName,
                  ),
                  InformationField(
                    title: 'Age',
                    text: reservation.babyAge.toString(),
                  ),
                  InformationField(
                    title: 'Gender',
                    text: reservation.babyGender,
                  ),
                  InformationField(
                    title: 'Birth Hospital',
                    text: reservation.birthHospital,
                  ),
                  InformationField(
                    title: 'Doctor Name',
                    text: reservation.birthDoctorName,
                  ),
                  InformationField(
                    title: 'Doctor Phone',
                    text: reservation.birthDoctorPhone,
                  ),
                  verticalSpace(25.h),
                  Row(
                    children: [
                      GreenButton(
                        text: "Accept",
                        onPressed: () {
                          reservationDetailsNotifier
                              .acceptReservation(reservation.id.toString());
                        },
                        smaller: true,
                      ),
                      const Spacer(),
                      GreenButton(
                        text: 'Reject',
                        onPressed: () {
                          reservationDetailsNotifier
                              .rejectReservation(reservation.id.toString());
                        },
                        color: ColorsManager.secondaryRed,
                        smaller: true,
                      ),
                    ],
                  ),
                  verticalSpace(32.h),
                ],
              ),
      ),
    );
  }
}
