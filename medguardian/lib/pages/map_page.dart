import 'package:flutter/material.dart';
import 'package:medguardian/pages/creation_page.dart';
import 'package:medguardian/pages/map_page.dart';
import 'package:medguardian/pages/home_page.dart';
import 'package:medguardian/pages/list_page.dart';
import 'package:medguardian/pages/alarms_page.dart';
import 'package:medguardian/widgets/app_bar.dart';
import 'package:medguardian/widgets/bottom_nav_bar.dart';

class MyMapPage extends StatefulWidget {
  const MyMapPage({super.key});

  @override
  State<MyMapPage> createState() => _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {
  int _selectedIndex = 1;

// Lista de widgets que representan las páginas del contenido de la aplicación.
  static const List<Widget> _pages = <Widget>[
    MyCreationPage(),
    MyMapPage(),
    MyHomePage(),
    MyListPage(),
    MyAlarmPage()
  ];

  // Método que se llama cuando se toca uno de los elementos del BottomNavigationBar.
  void _onItemTapped(int index) {
    // Actualiza el estado para cambiar la página seleccionada.
    setState(() {
      //_selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //###################### AppBar ##########################
        //# The top of the screen will have the settings and     #
        //# profile buttons                                      #
        //########################################################
        appBar: CustomAppBar(),
        //###################### Body ##########################

        body: Column(
          children: [
            //Map of the zone
            Container(
                margin: EdgeInsets.all(10),
                height: 300,
                width: 300,
                child: Text("Mira que mapa mas guapo"),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ])),
            //List of medical center
            Expanded(
              child: ListView(
                children: [
                  ListTile(title: Text("Medical centre 1")),
                  ListTile(
                    title: Text("Medical centre 2"),
                  )
                ],
              ),
            )
          ],
        ),
        //###################### BottomNavBar #####################

        bottomNavigationBar: CustomNavBar());
  }
}
