import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/features/home/ui/home_screen/biometrics_list/biometric_card.dart';
import 'package:mobile_app/features/monitoring/provider/sensor_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BiometricsList extends ConsumerWidget {
  const BiometricsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final biometricsProvider = ref.watch(sensorProvider);
    print('this is what we got: $biometricsProvider');
    // final Widget content = Container();

    return biometricsProvider == null
        ? Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            child: const Center(
              child: Row(
                children: [
                  Text(
                    'Waiting for Biometrics Readings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        : ListView(
            scrollDirection: Axis.horizontal,
            children: [
              BiometricCard(
                title: 'Heart Rate',
                reading: biometricsProvider['heartRate']!,
                label: 'BPM',
                icon: PhosphorIcons.heartbeat(),
              ),
              horizontalSpace(6),
              BiometricCard(
                title: 'SPO2',
                reading: biometricsProvider['spo2']!,
                label: '%',
                icon: PhosphorIcons.pulse(),
              ),
              horizontalSpace(6),
              BiometricCard(
                title: 'Temperature',
                reading: biometricsProvider['heartRate']! == '0'
                    ? '0'
                    : biometricsProvider['temperature']!,
                label: 'C',
                icon: PhosphorIcons.thermometerSimple(),
              ),
            ],
          );
  }
}
