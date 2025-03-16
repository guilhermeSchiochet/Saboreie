import 'package:flutter/material.dart';
import 'package:saboreie/src/config/theme/app_theme.dart';
import 'package:saboreie/src/presentation/view/scaffold_main_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ScaffoldMainScreen(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
    );
  }
}