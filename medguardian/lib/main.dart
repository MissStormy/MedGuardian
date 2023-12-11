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
import 'package:medguardian/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

/*This would be the way to load the themes so all the pages get notified

void main() {
  runApp(
    //Cargamos en el nivel más alto de la aplicación el provider
    //En dicho provider cargamos el tema actual
    ChangeNotifierProvider(
      //cargamos el tema claro por defecto
      create: (_) => CargadorTema(0),
      child: MyApp())
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    //cargamos el tema actual del provider
    final temaActual=Provider.of<CargadorTema>(context).temaActual;
    
    return MaterialApp(
      title: 'Medicame',
      theme: temaActual,
      home: const PaginaPrincipal(),
    );
  }
}
 */