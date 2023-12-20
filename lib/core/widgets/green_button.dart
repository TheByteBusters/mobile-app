import 'package:flutter/material.dart';
import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final String route;

  const GreenButton({
    super.key,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(route);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsManager.mainGreen),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(
          const Size(200, 50),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyles.h4WhiteSemiBold,
      ),
    );
  }
}
