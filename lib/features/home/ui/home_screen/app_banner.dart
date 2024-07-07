import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    super.key,
    required this.title,
    required this.firstLine,
    required this.secondLine,
    required this.withIcon,
    required this.withSmallerTitle,
    required this.image,
    this.onPressed,
  });

  final void Function()? onPressed;
  final String title;
  final String firstLine;
  final String secondLine;
  final String image;
  final bool withIcon;
  final bool withSmallerTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: ExactAssetImage(image),
                  fit: BoxFit.fitWidth,
                ),
              ),
              width: double.infinity,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    ColorsManager.mainGreen.withOpacity(0.6),
                    Colors.black.withOpacity(0.2),
                  ],
                  stops: const [
                    0.5,
                    1,
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: withSmallerTitle ? 20 : 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace(8),
                      Text(
                        firstLine,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        secondLine,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const Spacer(),
                  if (withIcon)
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_outlined,
                        color: ColorsManager.mainGreen,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
