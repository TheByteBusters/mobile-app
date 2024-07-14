import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final PageRouteInfo? route;
  final void Function()? onPressed;
  final Color? color;
  final bool? smaller;

  const GreenButton({
    super.key,
    required this.text,
    this.route,
    this.onPressed,
    this.color,
    this.smaller,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ??
          () {
            context.router.push(route!);
          },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(color ?? ColorsManager.mainGreen),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(
          smaller == true ? Size(190.w, 60.h) : Size(200.w, 50.h),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyles.h4WhiteSemiBold,
      ),
    );
  }
}
