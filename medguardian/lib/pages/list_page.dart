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
          title: const Text(
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
        body: ListView(children: [
          // Container grande
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 231, 193),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            height: 250,
            child: Row(children: [
              // Botones a la izquierda
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción para el botón Modificar
                    },
                    child: Text('Modificar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para el botón Borrar
                    },
                    child: Text('Borrar'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Acción para el botón Favorito
                    },
                    icon: Icon(Icons.star),
                    label: Text('Favorito'),
                  ),
                ],
              ),
              SizedBox(
                  width: 16.0), // Espaciado entre botones y contenido central
              // Contenido central
              Column(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // Color del círculo
                    ),
                    child: Center(
                      child: Icon(
                        Icons.medication,
                        size: 50.0, // Tamaño del icono central
                        color: Colors.blue, // Color del icono central
                      ),
                    ),
                  ),
                  SizedBox(
                      height:
                          8.0), // Espaciado entre icono y texto "Ibuprofeno"
                  Text(
                    'Ibuprofeno',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  Text(
                    '400mg',
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  SizedBox(
                      height:
                          16.0), // Espaciado entre texto "Ibuprofeno" y botón

                  ElevatedButton(
                    onPressed: () {
                      // Acción para el botón Crear tratamiento
                    },
                    child: Text('Crear tratamiento'),
                  ),
                ],
              ),
              SizedBox(
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
                          padding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 8.0),
                        ),
                        child: Text('Crear tratamiento'),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          // Primer rectángulo pequeño con ListTile
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 231, 193),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: ListTile(
              title: Row(
                children: [
                  Container(
                    width:
                        50.0, // Ajusta el tamaño del círculo según tus necesidades
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green, // Color del círculo
                    ),
                    child: Center(
                      child: Icon(
                        Icons.medication,
                        color: Colors.white, // Color del icono
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0), // Espaciado entre el icono y el texto
                  Text(
                    'Ibuprofeno',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              trailing: Icon(Icons.more_horiz, color: Colors.black),
            ),
            height: 100,
          ),

          // Segundo rectángulo pequeño
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 231, 193),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: ListTile(
              title: Row(
                children: [
                  Container(
                    width:
                        50.0, // Ajusta el tamaño del círculo según tus necesidades
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green, // Color del círculo
                    ),
                    child: Center(
                      child: Icon(
                        Icons.medication,
                        color: Colors.white, // Color del icono
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0), // Espaciado entre el icono y el texto
                  Text(
                    'Ibuprofeno',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              trailing: Icon(Icons.more_horiz, color: Colors.black),
            ),
            height: 100,
          ),
          // Tercer rectángulo pequeño
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 231, 193),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: ListTile(
              title: Row(
                children: [
                  Container(
                    width:
                        50.0, // Ajusta el tamaño del círculo según tus necesidades
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green, // Color del círculo
                    ),
                    child: Center(
                      child: Icon(
                        Icons.medication,
                        color: Colors.white, // Color del icono
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0), // Espaciado entre el icono y el texto
                  Text(
                    'Ibuprofeno',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              trailing: Icon(Icons.more_horiz, color: Colors.black),
            ),
            height: 100,
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
