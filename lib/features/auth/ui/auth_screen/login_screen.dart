import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/core/widgets/app_text_form_field.dart';
import 'package:mobile_app/core/widgets/green_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
          ),
          verticalSpace(5.h),
          const AppTextFormField(
            hintText: 'email@gmail.com',
          ),
          verticalSpace(25.h),
          Text(
            'Password',
            style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
          ),
          verticalSpace(5.h),
          AppTextFormField(
            hintText: '********',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
          ),
          verticalSpace(10.h),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              'Forgot your password?',
              style: TextStyles.smallFadded.copyWith(
                color: ColorsManager.mainGreen,
              ),
            ),
          ),
          verticalSpace(220),
          const Align(
            alignment: AlignmentDirectional.center,
            child: GreenButton(text: 'Login', route: '/home'),
          ),
        ],
      ),
    );
  }
}
