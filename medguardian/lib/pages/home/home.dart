import 'package:flutter/material.dart';
import 'package:medguardian/widgets/app_bar.dart';
import 'package:medguardian/widgets/big_container.dart';
import 'package:medguardian/widgets/bottom_nav_bar.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:medguardian/widgets/pill_container.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _selectedDate;

  _MyHomePageState()
      : _selectedDate = DateTime.now().add(const Duration(days: 2));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      //###################### AppBar ##########################
      appBar: const CustomAppBar(),

      //###################### Body ##########################
      body: SingleChildScrollView(
        
        child: Column(children: [
        
        Container(
          //The calendar widget
          child: CalendarTimeline(
            showYears: false,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
            onDateSelected: (date) => setState(() => _selectedDate = date),
            leftMargin: 20,
            monthColor: actualTheme.colorScheme.onSecondary,
            dayColor: actualTheme.colorScheme.secondary,
            dayNameColor: const Color(0xFF333A47),
            activeDayColor: actualTheme.colorScheme.secondary,
            activeBackgroundDayColor: actualTheme.colorScheme.onBackground,
            dotsColor: const Color(0xFF333A47),
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'es',
          ),
        ),
        const SizedBox(height: 10),
        //Now, the tabs
        //###################### Morning pirulas ##########################
        const BigContainer(
          containerName: "Morning pirulas", 
          content: [
            PirulasContainer(
              title: "Ibuprofeno", 
              text: "1 pirula con la comida",
              hour: "21:00", 
              icon: Icons.medication),
              PirulasContainer(
              title: "Ibuprofeno", 
              text: "1 pirula con la comida",
              hour: "21:00", 
              icon: Icons.medication),
              
          ]),
        //###################### Half day pirulas ##########################
        const BigContainer(
          containerName: "Half day pirulas", 
          content: [
            PirulasContainer(
              title: "Ibuprofeno", 
              text: "1 pirula con la comida",
              hour: "21:00", 
              icon: Icons.medication),
              
          ]),
        //###################### Night pirulas ##########################
        const BigContainer(
          containerName: "Night pirulas", 
          content: [
            PirulasContainer(
              title: "Ibuprofeno", 
              text: "1 pirula con la comida",
              hour: "21:00", 
              icon: Icons.medication),
              
          ]),
      ])),
      //###################### BottomNavBar ##########################
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
