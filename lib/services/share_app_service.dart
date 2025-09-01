import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../utils/constants.dart';

class ShareAppService {
  static Future<void> shareApp(BuildContext context) async {
    // Construire le lien du store en fonction de la plateforme
    final link = Platform.isAndroid
        ? 'https://play.google.com/store/apps/details?id=${AppConstants.androidAppId}'
        : 'https://apps.apple.com/app/${AppConstants.iOSAppId}';

    // Texte à partager
    final text = 'Installe mon app ! ${AppConstants.appName} : $link';

    // Origine (obligatoire pour iPad sinon crash/écran figé)
    final box = context.findRenderObject() as RenderBox?;
    final origin = (box != null)
        ? (box.localToGlobal(Offset.zero) & box.size)
        : const Rect.fromLTWH(0, 0, 0, 0);

    await SharePlus.instance.share(
      ShareParams(
        text: text,
        subject: 'Découvre ${AppConstants.appName}',
        sharePositionOrigin: origin,
      ),
    );
  }
}
