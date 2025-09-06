import 'package:flutter/widgets.dart';
import 'package:flutter_seed/services/analytics_service.dart';

class AnalyticsRouteObserver extends NavigatorObserver {
  void _log(Route<dynamic>? route) {
    if (route == null) return;

    final settings = route.settings;
    final screenName = settings.name ?? route.runtimeType.toString();
    final screenClass = settings.runtimeType.toString();

    if (screenName.isNotEmpty) {
      AnalyticsService.logScreenView(
        screenName: screenName,
        screenClass: screenClass,
      );
    }
  }

  @override
  void didPush(Route route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _log(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _log(newRoute);
  }

  @override
  void didPop(Route route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    // Après un pop, on log l’écran redevenu visible
    _log(previousRoute);
  }
}
