import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/routing/app_router.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/core/widgets/screen_header.dart';
import 'package:mobile_app/features/auth/provider/auth_provider.dart';
import 'package:mobile_app/features/auth/ui/get_started/role_tile.dart';

@RoutePage()
class GetStartedScreen extends ConsumerStatefulWidget {
  const GetStartedScreen({super.key});

  @override
  ConsumerState<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends ConsumerState<GetStartedScreen> {
  Role _selectedRole = Role.parent;

  @override
  Widget build(BuildContext context) {
    final authentication = ref.watch(authProvider.notifier);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const ScreenHeader(
                  title: 'Let\'s get started',
                  subtitle: 'Who are you?',
                ),
                SizedBox(height: 100.h),
                RoleTile(
                  icon: Icons.person_outline_outlined,
                  titleText: 'I\'m a Parent',
                  subtitleText: 'trying to find an incubator',
                  selected: _selectedRole == Role.parent,
                  onTapFunction: () {
                    setState(() {
                      _selectedRole = Role.parent;
                      authentication.role = Role.parent;
                    });
                  },
                ),
                SizedBox(height: 40.h),
                RoleTile(
                  icon: Icons.medical_information_outlined,
                  titleText: 'I\'m a Doctor',
                  subtitleText: 'Workign in a hospital',
                  selected: _selectedRole == Role.staff,
                  onTapFunction: () {
                    setState(() {
                      _selectedRole = Role.staff;
                      authentication.role = Role.staff;
                    });
                  },
                ),
                Expanded(child: Container()),
                const GreenButton(
                  text: 'Continue',
                  route: AuthRoute(),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
