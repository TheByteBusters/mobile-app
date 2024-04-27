import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/theming/colors.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.icon,
    required this.route,
  });

  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(10.w),
        onTap: () {
          context.pushNamed(route);
        },
        child: Center(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              border: Border.all(
                width: 1,
                color: ColorsManager.gray,
              ),
            ),
            child: Icon(
              icon,
              size: 60.h,
              color: ColorsManager.mainGreen,
            ),
          ),
        ),
      ),
    );
  }
}
