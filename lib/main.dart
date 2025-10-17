import 'package:flutter/material.dart';
import 'package:personal_portfolio_app/app.dart';
import 'package:personal_portfolio_app/preferneces/theme_preferences.dart';
import 'package:personal_portfolio_app/theme/theme.dart' ;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_portfolio_app/provider/theme_provider.dart' ;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final saveTheme = await ThemePreferences.loadThemeMode();
  runApp(
    ProviderScope(
      overrides: [
        themeProvider.overrideWith(
            (ref) => ThemeNotifier(saveTheme) ,
        ),
      ],
      child: MyApp(),
      ),
    );
}



