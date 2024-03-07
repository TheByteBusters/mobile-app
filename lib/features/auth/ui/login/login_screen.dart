import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/core/widgets/app_text_form_field.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/core/widgets/heading.dart';

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const Heading(
                      title: 'Login',
                      subtitle: 'Login to enjoy the features we\'ve provided.',
                    )
                  ],
                ),
                verticalSpace(80),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyles.h4WhiteSemiBold
                            .copyWith(color: Colors.black),
                      ),
                      verticalSpace(5.h),
                      const AppTextFormField(
                        hintText: 'email@gmail.com',
                      ),
                      verticalSpace(25.h),
                      Text(
                        'Password',
                        style: TextStyles.h4WhiteSemiBold
                            .copyWith(color: Colors.black),
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
                ),
                verticalSpace(20.h),
                Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont\'t have an account? ',
                        style: TextStyles.smallFadded,
                      ),
                      GestureDetector(
                        child: Text(
                          'Sign Up',
                          style: TextStyles.smallFadded.copyWith(
                            color: ColorsManager.mainGreen,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorsManager.mainGreen,
                          ),
                        ),
                        onTap: () {
                          context.pushNamed(Routes.signUpScreen);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
