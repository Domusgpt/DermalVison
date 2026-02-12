import 'package:dermalvision/app/router/app_router.dart';
import 'package:dermalvision/app/theme/dermal_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: DermalVisionApp()));
}

class DermalVisionApp extends ConsumerWidget {
  const DermalVisionApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'DermalVision',
      debugShowCheckedModeBanner: false,
      theme: DermalTheme.dark(),
      routerConfig: router,
    );
  }
}
