import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final String hintText;
  final String? Function(String?) validation;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.isObscureText,
    this.suffixIcon,
    required this.hintText,
    required this.validation,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 17.w,
              vertical: 16.h,
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.mainGreen,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
        hintStyle: hintStyle ??
            TextStyles.h4BlackNormal.copyWith(
              color: ColorsManager.gray,
            ),
        errorBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: false,
        fillColor: ColorsManager.offwhite,
      ),
      obscureText: isObscureText ?? false,
      validator: validation,
      style: TextStyles.h4BlackNormal,
    );
  }
}
