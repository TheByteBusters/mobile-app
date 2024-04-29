import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/core/widgets/app_dropdown_menu.dart';
import 'package:mobile_app/core/widgets/app_text_form_field.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/features/auth/provider/auth_provider.dart';

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
            validation: authentication.validateFullName,
          ),
          verticalSpace(25.h),
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
            validation: authentication.validateFullName,
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
            validation: authentication.validateFullName,
          ),
          verticalSpace(25.h),
          Text(
            'Birth Date',
            style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
          ),
          verticalSpace(5.h),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  color: Colors.black,
                  width: 1.2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 15.w),
                    child: const Text(
                      'DD/MM/YYYY',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(25.h),
          Text(
            'Country',
            style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
          ),
          verticalSpace(5.h),
          const AppDropdownMenu(items: {
            'Damietta': 0,
            'El-Mansoura': 1,
            'Bort-Said': 2,
          }),
          verticalSpace(25.h),
          Text(
            'Phone number',
            style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
          ),
          verticalSpace(5.h),
          AppTextFormField(
            hintText: '000000000',
            validation: authentication.validateFullName,
          ),
          verticalSpace(36.h),
          Align(
            alignment: AlignmentDirectional.center,
            child: GreenButton(
              text: 'SignUp',
              route: '/home',
              onPressed: () {
                _key.currentState!.validate();
              },
            ),
          ),
          // verticalSpace(10.h),
        ],
      ),
    );
  }
}
