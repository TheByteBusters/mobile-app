import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BiometricCard extends StatelessWidget {
  const BiometricCard({
    super.key,
    required this.title,
    required this.reading,
    required this.label,
    required this.icon,
  });

  final String title;
  final String reading;
  final String label;
  final IconData icon;

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
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              PhosphorIcon(
                icon,
                color: Colors.white,
                size: 34.h,
              ),
            ],
          ),
          Text(
            reading,
            style: TextStyles.h1BlackBold.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToLastDescent: false,
            ),
          ),
          Text(
            label,
            style: const TextStyle(color: ColorsManager.gray),
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
            ),
          ),
        ],
      ),
    );
  }
}
