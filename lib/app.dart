import 'package:flutter/material.dart';
import 'package:personal_portfolio_app/screen/home_screen.dart' ;
import 'package:personal_portfolio_app/theme/theme.dart' ;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_portfolio_app/provider/theme_provider.dart' ;
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}