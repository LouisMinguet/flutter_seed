// lib/pages/home_page.dart

import 'package:flutter/material.dart';

import '../services/analytics_service.dart';
import '../widgets/analytics_consent_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Vérifier le consentement après le build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAnalyticsConsent();
    });
  }

  Future<void> _checkAnalyticsConsent() async {
    final needsConsent = await AnalyticsService.needsConsentDialog();

    if (needsConsent && mounted) {
      _showConsentDialog();
    }
  }

  Future<void> _showConsentDialog() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const AnalyticsConsentDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Home Page")));
  }
}
