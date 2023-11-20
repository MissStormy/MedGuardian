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
import 'package:medguardian/pages/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyListPage());
  }
}
