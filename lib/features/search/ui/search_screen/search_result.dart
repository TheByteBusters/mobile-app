import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
    required this.name,
    required this.address,
    required this.city,
    required this.phoneNumber,
    required this.type,
  });

  final String name;
  final String address;
  final String city;
  final String phoneNumber;
  final String type;

  String get price {
    switch (type) {
      case 'public':
        return 'Low price';
      case 'private':
        return 'High price';
      case 'charity':
        return 'Free';
      default:
        return 'Economy';
    }
  }

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
              name,
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
            '$city, $address',
            style: TextStyles.smallFadded,
          ),
          verticalSpace(20.h),
          Row(
            children: [
              Icon(
                Icons.phone_outlined,
                color: ColorsManager.mainGreen,
                size: 30.h,
              ),
              horizontalSpace(5.w),
              Text('Contact', style: TextStyles.h4BlackNormal),
            ],
          ),
          Text(
            phoneNumber,
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
            price,
            style: TextStyles.smallFadded,
          ),
          verticalSpace(20.h),
        ],
      ),
    );
  }
}
