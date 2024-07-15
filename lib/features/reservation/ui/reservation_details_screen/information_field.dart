import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/styles.dart';

class InformationField extends StatelessWidget {
  const InformationField({
    super.key,
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
        ),
        verticalSpace(12.h),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.h),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            text,
            style: TextStyles.h4BlackNormal,
          ),
        ),
      ],
    );
  }
}
