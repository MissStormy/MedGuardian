//
//   =================
//   ||   </Miss    ||    Autor: LR and VA
//   ||   Stormy>   ||    Alias: Miss Stormy and Lokka
//   ||             ||    App: MedGuardian
//   ||   <Lokka>   ||    Web: missstormy.neocities.org
//   =================
//   //_____________\\
//

import 'package:flutter/material.dart';
import 'package:medguardian/pages/logging/logging_page.dart';
import 'package:medguardian/provider/falldetector.dart';
import 'package:medguardian/provider/guardian.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeLoader(0)),
        ChangeNotifierProvider(create: (_) => GuardianModeProvider()),
        ChangeNotifierProvider(create: (context) => AccelerometerProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    //Load the actual theme
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return MaterialApp(theme: actualTheme, home: const MyLoginPage());
  }
}
