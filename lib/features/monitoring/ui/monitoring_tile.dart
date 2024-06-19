import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';

class MonitoringTile extends StatelessWidget {
  const MonitoringTile({
    super.key,
    required this.reading,
    required this.measuringUnit,
    required this.color,
    required this.leading,
    required this.title,
  });

  final String title;
  final String reading;
  final String measuringUnit;
  final Color color;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35.w,
            backgroundColor: color,
            child: leading,
          ),
          horizontalSpace(10.w),
          Text(
            title,
            style: const TextStyle(fontSize: 21),
          ),
          const Spacer(),
          Text(
            reading,
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              measuringUnit,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
