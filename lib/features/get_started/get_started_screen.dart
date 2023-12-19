import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/core/widgets/heading.dart';
import 'package:mobile_app/features/get_started/role_tile.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

enum Role { parent, doctor }

class _GetStartedScreenState extends State<GetStartedScreen> {
  Role _selectedRole = Role.parent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Heading(),
              SizedBox(height: 100.h),
              RoleTile(
                icon: Icons.person_outline_outlined,
                titleText: 'I\'m a Parent',
                subtitleText: 'trying to find an incubator',
                selected: _selectedRole == Role.parent,
                onTapFunction: () {
                  setState(() {
                    _selectedRole = Role.parent;
                  });
                },
              ),
              SizedBox(height: 40.h),
              RoleTile(
                icon: Icons.medical_information_outlined,
                titleText: 'I\'m a Doctor',
                subtitleText: 'Workign in a hospital',
                selected: _selectedRole == Role.doctor,
                onTapFunction: () {
                  setState(() {
                    _selectedRole = Role.doctor;
                  });
                },
              ),
              Expanded(child: Container()),
              const GreenButton(
                text: 'Continue',
                route: Routes.loginScreen,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
