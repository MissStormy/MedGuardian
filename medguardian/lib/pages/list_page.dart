import 'package:flutter/material.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  int _selectedIndex = 3;

// Lista de widgets que representan las páginas del contenido de la aplicación.
  //static const List<Widget> _pages = <Widget>[
  // MyCreationPage(),
  // MyMapPage(),
  // MyHomePage(),
  // MyListPage(),
  // MyAlarmPage()
  //];

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
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 231, 193),
          //Left side of the appBar
          leading: Icon(Icons.account_circle),
          title: Text(
            "MedGuardian",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          //Right side of the appBar
          actions: [Icon(Icons.settings)],
        ),

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

        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.medication,
                    color: Colors.black,
                  ), // Icono para la primera página.
                  label: 'Crear',
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)
                  // Etiqueta para la primera página.
                  ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.place,
                      color: Colors.black), // Icono para la segunda página.
                  label: 'Mapa', // Etiqueta para la segunda página.
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home,
                      color: Colors.black), // Icono para la tercera página.
                  label: 'Home', // Etiqueta para la tercera página.
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list,
                      color: Colors.black), // Icono para la cuarta página.
                  label: 'Lista', // Etiqueta para la cuarta página.
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications,
                      color: Colors.black), // Icono para la quinta página.
                  label: 'Avisos', // Etiqueta para la quinta página.
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)),
            ],
            currentIndex:
                _selectedIndex, // Índice de la página actualmente seleccionada.
            selectedItemColor: Colors.blue,
            onTap:
                _onItemTapped // Función que se llama cuando se toca un ítem del BottomNavigationBar.
            ));
  }
}
