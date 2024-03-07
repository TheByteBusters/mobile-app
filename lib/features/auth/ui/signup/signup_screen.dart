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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  var isObscureText = true;

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
                    title: 'Sign Up',
                    subtitle: 'sign up to enjoy the features we\'ve provided.',
                  )
                ],
              ),
              verticalSpace(36.h),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: TextStyles.h4WhiteSemiBold
                          .copyWith(color: Colors.black),
                    ),
                    verticalSpace(5.h),
                    const AppTextFormField(
                      hintText: 'Three Names',
                    ),
                    verticalSpace(10.h),
                    Text(
                      'Email',
                      style: TextStyles.h4WhiteSemiBold
                          .copyWith(color: Colors.black),
                    ),
                    verticalSpace(5.h),
                    const AppTextFormField(
                      hintText: 'email@gmail.com',
                    ),
                    verticalSpace(10.h),
                    Text(
                      'Set a Password',
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
                    Text(
                      'Repeat a Password',
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
                    verticalSpace(27.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: ColorsManager.mainGreen,
                        ),
                        horizontalSpace(10.w),
                        const Icon(
                          Icons.circle,
                          color: ColorsManager.gray,
                        )
                      ],
                    ),
                    verticalSpace(27.h),
                    const Align(
                      alignment: AlignmentDirectional.center,
                      child: GreenButton(text: 'Next', route: '/home'),
                    ),
                    verticalSpace(69.h),
                    Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyles.smallFadded,
                          ),
                          GestureDetector(
                            child: Text(
                              'Login',
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
            ],
          ),
        ),
      ),
    ));
  }
}
