import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/app.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthCache.cacheInitialization();
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
