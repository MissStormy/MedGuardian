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
import 'package:medguardian/nexus.dart';
import 'package:medguardian/pages/home/home.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:medguardian/widgets/custom_bottom_app_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(//Load the provider
      ChangeNotifierProvider(create: (_) => ThemeLoader(0), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Load the actual theme
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return MaterialApp(theme: actualTheme, home: MyNexusPage());
  }
}
