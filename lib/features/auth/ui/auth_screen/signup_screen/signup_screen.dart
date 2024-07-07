import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/core/widgets/app_dropdown_menu.dart';
import 'package:mobile_app/core/widgets/app_text_form_field.dart';
import 'package:mobile_app/features/auth/provider/date_provider.dart';
import 'package:mobile_app/features/auth/provider/location_provider.dart';
import 'package:mobile_app/features/auth/ui/auth_screen/signup_screen/date_picker_field.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/features/auth/ui/auth_screen/signup_screen/location_picker.dart';
import 'package:mobile_app/features/auth/provider/auth_provider.dart';
import 'package:mobile_app/features/auth/services/auth_service.dart';

// Google Maps API key: ,""AlzaSyCuTilAfnGfkZtlx0T3qf-e0mWZ_N2LpoY

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _key = GlobalKey<FormState>();
  var isObscurePassword = true;
  var isObscureRepeatedPassword = true;

  @override
  Widget build(BuildContext context) {
    final authentication = ref.watch(authProvider.notifier);

    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
            style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
          ),
          verticalSpace(5.h),
          AppTextFormField(
            hintText: 'Three Names',
            validation: AuthService.validateFullName,
            submition: (value) {
              authentication.fullName = value!;
            },
          ),
          verticalSpace(25.h),
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
            'Set a Password',
            style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
          ),
          verticalSpace(5.h),
          AppTextFormField(
            hintText: '********',
            isObscureText: isObscurePassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscurePassword = !isObscurePassword;
                });
              },
              child: Icon(
                isObscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
            validation: AuthService.validatePassword,
            submition: (value) {
              authentication.password = value!;
            },
          ),
          verticalSpace(25.h),
          Text(
            'Repeat a Password',
            style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
          ),
          verticalSpace(5.h),
          AppTextFormField(
            hintText: '********',
            isObscureText: isObscureRepeatedPassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureRepeatedPassword = !isObscureRepeatedPassword;
                });
              },
              child: Icon(
                isObscureRepeatedPassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
            validation: AuthService.validateConfirmPassword,
            submition: (value) {},
          ),
          verticalSpace(25.h),
          Text(
            'Birth Date',
            style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
          ),
          verticalSpace(5.h),
          const DatePickerField(),
          verticalSpace(25.h),
          Text(
            'Country',
            style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
          ),
          verticalSpace(5.h),
          AppDropdownMenu(
            items: const {
              'Damietta': 0,
              'El-Mansoura': 1,
              'Bort-Said': 2,
            },
            saveFunction: (value) {
              authentication.country = value;
            },
          ),
          verticalSpace(25.h),
          Text(
            'Phone number',
            style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
          ),
          verticalSpace(5.h),
          AppTextFormField(
            hintText: '000000000',
            prefix: Container(
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              margin: EdgeInsets.all(5.w),
              child: Text(
                '+20',
                style: TextStyle(fontSize: 18.h),
              ),
            ),
            validation: AuthService.validatePhoneNumber,
            submition: (value) {
              authentication.phoneNumber = value!;
            },
          ),
          verticalSpace(25.h),
          Text(
            'Home location',
            style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
          ),
          verticalSpace(5.h),
          const LocationInput(),
          verticalSpace(36.h),
          Align(
            alignment: AlignmentDirectional.center,
            child: GreenButton(
              text: 'SignUp',
              onPressed: () {
                bool formFieldsValidation = _key.currentState!.validate();
                final dateValidation =
                    ref.watch(dateStateProvider.notifier).submitDate();
                final locationValidation =
                    ref.watch(locationStateProvider.notifier).submitLocation();

                authentication.printAttributes();

                if (!dateValidation ||
                    !formFieldsValidation ||
                    !locationValidation) return;

                _key.currentState!.save();
                authentication.signupParent();
              },
            ),
          ),
          // verticalSpace(10.h),
        ],
      ),
    );
  }
}
