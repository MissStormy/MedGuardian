import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  int _selectedIndex = 2;

  // Método que se llama cuando se toca uno de los elementos del BottomNavigationBar.
  void _onItemTapped(int index) {
    // Actualiza el estado para cambiar la página seleccionada.
    // setState(() {
    //   _selectedIndex = index;
    // });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        //###################### AppBar ##########################
        //# The top of the screen will have the settings and     #
        //# profile buttons, plus a welcome for the user, with   #
        //# their image and personalised welcome.                #
        //########################################################
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 231, 193),
        ),
        //###################### Body ##########################
        //# The body will be a scroll-pane, and has:           #
        //# · My medication: A list of the pills they have to  #
        //#   take that day, with a photo of the pill, the     #
        //#   name of the pill and a button with the hour that #
        //#   they have to take it. If you push it, it takes   #
        //#   you to the alarms page (WIP).                    #
        //# · Calendar button                                  #
        //# · Two containers: (WIP) Future doctor appointments #
        //#   and the buying list for when the pills are low   #
        //######################################################
        body: Container(
          color: Colors.white,
          child: Center(
              child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 231, 193),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            width: 400,
            height: 200,
          )),
        ),
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
                  icon: Icon(Icons.medication), // Icono para la primera página.
                  label: 'Crear',
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)
                  // Etiqueta para la primera página.
                  ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.place), // Icono para la segunda página.
                  label: 'Mapa', // Etiqueta para la segunda página.
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), // Icono para la tercera página.
                  label: 'Home', // Etiqueta para la tercera página.
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), // Icono para la cuarta página.
                  label: 'Lista', // Etiqueta para la cuarta página.
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)),
              BottomNavigationBarItem(
                  icon:
                      Icon(Icons.notifications), // Icono para la quinta página.
                  label: 'Avisos', // Etiqueta para la quinta página.
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)),
            ],
            currentIndex:
                _selectedIndex, // Índice de la página actualmente seleccionada.
            onTap:
                _onItemTapped // Función que se llama cuando se toca un ítem del BottomNavigationBar.
            ));
  }
}
