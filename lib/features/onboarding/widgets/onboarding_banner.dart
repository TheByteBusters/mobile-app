import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app/core/theming/colors.dart';

class OnboardingBanner extends StatelessWidget {
  const OnboardingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 610.h,
      padding: EdgeInsets.only(top: 60.h, bottom: 40.h),
      decoration: BoxDecoration(
        color: ColorsManager.mainGreen,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40.w),
        ),
      ),
      child: Stack(
        children: [
          // wing right
          Column(
            children: [
              SizedBox(height: 60.h),
              Container(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'assets/images/wings_right.png',
                  height: 450.h,
                ),
              ),
            ],
          ),
          // wing left
          Column(
            children: [
              SizedBox(height: 60.h),
              Image.asset(
                'assets/images/wings_left.png',
                height: 450.h,
              ),
            ],
          ),
          // Stork on top
          SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/svgs/white_green_stork.svg',
              width: 162.w,
            ),
          ),
        ],
      ),
    );
  }
}
