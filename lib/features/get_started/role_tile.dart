import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';

class RoleTile extends StatelessWidget {
  final IconData icon;
  final String titleText;
  final String subtitleText;
  final bool selected;
  final Function onTapFunction;

  const RoleTile({
    super.key,
    required this.selected,
    required this.icon,
    required this.titleText,
    required this.subtitleText,
    required this.onTapFunction,
  });

  get _textStyle {
    if (selected) {
      return TextStyles.bigTileTitle.copyWith(
        color: ColorsManager.mainGreen,
        fontWeight: FontWeight.bold,
      );
    } else {
      return TextStyles.bigTileTitle;
    }
  }

  get _iconBackgroundColor {
    return selected ? ColorsManager.mainGreen : Colors.white;
  }

  get _iconColor {
    return selected ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListTile(
        selected: true,
        onTap: () {
          onTapFunction();
        },
        leading: DecoratedBox(
          decoration: BoxDecoration(
            color: _iconBackgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white),
          ),
          child: SizedBox(
            width: 50.w,
            height: 50.h,
            child: Icon(
              icon,
              color: _iconColor,
              size: 40.sp,
            ),
          ),
        ),
        title: Text(
          titleText,
          style: _textStyle,
        ),
        subtitle: Text(
          subtitleText,
          style: TextStyles.smallFadded,
        ),
      ),
    );
  }
}
