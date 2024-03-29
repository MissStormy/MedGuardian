import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medguardian/notifs/alarm.dart';
import 'package:medguardian/pages/creation/med_create.dart';
import 'package:medguardian/pages/creation/treat_create.dart';
import 'package:medguardian/pages/home/home.dart';
import 'package:medguardian/pages/lists/med_list.dart';
import 'package:medguardian/pages/lists/treat_list.dart';
import 'package:medguardian/pages/location/map.dart';
import 'package:medguardian/pages/medical_dates/chat_room.dart';
import 'package:medguardian/pages/medical_dates/doctors.dart';
import 'package:medguardian/pages/medical_dates/medical_date.dart';
import 'package:medguardian/pages/user/profile.dart';
import 'package:medguardian/pages/user/settings.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:sensors_plus/sensors_plus.dart';

//This page holds the whole App, it works as a nexus for all the screens and things.
//The AppBar and BottomNavBar are always active, and the only thing that changes is the screen.
//This way, you use less resources because you don't have to reload the top/bottom every time
//you change screen.

class MyNexusPage extends StatefulWidget {
  const MyNexusPage({super.key});

  @override
  _MyNexusPageState createState() => _MyNexusPageState();
}

class _MyNexusPageState extends State<MyNexusPage> {
  int _selectedIndex = 2;
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;
  static const double fallThreshold = 80.0;
  bool _isDialogShowing = false;

  @override
  void initState() {
    super.initState();
    _initAccelerometer();
  }

  @override
  void dispose() {
    _accelerometerSubscription.cancel();
    super.dispose();
  }

  void _initAccelerometer() {
    _accelerometerSubscription =
        accelerometerEventStream().listen((AccelerometerEvent event) {
      final double speed = event.x.abs() + event.y.abs() + event.z.abs();
      print('Speed: $speed');
      if (speed > fallThreshold && !_isDialogShowing) {
        _isDialogShowing = true;
        _accelerometerSubscription.cancel();
        showDialog(
          context: context,
          barrierDismissible:
              false, // Prevent dialog dismissal by tapping outside
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Are you okay?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    _initAccelerometer();
                    _isDialogShowing = false;
                  },
                  child: const Text('Yes'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Here you have all the main screens which will react when touching the buttons
    //on the Appbar and the BottomNavBar
    final List<Widget> screens = [
      MyMedicalDatePage(
        callDoctor: () {
          setState(() {
            _selectedIndex = 9;
          });
        },
        showDoctors: () {
          setState(() {
            _selectedIndex = 10;
          });
        },
      ),
      const MyMapPage(),
      const MyHomePage(),
      MyMedListPage(
        //These are different, because you have to send a signal from the screen to change into another one
        createMed: () {
          //This receives the screen change from med_list.dart and changes
          //the body to start the med creation wizard
          setState(() {
            _selectedIndex = 7;
          });
        },
      ),
      MyTreatmentList(
        createTreat: () {
          //This receives the screen change from alarm.dart and shows
          //the notif when you have to take the pill
          setState(() {
            _selectedIndex = 8;
          });
        },
        showAlarm: (String medName) {
          showTreatmentAlarmDialog(context, medName);
        },
      ),
      const MySettingsPage(),
      const MyProfilePage(),
      MyMedCreationPage(
        backToList: () {
          setState(() {
            _selectedIndex = 3;
          });
        },
      ),
      MyTreatCreatPage(
        backToList: () {
          setState(() {
            _selectedIndex = 4;
          });
        },
      ),
      const ChatScreen(),
      const DoctorsList()
    ];

    //This controls the theme
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;

    return ScaffoldMessenger(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: screens[
          _selectedIndex], //Every time you touch a buttom, this index changes, only changing the body
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
        //Boom, here you have a bottomnavbar with the centered buttom!!
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        backgroundColor: actualTheme.colorScheme.onPrimary,
        elevation: 5,
        shape: const CircleBorder(),
        child: const Icon(Icons.home, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }

  void _navigateToScreen(String route) {
    Navigator.pushNamed(context, route);
  }
}
