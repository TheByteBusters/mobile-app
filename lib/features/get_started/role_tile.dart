import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';

class RoleTile extends StatelessWidget {
  final IconData icon;
  final String titleText;
  final String subtitleText;

  const RoleTile({
    super.key,
    required this.icon,
    required this.titleText,
    required this.subtitleText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListTile(
        selected: true,
        onTap: () {},
        leading: CircleAvatar(
          radius: 30.r,
          backgroundColor: ColorsManager.mainGreen,
          child: Icon(
            icon,
            color: Colors.white,
            size: 40.sp,
          ),
        ),
        title: Text(
          titleText,
          style: TextStyles.bigTileTitle.copyWith(
            color: ColorsManager.mainGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitleText,
          style: TextStyles.smallFadded,
        ),
      ),
    );
  }
}
