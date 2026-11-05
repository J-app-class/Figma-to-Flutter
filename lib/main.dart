import 'package:flutter/material.dart';
import 'package:spooky_find/app_theme.dart';
import 'package:spooky_find/screens/home_screen.dart';

void main() {
  runApp(const SpookyFindApp());
}

class SpookyFindApp extends StatelessWidget {
  const SpookyFindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpookyFind',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
