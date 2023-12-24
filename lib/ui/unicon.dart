import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:unicon/ui/pages/error.dart';
import 'package:unicon/ui/pages/home.dart';
import 'package:unicon/ui/providers/theme.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        ScaleTransition(scale: animation, child: child),
  );
}

class UniConApp extends ConsumerStatefulWidget {
  const UniConApp({
    super.key,
  });

  @override
  ConsumerState<UniConApp> createState() => _UniConAppState();
}

class _UniConAppState extends ConsumerState<UniConApp> {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => HomePage(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: isDarkMode ? AppTheme.uniDarkTheme : AppTheme.uniLightTheme,
      darkTheme: AppTheme.uniDarkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
