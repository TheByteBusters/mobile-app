import 'package:flutter/material.dart';
import 'package:mobile_app/core/theming/colors.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.titleText,
    required this.leadingIcon,
    tapFunction,
  });

  final String titleText;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        titleText,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: ColorsManager.offwhite,
        child: Icon(
          leadingIcon,
          color: ColorsManager.mainGreen,
        ),
      ),
    );
  }
}
