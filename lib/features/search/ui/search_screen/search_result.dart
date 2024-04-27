import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(55.w)),
            child: Image.asset(
              'assets/images/damietta_hospital.jpg',
              width: double.infinity,
              height: 230.h,
              fit: BoxFit.cover,
            ),
          ),
          verticalSpace(18.h),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Damietta Specialized Hospital',
              style: TextStyles.h2BlackNormal,
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpace(20.h),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: ColorsManager.mainGreen,
                size: 30.h,
              ),
              horizontalSpace(5.w),
              Text('Location', style: TextStyles.h4BlackNormal),
            ],
          ),
          Text(
            'El-Taawon, Gism Damietta, Damietta Desert',
            style: TextStyles.smallFadded,
          ),
          verticalSpace(20.h),
          Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: ColorsManager.mainGreen,
                size: 30.h,
              ),
              horizontalSpace(5.w),
              Text('About', style: TextStyles.h4BlackNormal),
            ],
          ),
          Text(
            'Sepcialized Hospital',
            style: TextStyles.smallFadded,
          ),
          verticalSpace(20.h),
          Row(
            children: [
              Icon(
                Icons.attach_money_rounded,
                color: ColorsManager.mainGreen,
                size: 30.h,
              ),
              horizontalSpace(5.w),
              Text('Price', style: TextStyles.h4BlackNormal),
            ],
          ),
          Text(
            'Low price',
            style: TextStyles.smallFadded,
          ),
          verticalSpace(20.h),
        ],
      ),
    );
  }
}
