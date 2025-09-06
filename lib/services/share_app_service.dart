import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../utils/constants.dart';

class ShareAppService {
  static Future<void> shareApp(BuildContext context) async {
    final String link = "https://www.google.com";
    final String shareText = "Installe mon app ! ${AppConstants.appName}";
    final text = '$shareText : $link';

    final box = context.findRenderObject() as RenderBox?;
    final origin = (box != null)
        ? (box.localToGlobal(Offset.zero) & box.size)
        : const Rect.fromLTWH(0, 0, 0, 0);

    await SharePlus.instance.share(
      ShareParams(
        text: text,
        subject: AppConstants.appName,
        sharePositionOrigin: origin,
      ),
    );
  }
}
