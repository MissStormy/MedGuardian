import 'package:flutter/material.dart';
import 'package:medguardian/pages/alarms_page.dart';
import 'package:medguardian/pages/creation_page.dart';
import 'package:medguardian/pages/home/home.dart';
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
     return Container(
    height: 90.0, // Set the desired height
    decoration: BoxDecoration(
      color: Color(0xFF8F614B), // Set the background color
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 4,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    child: BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: Color(0xFF8F614B), // Make the BottomNavigationBar transparent
      selectedItemColor: Colors.white, // Set the selected item color
      unselectedItemColor: Colors.white.withOpacity(0.6), // Set the unselected item color
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        _navigateToSelectedPage(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.medication),
          label: "",
          backgroundColor: Color(0xFF8F614B)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.place),
          label: "",
          backgroundColor: Color(0xFF8F614B)
        ),
        BottomNavigationBarItem(
          backgroundColor: Color(0xFF8F614B),
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFB69B7D), // Set the circular background color
            ),
            padding: EdgeInsets.all(15.0), // Adjust padding as needed
            child: Icon(Icons.home),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "",
          backgroundColor: Color(0xFF8F614B)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm),
          label: "",
          backgroundColor: Color(0xFF8F614B)
        ),
      ],
    ),
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
