import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/settings_bloc.bloc.dart';

class LanguageListTile extends StatelessWidget {
  const LanguageListTile({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsBloc>();

    return ListTile(
      title: Text(S.of(context)!.lenguajeTitle),
      trailing: DropdownButton<Locale>(
        value: controller.locale,
        onChanged: (newLocale) =>
            controller.add(SettingsEvent.updateLocale(newLocale)),
        items: S.supportedLocales
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e.languageCode),
              ),
            )
            .toList(),
      ),
    );
  }
}
