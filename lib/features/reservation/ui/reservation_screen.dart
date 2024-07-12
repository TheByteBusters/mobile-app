import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/features/auth/models/reservation_model.dart';
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

    print('buildling reservation screen');

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
                    print("indside list$reservations");
                    return ReservationTile(reservation: reservations[index]);
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

class ReservationTile extends StatelessWidget {
  const ReservationTile({
    super.key,
    required this.reservation,
  });

  final ReservationModel reservation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h, left: 8.w, right: 8.w, top: 8.h),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        title: Text('Name: ${reservation.babyName}'),
        subtitle: const Text('2024-7-12 8:30'),
      ),
    );
  }
}
