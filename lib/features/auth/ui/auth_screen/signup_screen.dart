import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/core/widgets/app_dropdown_menu.dart';
import 'package:mobile_app/core/widgets/app_text_form_field.dart';
import 'package:mobile_app/core/widgets/green_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full Name',
          style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
        ),
        verticalSpace(5.h),
        const AppTextFormField(
          hintText: 'Three Names',
        ),
        verticalSpace(25.h),
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
          'Set a Password',
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
        verticalSpace(25.h),
        Text(
          'Repeat a Password',
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
        verticalSpace(25.h),
        Text(
          'Birth Date',
          style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
        ),
        verticalSpace(5.h),
        Container(
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
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 15.w),
                child: const Text(
                  'DD/MM.YYYY',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month),
              )
            ],
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
        const AppTextFormField(
          hintText: '000000000',
        ),
        verticalSpace(36.h),
        const Align(
          alignment: AlignmentDirectional.center,
          child: GreenButton(text: 'SignUp', route: '/home'),
        ),
        // verticalSpace(10.h),
      ],
    );
  }
}
