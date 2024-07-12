import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/routing/app_router.dart';
import 'package:mobile_app/features/auth/models/reservation_model.dart';

class ReservationTile extends StatelessWidget {
  const ReservationTile({
    super.key,
    required this.reservation,
  });

  final ReservationModel reservation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      onTap: () {
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
          subtitle: const Text('2024-7-12 8:30'),
          trailing: const Icon(Icons.info_outline),
        ),
      ),
    );
  }
}
