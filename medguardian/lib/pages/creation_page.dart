import 'package:flutter/material.dart';
import 'package:medguardian/pages/creation_page.dart';
import 'package:medguardian/pages/map_page.dart';
import 'package:medguardian/pages/home_page.dart';
import 'package:medguardian/pages/list_page.dart';
import 'package:medguardian/pages/alarms_page.dart';
import 'package:medguardian/widgets/app_bar.dart';
import 'package:medguardian/widgets/bottom_nav_bar.dart';

class MyCreationPage extends StatefulWidget {
  const MyCreationPage({super.key});

  @override
  State<MyCreationPage> createState() => _MyCreationPageState();
}

class _MyCreationPageState extends State<MyCreationPage> {
  int _selectedIndex = 0;

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

  TextEditingController pillNameController = TextEditingController();
  TextEditingController enterpriseNameController = TextEditingController();
  TextEditingController pillsPerBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //###################### AppBar ##########################
        //# The top of the screen will have the settings and     #
        //# profile buttons                                      #
        //########################################################
        appBar: CustomAppBar(),
        //###################### Body ##########################

        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            //Pill name TextField
            TextFormField(
              controller: pillNameController,
              decoration:
                  InputDecoration(labelText: "Introduce nombre de pirula"),
            ),
            SizedBox(height: 16.0),
            //Enterprise name TextField
            TextFormField(
              controller: enterpriseNameController,
              decoration:
                  InputDecoration(labelText: "Introduce nombre de empresa"),
            ),
            SizedBox(height: 16.0),
            //Pills per box TextField
            TextFormField(
              controller: pillsPerBoxController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Introduce cantidad por caja"),
            ),
            SizedBox(height: 20.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              //Pill photo image picker
              InkWell(
                  onTap: () {
                    //Here's supposed to go the code to pick the photo from the gallery
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Icon(Icons.camera_alt),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Introduce pirula")
                    ],
                  )),
              SizedBox(height: 10),
              //Box photo image picker
              InkWell(
                  onTap: () {
                    //Here's supposed to go the code to pick the photo from the gallery
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Icon(Icons.camera_alt),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Introduce caja")
                    ],
                  )),
              SizedBox(height: 10),
            ]),
            SizedBox(height: 30),

            //Save and Cancel buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Save")),
                ElevatedButton(onPressed: () {}, child: Text("Cancel"))
              ],
            )
          ]),
        ),
        //###################### BottomNavBar #####################

        bottomNavigationBar: CustomNavBar());
  }
}
