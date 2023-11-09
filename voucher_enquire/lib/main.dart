import 'package:flutter/material.dart';
import 'package:voucher_enquire/ui/main_page.dart';
import 'package:voucher_enquire/ui/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  runApp(MaterialApp(
    // Translations not loaded at this point
    title: "Voucher Enquire",
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    theme: mainTheme,
    home: const MainPage(),
  ));
}
