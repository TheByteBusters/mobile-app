import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdownMenu extends StatelessWidget {
  const AppDropdownMenu({
    super.key,
    required this.items,
  });

  final Map<String, int> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: Colors.black,
          width: 1.2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: 0,
          isExpanded: true,
          onChanged: (value) {},
          items: items.entries
              .map(
                (item) => DropdownMenuItem(
                  value: item.value,
                  child: Text(item.key),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
