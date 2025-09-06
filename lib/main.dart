import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seed/utils/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation easy_localization
  await EasyLocalization.ensureInitialized();

  // TEMP DEV > TO REMOVE
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();

  // Initialisation Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Désactiver la collecte par défaut (RGPD)
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(false);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('fr'), Locale('es')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      child: const FlutterSeedApp(),
    ),
  );
}

class FlutterSeedApp extends StatefulWidget {
  const FlutterSeedApp({super.key});

  @override
  State<FlutterSeedApp> createState() => _FlutterSeedAppState();
}

class _FlutterSeedAppState extends State<FlutterSeedApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          title: 'Seed project',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}
