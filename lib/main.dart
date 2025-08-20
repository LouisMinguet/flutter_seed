import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seed/utils/router.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation easy_localization
  await EasyLocalization.ensureInitialized();

  // Initialisation Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
        Locale('es'),
      ],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations', // Dossier où tu stockes tes fichiers JSON
      child: const FlutterSeedApp(),
    ),
  );
}

class FlutterSeedApp extends StatelessWidget {
  const FlutterSeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          title: 'Seed project',
          debugShowCheckedModeBanner: false,
          routerConfig: router,

          // --- Ajout de la localisation ---
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}
