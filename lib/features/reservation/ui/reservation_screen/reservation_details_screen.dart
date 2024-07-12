import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/features/reservation/ui/reservation_screen/information_field.dart';
import 'package:mobile_app/core/widgets/green_button.dart';

@RoutePage()
class ReservationDetailsScreen extends ConsumerWidget {
  const ReservationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reservation Details',
              style: TextStyles.h1BlackBold,
            ),
            verticalSpace(24.h),
            const InformationField(title: 'Name', text: 'ziad'),
            const InformationField(title: 'Name', text: 'ziad'),
            const InformationField(title: 'Name', text: 'ziad'),
            const InformationField(title: 'Name', text: 'ziad'),
            verticalSpace(25.h),
            const Spacer(),
            Row(
              children: [
                GreenButton(
                  text: "Accept",
                  onPressed: () {},
                ),
                FilledButton(
                  child: const Text('hi'),
                  onPressed: () {},
                ),
              ],
            ),
            verticalSpace(16.h),
          ],
        ),
      ),
    );
  }
}
