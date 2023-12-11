import 'package:flutter/material.dart';
import 'package:medguardian/widgets/app_bar.dart';
import 'package:medguardian/widgets/bottom_nav_bar.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  final int _selectedIndex = 3;

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
        body: ListView(children: [
          // Container grande
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 177, 244, 250),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            height: 204,
            child: Row(children: [
              // Botones a la izquierda
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción para el botón Modificar
                    },
                    child: const Text('Modificar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para el botón Borrar
                    },
                    child: const Text('Borrar'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Acción para el botón Favorito
                    },
                    icon: const Icon(Icons.star),
                    label: const Text('Favorito'),
                  ),
                ],
              ),
              const SizedBox(
                  width: 16.0), // Espaciado entre botones y contenido central
              // Contenido central
              Column(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(
                          255, 255, 255, 255), // Color del círculo
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.medication,
                        size: 50.0, // Tamaño del icono central
                        color: Colors.blue, // Color del icono central
                      ),
                    ),
                  ),
                  const SizedBox(
                      height:
                          8.0), // Espaciado entre icono y texto "Ibuprofeno"
                  const Text(
                    'Ibuprofeno',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  const Text(
                    '400mg',
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  const SizedBox(
                      height:
                          16.0), // Espaciado entre texto "Ibuprofeno" y botón
                ],
              ),
              const SizedBox(
                  width:
                      16.0), // Espaciado entre contenido central y contenido de la derecha
              // Contenido a la derecha
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Rotar el texto del botón "Crear tratamiento"
                    RotatedBox(
                      quarterTurns: 3,
                      child: ElevatedButton(
                        onPressed: () {
                          // Acción para el botón Crear tratamiento
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 20.0),
                        ),
                        child: const Text('Crear tratamiento'),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          // Primer rectángulo pequeño con ListTile
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 177, 244, 250),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            height: 60,
            child: ListTile(
              title: Row(
                children: [
                  Container(
                    width:
                        50.0, // Ajusta el tamaño del círculo según tus necesidades
                    height: 50.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          Color.fromARGB(255, 28, 68, 107), // Color del círculo
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.medication,
                        color: Colors.white, // Color del icono
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0), // Espaciado entre el icono y el texto
                  const Text(
                    'Ibuprofeno',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              trailing: const Icon(Icons.more_horiz, color: Colors.black),
            ),
          ),

          // Segundo rectángulo pequeño
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 177, 244, 250),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            height: 60,
            child: ListTile(
              title: Row(
                children: [
                  Container(
                    width:
                        50.0, // Ajusta el tamaño del círculo según tus necesidades
                    height: 50.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          Color.fromARGB(255, 28, 68, 107), // Color del círculo
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.medication,
                        color: Colors.white, // Color del icono
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0), // Espaciado entre el icono y el texto
                  const Text(
                    'Ibuprofeno',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              trailing: const Icon(Icons.more_horiz, color: Colors.black),
            ),
          ),
          // Tercer rectángulo pequeño
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 177, 244, 250),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            height: 60,
            child: ListTile(
              title: Row(
                children: [
                  Container(
                    width:
                        50.0, // Ajusta el tamaño del círculo según tus necesidades
                    height: 50.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          Color.fromARGB(255, 28, 68, 107), // Color del círculo
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.medication,
                        color: Colors.white, // Color del icono
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0), // Espaciado entre el icono y el texto
                  const Text(
                    'Ibuprofeno',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              trailing: const Icon(Icons.more_horiz, color: Colors.black),
            ),
          ),
        ]),

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
