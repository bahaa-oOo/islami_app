import 'package:flutter/material.dart';
import 'package:islami/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final String? appBarTitle;
  final Widget? bottomNavigationBar;

  const AppScaffold({super.key, this.body, this.appBarTitle, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(themeProvider.mainBackground)),
      ),
      child: Scaffold(
        body: body,
        appBar: AppBar(
          title: Text(appBarTitle ?? ""),
        ),
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
