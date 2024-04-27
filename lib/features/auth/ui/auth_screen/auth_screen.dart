import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/core/widgets/screen_header.dart';
import 'package:mobile_app/features/auth/ui/auth_screen/login_screen.dart';
import 'package:mobile_app/features/auth/ui/auth_screen/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  bool haveAccount = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                ScreenHeader(
                  title: haveAccount ? 'Login' : 'Sign Up',
                  subtitle: haveAccount
                      ? 'Welcome to our app'
                      : 'We hope to fulfill your needs',
                  withReturn: true,
                ),
                verticalSpace(80),
                Padding(
                  padding: EdgeInsets.all(5.w),
                  child:
                      haveAccount ? const LoginScreen() : const SignUpScreen(),
                ),
                verticalSpace(20.h),
                Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        haveAccount
                            ? 'Dont\'t have an account? '
                            : 'Already have an account? ',
                        style: TextStyles.smallFadded,
                      ),
                      GestureDetector(
                        child: Text(
                          haveAccount ? 'Sign Up' : 'Login',
                          style: TextStyles.smallFadded.copyWith(
                            color: ColorsManager.mainGreen,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorsManager.mainGreen,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            haveAccount = !haveAccount;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                verticalSpace(25.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
