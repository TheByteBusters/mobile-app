import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/routing/app_router.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/core/theming/colors.dart';

class App extends StatelessWidget {
  final AppRouter appRouter;
  const App({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    final token = AuthCache.getCacheData('token');

    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'App',
        theme: ThemeData(
          primaryColor: ColorsManager.mainGreen,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: token == null || token == ''
            ? Routes.onBoardingScreen
            : Routes.homeScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
