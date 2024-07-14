import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/routing/app_router.dart';
import 'package:mobile_app/features/auth/models/reservation_model.dart';
import 'package:mobile_app/features/reservation/provider/reservations_provider.dart';

class ReservationTile extends ConsumerWidget {
  const ReservationTile({
    super.key,
    required this.reservation,
    required this.index,
  });

  final ReservationModel reservation;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationsNotifier = ref.watch(reservationsProvider.notifier);
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      onTap: () {
        reservationsNotifier.detailsIndex = index;
        context.router.push(const ReservationDetailsRoute());
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 8.h,
          left: 8.w,
          right: 8.w,
          top: 8.h,
        ),
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
          subtitle: Text(reservation.createdAt!),
          trailing: const Icon(Icons.info_outline),
        ),
      ),
    );
  }
}
