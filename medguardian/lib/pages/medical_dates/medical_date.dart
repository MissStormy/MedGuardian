import 'package:flutter/material.dart';
import 'package:medguardian/widgets/custom_schedule.dart';
import 'package:medguardian/widgets/schedule_container.dart';
import 'package:medguardian/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MyMedicalDatePage extends StatefulWidget {
  const MyMedicalDatePage({super.key});

  @override
  State<MyMedicalDatePage> createState() => _MyMedicalDatePageState();
}

class _MyMedicalDatePageState extends State<MyMedicalDatePage> {
  final TextEditingController searchController = TextEditingController();

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
                  const Column(
                    children: [
                      Text("Hi there, Nyarlathotep",
                          style: TextStyle(fontSize: 20)),
                      Text("How do you feel today?",
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: actualTheme.colorScheme.onSurface,
                        foregroundColor: Colors.white,
                      ),
                      child: const Icon(Icons.notifications))
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              //Search bar: TODO Widget
              CustomSearchBar(
                  controller: searchController,
                  onSubmitted: (query) {
                    print("Search submitted: $query");
                  }),
              const SizedBox(
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
                            fixedSize: const Size(50.0, 50.0),
                            foregroundColor: Colors.white,
                          ),
                          child: const Center(
                            child: Icon(Icons.monitor_heart),
                          ),
                        ),
                        const Text("Consultation", style: TextStyle(fontSize: 12))
                      ],
                    ),
                    const SizedBox(
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
                            fixedSize: const Size(50.0, 50.0),
                            foregroundColor: Colors.white,
                          ),
                          child: const Center(
                            child: Icon(Icons.local_pharmacy),
                          ),
                        ),
                        const Text("Pharmacy", style: TextStyle(fontSize: 12))
                      ],
                    ),
                    const SizedBox(
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
                            fixedSize: const Size(50.0, 50.0),
                            foregroundColor: Colors.white,
                          ),
                          child: const Center(
                            child: Icon(Icons.calendar_month),
                          ),
                        ),
                        const Text("Appointment", style: TextStyle(fontSize: 12))
                      ],
                    ),
                    const SizedBox(
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
                            fixedSize: const Size(50.0, 50.0),
                            foregroundColor: Colors.white,
                          ),
                          child: const Center(
                            child: Icon(Icons.medication),
                          ),
                        ),
                        const Text("Recipe", style: TextStyle(fontSize: 12))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          width: 300,
          height: 25,
          alignment: Alignment.centerLeft,
          child: const Text(
            "Upcoming Schedule",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        //###################### Upcoming Schedule ##########################
        //TODO: Make big container for schedules
        const ScheduleContainer(content: [
          CustomSchedule(
              image: Icons.person,
              name: "Dr. Miss Stormy",
              consultation: "Psychology consultation",
              date: "Tuesday, 15 August",
              hour: "14:00 - 15:00"),
          CustomSchedule(
              image: Icons.person,
              name: "Dr. Lokka",
              consultation: "Psychology consultation",
              date: "Tuesday, 15 August",
              hour: "14:00 - 15:00"),
        ]),

        //###################### Doctor Speciality ##########################
        const SizedBox(
          height: 10.0,
        ),
        Container(
          width: 300,
          height: 25,
          alignment: Alignment.centerLeft,
          child: const Text(
            "Doctor Speciality",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
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
                        onPressed: () {}, child: const Icon(Icons.healing)),
                    const Center(
                      child: Text("General"),
                    )
                  ],
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Icon(Icons.healing)),
                    const Center(
                      child: Text("General"),
                    )
                  ],
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Icon(Icons.healing)),
                    const Center(
                      child: Text("General"),
                    )
                  ],
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Icon(Icons.healing)),
                    const Center(
                      child: Text("General"),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Icon(Icons.healing)),
                    const Center(
                      child: Text("General"),
                    )
                  ],
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Icon(Icons.healing)),
                    const Center(
                      child: Text("General"),
                    )
                  ],
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Icon(Icons.healing)),
                    const Center(
                      child: Text("General"),
                    )
                  ],
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Icon(Icons.healing)),
                    const Center(
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
