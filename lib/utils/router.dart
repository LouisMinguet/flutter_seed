// lib/utils/router.dart

import 'package:flutter/material.dart';
import 'package:flutter_seed/pages/settings/about.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/home_page.dart';
import '../pages/placeholder_page.dart';
import '../pages/settings/terms.dart';
import '../pages/settings_page.dart';
import '../pages/onboarding_page.dart';
import '../widgets/bottom_nav_scaffold.dart';

/// Root navigator (pour les routes globales comme l'onboarding)
final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// NavigatorKeys pour chaque onglet (préservent l'état)
final _homeTabNavigatorKey = GlobalKey<NavigatorState>();
final _middleTabNavigatorKey = GlobalKey<NavigatorState>();
final _settingsTabNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/', // On redirige si onboarding non vu
  navigatorKey: _rootNavigatorKey,
  routes: [
    // --------- not in shell ----------
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: OnBoardingPage(),
      ),
    ),
    GoRoute(
      path: '/terms',
      name: 'terms',
      builder: (context, state) => const TermsPage(),
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) => const AboutPage(),
    ),


    // --------- Shell with BottomNav for pages ----------
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomNavScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/',
              name: 'home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomePage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _middleTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/placeholder',
              name: 'placeholder',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PlaceholderPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/settings',
              name: 'settings',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsPage(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],

  // Redirection for onboarding
  redirect: (context, state) async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeen = prefs.getBool('hasSeenOnboarding') ?? false;

    final goingToOnboarding = state.matchedLocation == '/onboarding';

    if (!hasSeen && !goingToOnboarding) {
      // Show the onboarding if not seen
      return '/onboarding';
    }

    if (hasSeen && goingToOnboarding) {
      // Onboarding seen > Page 0
      return '/';
    }

    return null;
  },
);
