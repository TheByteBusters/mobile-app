import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app/core/theming/styles.dart';

class Heading extends StatelessWidget {
  final String title;
  final String subtitle;

  const Heading({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(
            'assets/svgs/black_green_stork.svg',
            width: 90.w,
          ),
        ),
        SizedBox(height: 40.h),
        Text(
          title,
          style: TextStyles.h1BlackBold,
        ),
        Text(
          subtitle,
          style: TextStyles.smallFadded,
        ),
      ],
    );
  }
}
