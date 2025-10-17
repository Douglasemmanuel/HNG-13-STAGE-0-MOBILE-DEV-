import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:personal_portfolio_app/preferneces/theme_preferences.dart'  ;

class ThemeNotifier extends StateNotifier<ThemeMode>{

  ThemeNotifier(ThemeMode intialMode):super(intialMode);

  Future<void>toggleThme()async{
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light ;
    await  ThemePreferences.saveThemeMode(state) ;
  }
}
final themeProvider = StateNotifierProvider<ThemeNotifier , ThemeMode>(
    (ref) => throw UnimplementedError('Override themeProvider in main.dart'),
    );