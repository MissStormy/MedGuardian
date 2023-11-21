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
          //Left side of the appBar
          leading: Icon(Icons.account_circle),
          title: const Text(
            "MedGuardian",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          //Right side of the appBar
          actions: [Icon(Icons.settings)],
          elevation: 0,
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
        body: ListView(
          children: [
            Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 231, 193),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ]),
                height: 180,
                padding: EdgeInsets.only(
                  bottom: 20
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue, // Color del círculo
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 100,
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Padding(padding: EdgeInsets.all(20)),
                        Center(
                          child: Text(
                            'Bienvenido',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Agapito',
                            style: TextStyle(fontSize: 24),
                          ),
                        )
                      ],
                    )
                  ],
                )),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Row(children: [
                    Text("Patata")
                  ]),
                )
          ],
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
            items: <BottomNavigationBarItem>[
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
                icon: Container(
                  // Contenedor para el botón "Home" sobresaliendo
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue, // Color del círculo
                  ),
                  child: Icon(
                    Icons.home,
                    size: 30.0, // Tamaño del icono "Home"
                    color: Colors.white, // Color del icono "Home"
                  ),
                ),
                label: '',
                backgroundColor: Color.fromARGB(255, 255, 231, 193)
              ),
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

            onTap:
                _onItemTapped // Función que se llama cuando se toca un ítem del BottomNavigationBar.
            ));
  }
}
