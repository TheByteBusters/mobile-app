import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/widgets/screen_header.dart';
import 'package:mobile_app/features/monitoring/provider/sensor_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MonitoringScreen extends ConsumerWidget {
  const MonitoringScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sensorProvider.notifier).connectProker();
    String reading = ref.watch(sensorProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ScreenHeader(
              title: 'Baby Readings',
              subtitle: 'your baby is on good hands',
              withReturn: true,
            ),
            verticalSpace(150.h),
            Center(
              child: Container(
                margin: EdgeInsets.all(16.w),
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManager.mainGreen,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35.w,
                      backgroundColor: ColorsManager.mainGreen,
                      child: PhosphorIcon(
                        PhosphorIcons.heartbeat(),
                        color: Colors.white,
                        size: 50.h,
                      ),
                    ),
                    horizontalSpace(10.w),
                    const Text(
                      'Heart rate',
                      style: TextStyle(fontSize: 21),
                    ),
                    const Spacer(),
                    Text(
                      reading,
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'BPM',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
