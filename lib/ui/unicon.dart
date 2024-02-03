import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:unicon/ui/pages/error/page.dart';
import 'package:unicon/ui/pages/home/page.dart';
import 'package:unicon/ui/providers/theme.dart';

/// Main App
class UniConApp extends ConsumerStatefulWidget {
  /// Constructor
  const UniConApp({
    super.key,
  });

  @override
  ConsumerState<UniConApp> createState() => _UniConAppState();
}

class _UniConAppState extends ConsumerState<UniConApp> {
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: const HomePage(),
        ),
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const ErrorPage(),
  );

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return MaterialApp.router(
      title: 'UniCon',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: isDarkMode ? AppTheme.uniDarkTheme : AppTheme.uniLightTheme,
      darkTheme: AppTheme.uniDarkTheme,
      themeMode: ThemeMode.light,
    );
  }
}

/// Behavior by hide Scroll
class MyCustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
