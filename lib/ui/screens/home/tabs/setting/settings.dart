import 'package:flutter/material.dart';
import 'package:islami/ui/providers/language_provider.dart';
import 'package:islami/ui/providers/theme_provider.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_styles.dart';
import 'package:islami/ui/utils/extenisons.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late LanguageProvider provider;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    themeProvider = Provider.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.localizations.language,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: 18),
          buildLanguageMenu(),
          SizedBox(height: 18),
          Row(
            children: [
              Text(
                context.localizations.theme,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Spacer(),
              buildThemeSwitch(themeProvider),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLanguageMenu() => DropdownButton(
    value: provider.selectedLanguage,
    items: [
      DropdownMenuItem<String>(value: "ar", child: Text("العربية",style:Theme.of(context).textTheme.displaySmall ,),),
      DropdownMenuItem<String>(value: "en", child: Text("English",style:Theme.of(context).textTheme.displaySmall)),
    ],
    isExpanded: true,
    onChanged: (newLanguageCode) {
      provider.newLanguage = newLanguageCode ?? provider.selectedLanguage;

      setState(() {});
    },
  );

  Widget buildThemeSwitch(ThemeProvider themeProvider) => Switch(
    value: themeProvider.isDarkThemeEnable,
    activeColor: AppColors.primary,
    onChanged: (newValue) async {
      ThemeMode newThemeMode = newValue ? ThemeMode.dark : ThemeMode.light;
      await themeProvider.setNewTheme(newThemeMode);
    },
  );
}

