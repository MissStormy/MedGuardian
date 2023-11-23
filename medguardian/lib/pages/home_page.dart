import 'package:flutter/material.dart';
import 'package:medguardian/widgets/app_bar.dart';
import 'package:medguardian/widgets/bottom_nav_bar.dart';

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
          backgroundColor: const Color.fromARGB(255, 255, 231, 193),
          //Left side of the appBar
          leading: const Icon(Icons.account_circle),
          title: const Text(
            "MedGuardian",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          //Right side of the appBar
          actions: [const Icon(Icons.settings)],
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
        body: Container(
          child: Column(children: [
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
                padding: const EdgeInsets.only(bottom: 20),
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
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Mi medicacion"),
                    Icon(Icons.calendar_month)
                  ]),
            ),
            Container(
                height: 189,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: -1,
                        blurRadius: 10,
                        // offset: Offset(0,0),
                      )
                    ]),
                child: ListView(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.pin),
                              const Text("IBUROFENO"),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 231, 193),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: const Text("21:00"),
                              )
                            ])),
                    Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.pin),
                              const Text("IBUROFENO"),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 231, 193),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: const Text("21:00"),
                              )
                            ])),
                    Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.pin),
                              const Text("IBUROFENO"),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 231, 193),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: const Text("21:00"),
                              )
                            ])),
                    Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.pin),
                              const Text("IBUROFENO"),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 231, 193),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: const Text("21:00"),
                              )
                            ])),
                    Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.pin),
                              const Text("IBUROFENO"),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 231, 193),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: const Text("21:00"),
                              )
                            ])),
                    Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.pin),
                              const Text("IBUROFENO"),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 231, 193),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: const Text("21:00"),
                              )
                            ])),
                  ],
                )),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 231, 193),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3))
                          ]),
                      height: 180,
                      width: 180,
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(3)),
                          Text("Proximas citas"),
                          Padding(padding: EdgeInsets.all(3)),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Column(
                              children: [
                                Text("20/10 - 13 Nov"),
                                Text("Dr. Petunia")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 231, 193),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3))
                          ]),
                      height: 180,
                      width: 180,
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(3)),
                          Text("Lista de la compra"),
                          Padding(padding: EdgeInsets.all(3)),
                          Row(children: [
                          Checkbox(value: true, onChanged: (Bool) {}),
                          Text("Amoxicilina")
                          ],),
                          Row(children: [
                          Checkbox(value: false, onChanged: (Bool) {}),
                          Text("Ibuprofeno")
                          ],),
                        ],
                      ),
                    )
                  ]),
            )
          ]),
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
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.medication,
                    color: Colors.black,
                  ), // Icono para la primera página.
                  label: 'Crear',
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)
                  // Etiqueta para la primera página.
                  ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.place,
                      color: Colors.black), // Icono para la segunda página.
                  label: 'Mapa', // Etiqueta para la segunda página.
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)),
              BottomNavigationBarItem(
                  icon: Container(
                    // Contenedor para el botón "Home" sobresaliendo
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue, // Color del círculo
                    ),
                    child: const Icon(
                      Icons.home,
                      size: 30.0, // Tamaño del icono "Home"
                      color: Colors.white, // Color del icono "Home"
                    ),
                  ),
                  label: '',
                  backgroundColor: const Color.fromARGB(255, 255, 231, 193)),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.list,
                      color: Colors.black), // Icono para la cuarta página.
                  label: 'Lista', // Etiqueta para la cuarta página.
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.notifications,
                      color: Colors.black), // Icono para la quinta página.
                  label: 'Avisos', // Etiqueta para la quinta página.
                  backgroundColor: Color.fromARGB(255, 255, 231, 193)),
            ],
            currentIndex:
                _selectedIndex, // Índice de la página actualmente seleccionada.

            onTap:
                _onItemTapped // Función que se llama cuando se toca un ítem del BottomNavigationBar.
            ));}
}
