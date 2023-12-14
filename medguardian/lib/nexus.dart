import 'package:flutter/material.dart';
import 'package:medguardian/pages/alarms_page.dart';
import 'package:medguardian/pages/creation/med_create.dart';
import 'package:medguardian/pages/home/home.dart';
import 'package:medguardian/pages/list_page.dart';
import 'package:medguardian/pages/map_page.dart';
import 'package:medguardian/widgets/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';



class MyNexusPage extends StatefulWidget {
  @override
  _MyNexusPageState createState() => _MyNexusPageState();
}

class _MyNexusPageState extends State<MyNexusPage> {
  int _selectedIndex = 0;

  List<Widget> _screens = [
    MyMedCreationPage(),
    MyMapPage(),
    MyHomePage(),
    MyListPage(),
    MyAlarmPage()
  ];

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      //###################### AppBar ##########################
      appBar: CustomAppBar(),
      //###################### Body ##########################
      body: _screens[_selectedIndex],
      //###################### Bottom Nav Bar ##########################
      bottomNavigationBar: BottomAppBar(
        color: actualTheme.colorScheme.secondary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                _selectedIndex = 0;
              },
              icon: const Icon(Icons.medication),
              color: Colors.white,
            ),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(
                  right: 25), 
              child: IconButton(
                onPressed: () {
                  _selectedIndex = 1;
                },
                icon: const Icon(Icons.place),
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: IconButton(
                onPressed: () {
                  _selectedIndex = 3;
                },
                icon: const Icon(Icons.list),
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {
                _selectedIndex = 4;
              },
              icon: const Icon(Icons.alarm),
              color: Colors.white,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _selectedIndex = 2;
        },
        child: Icon(Icons.home, color: Colors.white),
        backgroundColor: actualTheme.colorScheme.primary,
        elevation: 5,
        shape: CircleBorder(), // Set the shape to CircleBorder
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _navigateToScreen(String route) {
    // Navegar a la pantalla correspondiente
    Navigator.pushNamed(context, route);
  }
}
