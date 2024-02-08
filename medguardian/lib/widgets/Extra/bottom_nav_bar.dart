import 'package:flutter/material.dart';
//import 'package:medguardian/pages/alarms_page.dart';
import 'package:medguardian/pages/creation/med_create.dart';
import 'package:medguardian/pages/home/home.dart';
//import 'package:medguardian/pages/list_page.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Container(
      height: 90.0, // Set the desired height
      decoration: BoxDecoration(
        color: actualTheme.colorScheme.secondary, // Set the background color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: actualTheme
            .colorScheme.secondary, // Make the BottomNavigationBar transparent
        selectedItemColor: Colors.white, // Set the selected item color
        unselectedItemColor:
            Colors.white.withOpacity(0.6), // Set the unselected item color
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _navigateToSelectedPage(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.medication),
              label: "",
              backgroundColor: actualTheme.colorScheme.secondary),
          BottomNavigationBarItem(
              icon: const Icon(Icons.place),
              label: "",
              backgroundColor: actualTheme.colorScheme.secondary),
          BottomNavigationBarItem(
            backgroundColor: actualTheme.colorScheme.secondary,
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: actualTheme
                    .colorScheme.primary, // Set the circular background color
              ),
              padding: const EdgeInsets.all(15.0), // Adjust padding as needed
              child: const Icon(Icons.home),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.list),
              label: "",
              backgroundColor: actualTheme.colorScheme.secondary),
          BottomNavigationBarItem(
              icon: const Icon(Icons.alarm),
              label: "",
              backgroundColor: actualTheme.colorScheme.secondary),
        ],
      ),
    );
  }

  //To change screen, we use this case
  void _navigateToSelectedPage(int index) {
    switch (index) {
      case 0:
        // _navigateToPage(const MyMedCreationPage());
        break;
      case 1:
        break;
      case 2:
        _navigateToPage(const MyHomePage());
        break;
      case 3:
        //_navigateToPage(const MyListPage());
        break;
      case 4:
        //_navigateToPage(const MyAlarmPage());
        break;
    }
  }

  void _navigateToPage(Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }
}
