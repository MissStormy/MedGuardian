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
  Widget build(BuildContext context) {
    return Scaffold(
        //###################### AppBar ##########################
        //# The top of the screen will have the settings and     #
        //# profile buttons, plus a welcome for the user, with   #
        //# their image and personalised welcome.                #
        //########################################################
        appBar: const CustomAppBar(),
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
                    color: Color.fromARGB(255, 177, 244, 250),
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
                                    color: Color.fromARGB(255, 177, 244, 250),
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
                                    color: Color.fromARGB(255, 177, 244, 250),
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
                                    color: Color.fromARGB(255, 177, 244, 250),
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
                                    color: Color.fromARGB(255, 177, 244, 250),
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
                                    color: Color.fromARGB(255, 177, 244, 250),
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
                                    color: Color.fromARGB(255, 177, 244, 250),
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
                          color: Color.fromARGB(255, 177, 244, 250),
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
                      height: 214,
                      width: 180,
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          const Padding(padding: EdgeInsets.all(3)),
                          const Text("Proximas citas"),
                          const Padding(padding: EdgeInsets.all(3)),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            child: const Column(
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
                          color: Color.fromARGB(255, 177, 244, 250),
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
                      height: 214,
                      width: 180,
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          const Padding(padding: EdgeInsets.all(3)),
                          const Text("Lista de la compra"),
                          const Padding(padding: EdgeInsets.all(3)),
                          Row(children: [
                          Checkbox(value: true, onChanged: (Bool) {}),
                          const Text("Amoxicilina")
                          ],),
                          Row(children: [
                          Checkbox(value: false, onChanged: (Bool) {}),
                          const Text("Ibuprofeno")
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
        bottomNavigationBar: const CustomNavBar(),
        );
    }
}
