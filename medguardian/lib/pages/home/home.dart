import 'package:flutter/material.dart';
import 'package:medguardian/widgets/app_bar.dart';
import 'package:medguardian/widgets/bottom_nav_bar.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
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
            dayColor: Colors.teal[200],
            dayNameColor: const Color(0xFF333A47),
            activeDayColor: Colors.white,
            activeBackgroundDayColor: actualTheme.colorScheme.background,
            dotsColor: const Color(0xFF333A47),
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'es',
          ),
        ),
        const SizedBox(height: 10),
        //Now, the tabs
        //###################### Morning pirulas ##########################
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Morning pirulas",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                )
              ]),
        ),
        Container(
            height: 189,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            child: ListView(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 5),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.medication),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              const Text(
                                "IBUROFENO",
                                style: TextStyle(fontSize: 20),
                              ),
                              const Text(
                                "1 pirula con la comida",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: actualTheme.colorScheme.background,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: const Text(
                              "21:00",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Icon(Icons.more_vert),
                        ])),
              ],
            )),
        //###################### Half day pirulas ##########################
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Half day pirulas",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                )
              ]),
        ),
        Container(
            height: 189,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
        //###################### Night pirulas ##########################
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Night pirulas",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                )
              ]),
        ),
        Container(
            height: 189,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
      ])),
      //###################### BottomNavBar ##########################
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
