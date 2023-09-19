import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/settings_bloc.bloc.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: controller.themeMode,
          onChanged: (newTheme) =>
              controller.add(SettingsEvent.update(newTheme)),
          items: [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text(S.of(context)!.systemTheme),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text(S.of(context)!.lightTheme),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text(S.of(context)!.darkTheme),
            )
          ],
        ),
      ),
    );
  }
}
