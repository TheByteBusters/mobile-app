import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/widgets/screen_header.dart';
import 'package:mobile_app/features/monitoring/provider/sensor_provider.dart';
import 'package:mobile_app/features/monitoring/ui/monitoring_tile.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class MonitoringScreen extends ConsumerStatefulWidget {
  const MonitoringScreen({super.key});

  @override
  ConsumerState<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends ConsumerState<MonitoringScreen> {
  @override
  Widget build(BuildContext context) {
    // ref.watch(sensorProvider.notifier).connectProker();
    Map<String, String>? reading = ref.watch(sensorProvider);

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
              child: Column(
                children: [
                  MonitoringTile(
                    title: 'Heart Rate',
                    reading: reading == null ? '0' : reading['heartRate']!,
                    color: ColorsManager.mainGreen,
                    measuringUnit: ' BPM',
                    leading: PhosphorIcon(
                      PhosphorIcons.heartbeat(),
                      color: Colors.white,
                      size: 50.h,
                    ),
                  ),
                  MonitoringTile(
                    title: 'SPO2',
                    reading: reading == null ? '0' : reading['spo2']!,
                    color: const Color(0xFFFFD166),
                    measuringUnit: '   %   ',
                    leading: Row(
                      children: [
                        horizontalSpace(16.w),
                        const Text(
                          'O',
                          style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          '2',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
