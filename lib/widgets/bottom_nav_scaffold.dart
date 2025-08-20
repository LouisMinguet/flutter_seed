// lib/widgets/bottom_nav_scaffold.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class BottomNavScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavScaffold({super.key, required this.navigationShell});

  void _onTap(int index) {
    // goBranch save the state for each page
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        key: ValueKey(context.locale.languageCode), // force rebuild
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onTap,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: "navbar.home".tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.circle_outlined),
            selectedIcon: const Icon(Icons.circle),
            label: "navbar.middle".tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: "navbar.settings".tr(),
          ),
        ],
      ),
    );
  }
}
