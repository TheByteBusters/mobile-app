import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/theming/colors.dart';

class TextStyles {
  static TextStyle h4BlackNormal = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle h4WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle h1BlackBold = TextStyle(
    fontSize: 30.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle smallFadded = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Inter',
    color: ColorsManager.fadded,
  );

  static TextStyle bigTileTitle = TextStyle(
    fontSize: 18.sp,
    fontFamily: 'Inter',
    color: Colors.black,
  );
}
