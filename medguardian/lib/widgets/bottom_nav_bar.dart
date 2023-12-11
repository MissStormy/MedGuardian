import 'package:flutter/material.dart';
import 'package:medguardian/pages/alarms_page.dart';
import 'package:medguardian/pages/creation_page.dart';
import 'package:medguardian/pages/home_page.dart';
import 'package:medguardian/pages/list_page.dart';
import 'package:medguardian/pages/map_page.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: const Color.fromARGB(255, 89, 190, 194),
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        _navigateToSelectedPage(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.medication),
          label: "Creation",
          backgroundColor: Color.fromARGB(255, 89, 190, 194),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.place),
          label: "Map",
          backgroundColor: Color.fromARGB(255, 89, 190, 194),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Color.fromARGB(255, 89, 190, 194),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "Lista",
          backgroundColor: Color.fromARGB(255, 89, 190, 194),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm),
          label: "Alarmas",
          backgroundColor: Color.fromARGB(255, 89, 190, 194),
        )
      ],
    );
  }

  //To change screen, we use this case
  void _navigateToSelectedPage(int index) {
    switch (index) {
      case 0:
        _navigateToPage(const MyCreationPage());
        break;
      case 1:
        _navigateToPage(const MyMapPage());
        break;
      case 2:
        _navigateToPage(const MyHomePage());
        break;
      case 3:
        _navigateToPage(const MyListPage());
        break;
      case 4:
        _navigateToPage(const MyAlarmPage());
        break;
    }
  }

  void _navigateToPage(Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }
}
