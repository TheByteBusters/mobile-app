import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/features/reservation/provider/parent_reservation_provider.dart';
import 'package:mobile_app/features/search/providers/search_provider.dart';

@RoutePage()
class ReservationFormScreen extends ConsumerWidget {
  const ReservationFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final reservationProvider = ref.watch(parentReservationProvider);
    final reservationNotifier = ref.watch(parentReservationProvider.notifier);
    final searchNotifier = ref.watch(searchProvider.notifier);

    reservationNotifier.hospitalId = searchNotifier.hospital!.id;

    return Form(
      child: Column(
        children: [
          const Text('form'),
          GreenButton(
            text: 'submit',
            onPressed: () {
              reservationNotifier.sendReservation(context);
            },
          ),
        ],
      ),
    );
  }
}
