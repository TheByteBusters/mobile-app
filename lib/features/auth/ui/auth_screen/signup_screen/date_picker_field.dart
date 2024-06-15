import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/features/auth/provider/auth_provider.dart';
import 'package:mobile_app/features/auth/provider/date_provider.dart';

final formatter = DateFormat.yMd();

class DatePickerField extends ConsumerStatefulWidget {
  const DatePickerField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DatePickerFieldState();
}

class _DatePickerFieldState extends ConsumerState<DatePickerField> {
  @override
  Widget build(BuildContext context) {
    final dateState = ref.watch(dateStateProvider);
    final dateNotifier = ref.watch(dateStateProvider.notifier);
    final authenticationProvider = ref.watch(authProvider.notifier);

    return InkWell(
      onTap: () {
        showDatePicker(
          context: context,
          firstDate: DateTime(DateTime.now().year - 90),
          lastDate: DateTime(DateTime.now().year - 17),
        ).then((value) {
          if (value == null) return;
          var formattedDate = formatter.format(value);
          dateNotifier.setDate(formattedDate);
          authenticationProvider.birthDate = formattedDate;
        });
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color:
                    dateState == InputState.empty ? Colors.red : Colors.black,
                width: 1.2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 15.w),
                  child: Text(
                    dateNotifier.date == '' ? 'DD/MM/YYYY' : dateNotifier.date,
                    style: TextStyle(
                        color: dateNotifier.date == ''
                            ? Colors.grey
                            : Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Icon(
                    Icons.calendar_month,
                    color: dateState == InputState.empty
                        ? Theme.of(context).colorScheme.error
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: dateState == InputState.empty,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20.w),
              child: Text(
                'must provide your birth date',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 12.h,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
