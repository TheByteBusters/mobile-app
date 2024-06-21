import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.icon,
    required this.route,
    this.tapMethod,
    required this.title,
  });

  final IconData icon;
  final String route;
  final String title;
  final void Function()? tapMethod;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(10.w),
        onTap: tapMethod ??
            () {
              context.pushNamed(route);
            },
        child: Center(
          child: Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.h),
            decoration: BoxDecoration(
              // color: ColorsManager.mainGreen,
              borderRadius: BorderRadius.circular(10.w),
              border: Border.all(
                width: 1,
                color: ColorsManager.gray,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 60.h,
                  color: ColorsManager.mainGreen,
                ),
                horizontalSpace(20.w),
                Text(
                  title,
                  style: TextStyles.bigTileTitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
