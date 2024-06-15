import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/core/widgets/app_text_form_field.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/features/auth/provider/auth_provider.dart';
import 'package:mobile_app/features/auth/services/auth_service.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    final authentication = ref.watch(authProvider.notifier);

    return Form(
      key: _formKey,
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
            validation: AuthService.validateEmail,
            submition: (value) {
              authentication.email = value!;
            },
          ),
          verticalSpace(25.h),
          Text(
            'Password',
            style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
          ),
          verticalSpace(5.h),
          AppTextFormField(
            hintText: '********',
            validation: AuthService.validatePassword,
            submition: (value) {
              authentication.password = value!;
            },
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
          Align(
            alignment: AlignmentDirectional.center,
            child: GreenButton(
              text: 'Login',
              route: '/home',
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                FocusManager.instance.primaryFocus?.unfocus();
                context.pushNamed(Routes.homeScreen);
                // print('pressed');
                // HTTPAuth.loginUser();
                // }
              },
            ),
          ),
        ],
      ),
    );
  }
}
