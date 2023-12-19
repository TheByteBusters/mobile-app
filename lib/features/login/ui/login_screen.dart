import 'package:flutter/material.dart';
import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/widgets/heading.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                const Heading()
              ],
            ),
            const Text('Login Screen'),
          ],
        ),
      ),
    );
  }
}
