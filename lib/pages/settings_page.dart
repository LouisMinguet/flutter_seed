// lib/pages/settings_page.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../services/share_app_service.dart';
import '../utils/constants.dart';
import '../utils/logger.dart';
import '../widgets/separators.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Code de traduction pour cette page
  static const String TR_CODE = "settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$TR_CODE.title".tr())),
      body: SafeArea(
        child: ListView(
          children: [
            // --------- General ----------
            _SectionHeader("$TR_CODE.general".tr()),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text("$TR_CODE.language".tr()),
              subtitle: Text(
                context.locale.languageCode == 'en'
                    ? "English"
                    : context.locale.languageCode == 'fr'
                    ? "Français"
                    : "Español",
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                logger.i("Changing language");

                final RenderBox button =
                    context.findRenderObject() as RenderBox;
                final RenderBox overlay =
                    Overlay.of(context).context.findRenderObject() as RenderBox;

                final selected = await showMenu<Locale>(
                  context: context,
                  position: RelativeRect.fromRect(
                    Rect.fromPoints(
                      button.localToGlobal(Offset.zero, ancestor: overlay),
                      button.localToGlobal(
                        button.size.bottomRight(Offset.zero),
                        ancestor: overlay,
                      ),
                    ),
                    Offset.zero & overlay.size,
                  ),
                  items: [
                    const PopupMenuItem(
                      value: Locale('en'),
                      child: Text("🇬🇧 English"),
                    ),
                    const PopupMenuItem(
                      value: Locale('fr'),
                      child: Text("🇫🇷 Français"),
                    ),
                    const PopupMenuItem(
                      value: Locale('es'),
                      child: Text("🇪🇸 Español"),
                    ),
                  ],
                );

                if (selected != null) {
                  await context.setLocale(selected);
                  setState(() {});
                }
              },
            ),

            Separator.normal(),

            // --------- Support ----------
            _SectionHeader("$TR_CODE.support".tr()),
            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: Text("$TR_CODE.share".tr()),
              onTap: () async {
                logger.i("Sharing app");

                ShareAppService.shareApp(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.mail_outline),
              title: Text("$TR_CODE.contact".tr()),
              subtitle: Text(AppConstants.supportEmail),
              onTap: () async {
                // Copy email to clipboard and show a snackbar
                await Clipboard.setData(
                  const ClipboardData(text: AppConstants.supportEmail),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$TR_CODE.copied_email".tr())),
                  );
                }
                logger.i("Contacting support");
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: Text("$TR_CODE.terms".tr()),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                logger.i("Terms of service");
                context.pushNamed('terms');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text("$TR_CODE.about".tr()),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                logger.i("About page");
                context.pushNamed('about');
              },
            ),

            Separator.small(),

            // --------- Footer ----------
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(
                  "${AppConstants.appName} — ${AppConstants.companyName} © ${DateTime.now().year}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String text;
  const _SectionHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppConstants.normalSpace,
        AppConstants.smallSpace,
        AppConstants.normalSpace,
        AppConstants.smallSpace,
      ),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
