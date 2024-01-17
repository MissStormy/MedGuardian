import 'package:flutter/material.dart';
import 'package:medguardian/widgets/custom_schedule.dart';
import 'package:medguardian/widgets/pill_container.dart';
import 'package:medguardian/widgets/schedule_container.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MyMedicalDatePage extends StatefulWidget {
  const MyMedicalDatePage({super.key});

  @override
  State<MyMedicalDatePage> createState() => _MyMedicalDatePageState();
}

class _MyMedicalDatePageState extends State<MyMedicalDatePage> {
  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        //###################### Search ##########################
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              //Two titles in line with the notification button
              Row(
                children: [
                  Column(
                    children: [
                      Text("Hi there, Nyarlathotep",
                          style: const TextStyle(fontSize: 20)),
                      Text("How do you feel today?",
                          style: const TextStyle(fontSize: 15))
                    ],
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: actualTheme.colorScheme.onSurface,
                        foregroundColor: Colors.white,
                      ),
                      child: Icon(Icons.notifications))
                ],
              ),
              //Search bar: TODO Widget
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Searchbar Placeholder',
                  hintStyle: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: actualTheme.colorScheme.onSurface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fixedSize: Size(50.0, 50.0),
                            foregroundColor: Colors.white,
                          ),
                          child: Center(
                            child: Icon(Icons.notifications),
                          ),
                        ),
                        Text("Consultation", style: TextStyle(fontSize: 10))
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: actualTheme.colorScheme.onSurface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fixedSize: Size(50.0, 50.0),
                            foregroundColor: Colors.white,
                          ),
                          child: Center(
                            child: Icon(Icons.notifications),
                          ),
                        ),
                        Text("Consultation", style: TextStyle(fontSize: 10))
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: actualTheme.colorScheme.onSurface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fixedSize: Size(50.0, 50.0),
                            foregroundColor: Colors.white,
                          ),
                          child: Center(
                            child: Icon(Icons.notifications),
                          ),
                        ),
                        Text("Consultation", style: TextStyle(fontSize: 10))
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: actualTheme.colorScheme.onSurface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fixedSize: Size(50.0, 50.0),
                            foregroundColor: Colors.white,
                          ),
                          child: Center(
                            child: Icon(Icons.notifications),
                          ),
                        ),
                        Text("Consultation", style: TextStyle(fontSize: 10))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: 300,
          height: 25,
          alignment: Alignment.centerLeft,
          child: Text(
            "Upcoming Schedule",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        //###################### Upcoming Schedule ##########################
        //TODO: Make big container for schedules
        ScheduleContainer(content: [
          CustomSchedule(
              image: Icons.person,
              name: "Dr. Miss Stormy",
              consultation: "Psychology consultation",
              date: "Tuesday, 15 August",
              hour: "14:00 - 15:00"),
          CustomSchedule(
              image: Icons.person,
              name: "Dr. Miss Stormy",
              consultation: "Psychology consultation",
              date: "Tuesday, 15 August",
              hour: "14:00 - 15:00"),
        ]),

        //###################### Doctor Speciality ##########################
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: 300,
          height: 25,
          alignment: Alignment.centerLeft,
          child: Text(
            "Doctor Speciality",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(
              children: [
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.healing)),
                    Center(
                      child: Text("General"),
                    )
                  ],
                ),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.healing)),
                    Center(
                      child: Text("General"),
                    )
                  ],
                ),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.healing)),
                    Center(
                      child: Text("General"),
                    )
                  ],
                ),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.healing)),
                    Center(
                      child: Text("General"),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.healing)),
                    Center(
                      child: Text("General"),
                    )
                  ],
                ),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.healing)),
                    Center(
                      child: Text("General"),
                    )
                  ],
                ),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.healing)),
                    Center(
                      child: Text("General"),
                    )
                  ],
                ),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.healing)),
                    Center(
                      child: Text("General"),
                    )
                  ],
                ),
              ],
            ),
          ]),
        )
      ],
    )));
  }
}
