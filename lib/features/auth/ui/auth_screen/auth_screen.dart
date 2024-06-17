import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/core/widgets/screen_header.dart';
import 'package:mobile_app/features/auth/provider/auth_provider.dart';
import 'package:mobile_app/features/auth/ui/auth_screen/login_screen.dart';
import 'package:mobile_app/features/auth/ui/auth_screen/signup_screen/signup_screen.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool isObscureText = true;
  bool haveAccount = true;

  @override
  Widget build(BuildContext context) {
    final authentication = ref.watch(authProvider.notifier);
    authentication.ctx = context;
    final authState = ref.watch(authProvider);
    Widget content = haveAccount ? const LoginScreen() : const SignUpScreen();

    if (authState == AuthState.validating) {
      content = Container(
        margin: EdgeInsets.only(top: 200.h, bottom: 200.h),
        child: const CircularProgressIndicator(),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                  child: content,
                ),
                verticalSpace(20.h),
                if (authentication.role == Role.parent &&
                    authState != AuthState.validating)
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
