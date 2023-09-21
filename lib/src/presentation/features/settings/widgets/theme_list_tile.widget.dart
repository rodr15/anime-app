import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/settings_bloc.bloc.dart';

class ThemeModeListTile extends StatelessWidget {
  const ThemeModeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsBloc>();

    return ListTile(
      title: Text(S.of(context)!.themeModeTitle),
      trailing: DropdownButton<ThemeMode>(
        value: controller.themeMode,
        onChanged: (newTheme) =>
            controller.add(SettingsEvent.updateTheme(newTheme)),
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
    );
  }
}
