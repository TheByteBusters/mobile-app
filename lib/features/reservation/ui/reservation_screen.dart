import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/networking/websocket_reservation.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/features/reservation/provider/reservations_provider.dart';

@RoutePage()
class ReservationScreen extends ConsumerStatefulWidget {
  const ReservationScreen({super.key});

  @override
  ConsumerState<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends ConsumerState<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    final reservations = ref.watch(reservationsProvider);
    final reservationsNotifier = ref.watch(reservationsProvider.notifier);

    reservationsNotifier.listenToReservations();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16.h),
              Text(
                'Requests',
                style: TextStyles.h1BlackBold,
              ),
              verticalSpace(50.h),
              Expanded(
                child: ListView.builder(
                  itemCount: reservations.length,
                  itemBuilder: ((context, index) {
                    return Text(reservations[index].babyName);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
