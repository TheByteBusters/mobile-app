import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BiometricCard extends StatelessWidget {
  const BiometricCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsManager.mainGreen,
      ),
      width: 140.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Heart Rate',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              PhosphorIcon(
                PhosphorIcons.heartbeat(),
                color: Colors.white,
                size: 34.h,
              ),
            ],
          ),
          verticalSpace(4.h),
          Text(
            '74',
            style: TextStyles.h1BlackBold.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToLastDescent: false,
            ),
          ),
          const Text(
            'BPM',
            style: TextStyle(color: ColorsManager.gray),
            textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: false,
            ),
          ),
        ],
      ),
    );
  }
}
