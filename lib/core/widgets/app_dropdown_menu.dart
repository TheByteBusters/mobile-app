import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/features/auth/provider/auth_provider.dart';

class AppDropdownMenu extends ConsumerStatefulWidget {
  const AppDropdownMenu({
    super.key,
    required this.items,
  });

  final Map<String, int> items;

  @override
  ConsumerState<AppDropdownMenu> createState() => _AppDropdownMenuState();
}

class _AppDropdownMenuState extends ConsumerState<AppDropdownMenu> {
  var currentValue = 0;

  @override
  Widget build(BuildContext context) {
    final authentication = ref.watch(authProvider.notifier);

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
        child: DropdownButtonFormField(
          value: currentValue,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              currentValue = value ?? 0;
            });
          },
          items: widget.items.entries
              .map(
                (item) => DropdownMenuItem(
                  value: item.value,
                  child: Text(item.key),
                ),
              )
              .toList(),
          onSaved: (value) {
            authentication.country = widget.items.keys.toList()[value!];
          },
          decoration: const InputDecoration(border: InputBorder.none),
        ),
      ),
    );
  }
}
