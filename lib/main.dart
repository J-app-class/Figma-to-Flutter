import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SpookyFindApp());
}

class SpookyFindApp extends StatelessWidget {
  const SpookyFindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpookyFind',
      debugShowCheckedModeBanner:false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
