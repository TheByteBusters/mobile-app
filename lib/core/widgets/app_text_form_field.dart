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
  final Widget? prefix;
  final String? Function(String?) validation;
  final void Function(String?) submition;
  final String hintText;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.isObscureText,
    this.suffixIcon,
    this.prefix,
    required this.hintText,
    required this.validation,
    required this.submition,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
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
        prefixIcon: prefix,
        suffixIcon: suffixIcon,
        filled: false,
        fillColor: ColorsManager.offwhite,
      ),
      obscureText: isObscureText ?? false,
      validator: validation,
      onSaved: submition,
      style: TextStyles.h4BlackNormal,
    );
  }
}
