import 'package:flutter/material.dart';
import 'package:medguardian/pages/creation/create_nexus.dart';
import 'package:medguardian/pages/home/home.dart';
import 'package:medguardian/pages/lists/med_list.dart';
import 'package:medguardian/pages/lists/treat_list.dart';
import 'package:medguardian/pages/location/map.dart';
import 'package:medguardian/pages/medical_dates/medical_date.dart';
import 'package:medguardian/pages/user/profile.dart';
import 'package:medguardian/pages/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MyNexusPage extends StatefulWidget {
  @override
  _MyNexusPageState createState() => _MyNexusPageState();
}

class _MyNexusPageState extends State<MyNexusPage> {
  int _selectedIndex = 2;

  List<Widget> _screens = [
    MyMedicalDatePage(),
    MyMapPage(),
    MyHomePage(),
    MyMedListPage(),
    MyTreatmentList(),
    MySettingsPage(),
    MyProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      //###################### AppBar ##########################
      appBar: AppBar(
        backgroundColor: actualTheme.colorScheme.secondary,
        //Left side of the appbar
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {
            setState(() {
              _selectedIndex = 6;
            });
          },
        ),
        //Center: Title and image logo
        title: Row(
          children: [
            const Spacer(), // Spacer to center the logo
            Image.asset(
              'assets/logo.png',
              width: 60.0,
            ),
            const Spacer(), // Spacer to center the logo
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 5;
                });
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      //###################### Body ##########################
      body: _screens[_selectedIndex],
      //###################### Bottom Nav Bar ##########################
      bottomNavigationBar: BottomAppBar(
        color: actualTheme.colorScheme.secondary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        shadowColor: actualTheme.colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              icon: const Icon(Icons.calendar_month),
              color: Colors.white,
            ),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
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
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
                icon: const Icon(Icons.list),
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 4;
                });
              },
              icon: const Icon(Icons.alarm),
              color: Colors.white,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        child: Icon(Icons.home, color: Colors.white),
        backgroundColor: actualTheme.colorScheme.onPrimary,
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
