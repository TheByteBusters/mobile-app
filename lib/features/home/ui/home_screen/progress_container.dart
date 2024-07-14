import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/features/home/provider/progress_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProgressContainer extends ConsumerWidget {
  const ProgressContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressState = ref.watch(progressProvider);

    final index = progressState.index;

    print('===============');
    print('state index: $index');
    print('===============');

    return Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: progressState == ProgressState.connected
              ? ColorsManager.mainGreen
              : Colors.grey,
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: index >= 2 && index < 6
                    ? ColorsManager.mainGreen
                    : Colors.grey,
                radius: 16,
                child: index >= 2 && index < 6
                    ? const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.mail_outline,
                        color: Colors.black,
                      ),
              ),
              horizontalSpace(8.w),
              Expanded(
                child: Container(
                  // comment
                  height: 6.h,
                  color: index >= 3 && index < 6
                      ? ColorsManager.mainGreen
                      : Colors.grey,
                ),
              ),
              horizontalSpace(8.w),
              CircleAvatar(
                backgroundColor: index >= 3 && index < 6
                    ? ColorsManager.mainGreen
                    : Colors.grey,
                radius: 16,
                child: index >= 3 && index < 6
                    ? const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      )
                    : PhosphorIcon(
                        PhosphorIcons.paperPlaneRight(),
                        color: Colors.black,
                      ),
              ),
              horizontalSpace(8.w),
              Expanded(
                child: Container(
                  // comment
                  height: 6.h,
                  color: index >= 4 && index < 6
                      ? ColorsManager.mainGreen
                      : Colors.grey,
                ),
              ),
              horizontalSpace(8.w),
              CircleAvatar(
                backgroundColor: index >= 4 && index < 6
                    ? ColorsManager.mainGreen
                    : Colors.grey,
                radius: 16,
                child: index >= 4 && index < 6
                    ? const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.mark_email_read_outlined,
                        color: Colors.black,
                      ),
              ),
              horizontalSpace(8.w),
              Expanded(
                child: Container(
                  // comment
                  height: 6.h,
                  color: index >= 5 && index < 6
                      ? ColorsManager.mainGreen
                      : Colors.grey,
                ),
              ),
              horizontalSpace(8.w),
              CircleAvatar(
                backgroundColor: index == 5 && index < 6
                    ? ColorsManager.mainGreen
                    : Colors.grey,
                radius: 16,
                child: index == 5 && index < 6
                    ? const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.location_city_sharp,
                        color: Colors.black,
                      ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
