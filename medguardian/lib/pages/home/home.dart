import 'package:flutter/material.dart';
import 'package:medguardian/widgets/big_container.dart';
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
       backgroundColor: actualTheme.colorScheme.primary, // Set the background color of the whole screen
    
      //###################### Body ##########################
      body: SingleChildScrollView(
        
          child: Column(children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: actualTheme.colorScheme.secondary,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: actualTheme.colorScheme.onSurface
                    .withOpacity(0.5), // Adjust opacity as needed
                offset: Offset(0, -2), // Move the shadow upwards
                  blurRadius: 10,
                  spreadRadius: -50, // Adjust the blur radius as needed
              ),
            ],
          ),
          //The calendar widget
          child: CalendarTimeline(
            showYears: false,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
            onDateSelected: (date) => setState(() => _selectedDate = date),
            leftMargin: 20,
            monthColor: actualTheme.colorScheme.onBackground,
            dayColor: actualTheme.colorScheme.onBackground,
            dayNameColor: actualTheme.colorScheme.onSurface,
            activeDayColor: actualTheme.colorScheme.onSurface,
            activeBackgroundDayColor: actualTheme.colorScheme.onBackground,
            dotsColor: const Color(0xFF333A47),
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'es',
          ),
        ),
        const SizedBox(height: 10),

        //Now, the tabs
        //###################### Morning pirulas ##########################
        const BigContainer(containerName: "Morning pirulas", content: [
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
          PirulasContainer(
              title: "Ibuprofeno",
              text: "1 pirula con la comida",
              hour: "21:00",
              icon: Icons.medication),
        ]),
        const Divider(),
        //###################### Half day pirulas ##########################
        const BigContainer(containerName: "Half day pirulas", content: [
          PirulasContainer(
              title: "Ibuprofeno",
              text: "1 pirula con la comida",
              hour: "21:00",
              icon: Icons.medication),
        ]),
        const Divider(),
        //###################### Night pirulas ##########################
        const BigContainer(containerName: "Night pirulas", content: [
          PirulasContainer(
              title: "Ibuprofeno",
              text: "1 pirula con la comida",
              hour: "21:00",
              icon: Icons.medication),
        ]),
      ])),
    );
  }
}
