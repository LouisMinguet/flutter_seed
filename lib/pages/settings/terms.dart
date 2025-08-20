// lib/pages/settings/terms.dart
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../utils/constants.dart';
import '../../widgets/separators.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  static const String TR_CODE = "terms";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$TR_CODE.title".tr()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppConstants.normalSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$TR_CODE.content".tr(namedArgs: {
                  "appName": AppConstants.appName,
                  "supportEmail": AppConstants.supportEmail,
                }),
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              Separator.xl(),

              Center(
                child: Text(
                  "${AppConstants.appName} — ${AppConstants.companyName} © ${DateTime.now().year}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
