import 'package:flutter/material.dart';
import 'package:places_search/features/settings/data/theme_repository.dart';
import 'package:places_search/features/settings/ui/settings_screen.dart';
import 'package:places_search/features/settings/ui/settings_wm.dart';
import 'package:provider/provider.dart';

class SettingsScreenBuilder extends StatelessWidget {
  const SettingsScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ISettingsWM>(
      create: (context) {
        final themeRepository = context.read<ThemeRepository>();
        return SettingsWM(themeRepository);
      },
      child: Consumer<ISettingsWM>(
        builder: (context, wm, child) {
          return SettingsScreen(wm: wm);
        },
      ),
    );
  }
}
