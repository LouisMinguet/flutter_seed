import 'package:flutter/material.dart';
import 'package:flutter_seed/utils/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/analytics_service.dart';

class LinkLauncher {
  static Future<void> showLinkConfirmation(
    BuildContext context,
    String url,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false, // L'utilisateur doit faire un choix
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Redirection externe'),
          content: Text(
            'Attention, vous allez être redirigé vers le site \'$url\'',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      await _openLink(url);
    }
  }

  static Future<void> _openLink(String url) async {
    try {
      AnalyticsService.logEvent(
        name: "open_link_privacy",
        parameters: {"url": url},
      );

      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (e) {
      logger.e('Erreur lors de l\'ouverture du lien: $e');
    }
  }
}
