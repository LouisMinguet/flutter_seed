import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seed/services/analytics_service.dart';

import '../utils/constants.dart';
import '../utils/url_launcher.dart';

class AnalyticsConsentDialog extends StatelessWidget {
  const AnalyticsConsentDialog({super.key});

  static const String TR_CODE = "analytics_consent";

  Future<void> _handleConsent(BuildContext context, bool consent) async {
    // Sauvegarder le choix et activer/désactiver Analytics
    await AnalyticsService.updateConsent(consent);

    // Fermer le dialog
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icône
            const _HeaderIcon(),
            const SizedBox(height: 16),

            // Titre
            Text(
              '$TR_CODE.title'.tr(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              '$TR_CODE.description'.tr(),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Points d'information
            const _InfoSection(),
            const SizedBox(height: 20),

            // Boutons
            _ActionButtons(onConsent: _handleConsent),
            const SizedBox(height: 8),

            // Lien politique de confidentialité (optionnel)
            const _PrivacyPolicyLink(),
          ],
        ),
      ),
    );
  }
}

// Widget pour l'icône d'en-tête
class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.analytics_outlined, size: 32, color: Colors.blue),
    );
  }
}

// Widget pour la section d'information
class _InfoSection extends StatelessWidget {
  const _InfoSection();

  static const String TR_CODE = "analytics_consent";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoRow(
            icon: Icons.shield_outlined,
            text: '$TR_CODE.anonymous'.tr(),
          ),
          const SizedBox(height: 8),
          _InfoRow(
            icon: Icons.person_off_outlined,
            text: '$TR_CODE.no_personal'.tr(),
          ),
          const SizedBox(height: 8),
          _InfoRow(icon: Icons.trending_up, text: '$TR_CODE.improve'.tr()),
        ],
      ),
    );
  }
}

// Widget pour une ligne d'information
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.green),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 12))),
      ],
    );
  }
}

// Widget pour les boutons d'action
class _ActionButtons extends StatelessWidget {
  final Future<void> Function(BuildContext, bool) onConsent;

  static const String TR_CODE = "analytics_consent";
  const _ActionButtons({required this.onConsent});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => onConsent(context, false),
            child: Text('$TR_CODE.decline'.tr()),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: () => onConsent(context, true),
            child: Text('$TR_CODE.accept'.tr()),
          ),
        ),
      ],
    );
  }
}

// Widget pour le lien de politique de confidentialité
class _PrivacyPolicyLink extends StatelessWidget {
  static const String TR_CODE = "analytics_consent";
  const _PrivacyPolicyLink();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        LinkLauncher.showLinkConfirmation(
          context,
          AppConstants.termsAndPrivacyUrl,
        );
      },
      child: Text(
        '$TR_CODE.privacy_policy'.tr(),
        style: TextStyle(
          fontSize: 12,
          color: Colors.blue[700],
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
