import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/core/widgets/app_dropdown_menu.dart';
import 'package:mobile_app/core/widgets/app_text_form_field.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/features/auth/services/auth_service.dart';
import 'package:mobile_app/features/reservation/provider/parent_reservation_provider.dart';
import 'package:mobile_app/features/search/providers/search_provider.dart';

@RoutePage()
class ReservationFormScreen extends ConsumerStatefulWidget {
  const ReservationFormScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ReservationFormScreenState();
}

class _ReservationFormScreenState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    final reservationNotifier = ref.watch(parentReservationProvider.notifier);
    final searchNotifier = ref.watch(searchProvider.notifier);

    reservationNotifier.hospitalId = searchNotifier.hospital!.id;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.w, bottom: 24.h),
                child: Text(
                  'Incubators list',
                  style: TextStyles.h1BlackBold,
                ),
              ),
              Text(
                'Baby Full Name',
                style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
              ),
              verticalSpace(5.h),
              AppTextFormField(
                hintText: 'Three Names',
                validation: AuthService.validateText,
                submition: (value) {
                  reservationNotifier.babyName = value!;
                },
              ),
              verticalSpace(25.h),
              Text(
                'Age',
                style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
              ),
              verticalSpace(5.h),
              AppTextFormField(
                hintText: 'Baby age in months',
                validation: AuthService.validateNumber,
                submition: (value) {
                  reservationNotifier.babyAge = double.parse(value!);
                },
              ),
              verticalSpace(25.h),
              Text(
                'Weight',
                style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
              ),
              verticalSpace(5.h),
              AppTextFormField(
                hintText: 'Baby weight in Kg',
                validation: AuthService.validateNumber,
                submition: (value) {
                  reservationNotifier.babyWeight = double.parse(value!);
                },
              ),
              verticalSpace(25.h),
              Text(
                'Gender',
                style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
              ),
              verticalSpace(5.h),
              AppDropdownMenu(
                items: const {
                  'female': 0,
                  'male': 1,
                },
                saveFunction: (value) {},
              ),
              verticalSpace(25.h),
              Text(
                'Birth Hospital Name',
                style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
              ),
              verticalSpace(5.h),
              AppTextFormField(
                hintText: 'Where the baby was born',
                validation: AuthService.validateText,
                submition: (value) {
                  reservationNotifier.birthHospital = value!;
                },
              ),
              verticalSpace(25.h),
              Text(
                'Birth Doctor Name',
                style: TextStyles.h4WhiteSemiBold.copyWith(color: Colors.black),
              ),
              verticalSpace(5.h),
              AppTextFormField(
                hintText: 'Doctor Name',
                validation: AuthService.validateText,
                submition: (value) {
                  reservationNotifier.birthDoctorName = value!;
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
                  reservationNotifier.birthDoctorPhone = value!;
                },
              ),
              verticalSpace(32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GreenButton(
                    text: 'Submit',
                    onPressed: () {
                      bool formFieldsValidation = _key.currentState!.validate();

                      if (!formFieldsValidation) return;

                      _key.currentState!.save();
                      reservationNotifier.sendReservation(context);
                    },
                  ),
                ],
              ),
              verticalSpace(16.h),
            ],
          ),
        ),
      ),
    );
  }
}
