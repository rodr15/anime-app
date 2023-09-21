import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/language_list_tile.widget.dart';
import 'widgets/theme_list_tile.widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)!.settingsTitle),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [ThemeModeListTile(), LanguageListTile()],
        ),
      ),
    );
  }
}
