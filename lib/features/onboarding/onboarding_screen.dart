import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/features/onboarding/widgets/get_started_button.dart';
import 'package:mobile_app/features/onboarding/widgets/onboarding_banner.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 30.h,
          ),
          child: Column(
            children: [
              const OnboardingBanner(),
              SizedBox(height: 60.h),
              Text(
                'Fastest way to find\nBaby incubator',
                style: TextStyles.h1BlackBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),
              const GetStartedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
