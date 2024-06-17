import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/app.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthCache.cacheInitialization();
  runApp(
    ProviderScope(
      child: App(
        appRouter: AppRouter(),
      ),
    ),
  );
}
