import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/core/widgets/app_text_form_field.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/features/auth/provider/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    final authentication = ref.watch(authProvider.notifier);

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
          AppTextFormField(
            hintText: 'email@gmail.com',
            validation: authentication.validateFullName,
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
            validation: authentication.validateFullName,
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
