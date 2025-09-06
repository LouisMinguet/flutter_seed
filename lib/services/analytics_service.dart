import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  static const String _consentKey = 'analytics_consent';

  static Future<bool> needsConsentDialog() async {
    final prefs = await SharedPreferences.getInstance();
    final hasConsented = prefs.getBool(_consentKey);

    if (hasConsented == null) {
      return true;
    }

    if (hasConsented) {
      await _analytics.setAnalyticsCollectionEnabled(true);
    }

    return false;
  }

  static Future<bool> hasConsented() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_consentKey) ?? false;
  }

  static Future<void> updateConsent(bool consent) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_consentKey, consent);
    await _analytics.setAnalyticsCollectionEnabled(consent);
  }

  /*
   * Log events
   */

  static Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    if (await hasConsented()) {
      await _analytics.logEvent(name: name, parameters: parameters);
    }
  }

  static Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    await _analytics.logScreenView(
      screenName: screenName,
      screenClass: screenClass,
    );
  }

  static Future<void> logAppOpen() async {
    await _analytics.logAppOpen();
  }
}
