import 'package:flutter/material.dart';
import 'package:medguardian/pages/creation_page.dart';
import 'package:medguardian/pages/map_page.dart';
import 'package:medguardian/pages/home_page.dart';
import 'package:medguardian/pages/list_page.dart';
import 'package:medguardian/pages/alarms_page.dart';
import 'package:medguardian/widgets/app_bar.dart';
import 'package:medguardian/widgets/bottom_nav_bar.dart';

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({super.key});

  @override
  State<MySettingsPage> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  int _selectedIndex = 2;

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
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //###################### AppBar ##########################
        //# The top of the screen will have the settings and     #
        //# profile buttons                                      #
        //########################################################
        appBar: const CustomAppBar(),
        //###################### Body ##########################
        //# The body will be a scroll-pane, and has:           #
        //# · Different containers for the different pills     #
        //# · In each container (for now, for view):           #
        //# · Display container:                               #
        //#    · Three buttons: Modify, Erase, Favorite        #
        //#    · Image of pill and box                         #
        //#    · Name of the pill                              #
        //#    · Button to create treatment                    #
        //# · List containers:                                 #
        //#    · Image of the pill as icon                     #
        //#    · Name of the pill                              #
        //#    · Three dots button: Modify, Erase, Favorite    #
        //# · Big button to create new medication              #
        //######################################################
        body: Container(),
        //###################### BottomNavBar #####################
        //# The lower zone will have the navigation bar, it has:  #
        //# · Creation button: It opens to the creation page and  #
        //#   you can choose to create a medication, or a         #
        //#   treatment.                                          #
        //# · Map button: It takes you to the page with the map   #
        //# · Home button: Returns you to the home page           #
        //# · List button: Takes you to the list of the pills     #
        //# · Alarms button: Takes you to the list of alarms      #
        //#########################################################
        bottomNavigationBar: const CustomNavBar());
  }
}
