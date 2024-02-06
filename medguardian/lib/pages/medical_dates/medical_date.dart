import 'package:flutter/material.dart';
import 'package:medguardian/widgets/Buttons/custom_small_pb.dart';
import 'package:medguardian/widgets/Containers/custom_schedule.dart';
import 'package:medguardian/widgets/Extra/search_bar.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:medguardian/models/doctors.dart';

class MyMedicalDatePage extends StatefulWidget {
  final VoidCallback callDoctor;
  const MyMedicalDatePage({super.key, required this.callDoctor});

  @override
  State<MyMedicalDatePage> createState() => _MyMedicalDatePageState();
}

class _MyMedicalDatePageState extends State<MyMedicalDatePage> {
  final TextEditingController searchController = TextEditingController();
  final Doctor doctor = Doctor();
  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
        backgroundColor: actualTheme.colorScheme.surface,
        body: SingleChildScrollView(
            child: Column(
          children: [
            //###################### Search ##########################
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
                            CustomSmallPlainButton(
                                icon: Icons.monitor_heart,
                                onPressed: () => widget.callDoctor()),
                            const Text("Consultation",
                                style: TextStyle(fontSize: 12))
                          ],
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Column(
                          children: [
                            CustomSmallPlainButton(
                                icon: Icons.local_pharmacy, onPressed: () {}),
                            const Text("Pharmacy",
                                style: TextStyle(fontSize: 12))
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            CustomSmallPlainButton(
                                icon: Icons.local_pharmacy, onPressed: () {}),
                            const Text("Appointment",
                                style: TextStyle(fontSize: 12))
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            CustomSmallPlainButton(
                                icon: Icons.local_pharmacy, onPressed: () {}),
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
            SizedBox(
                height: 200,
                child: FutureBuilder(
                    future: doctor.GetDoctors(),
                    builder: (context, AsyncSnapshot<List<Doctor>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            // itemCount: 3,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(children: [
                                    CustomSchedule(
                                        image: Icons.person,
                                        name: snapshot.data![index].name,
                                        consultation: snapshot
                                            .data![index].medicalSpeciality,
                                        date: '19 October',
                                        hour: '10:00')
                                  ]));
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
            //TODO: Make big container for schedules
            /*const ScheduleContainer(content: [
          CustomSchedule(
              image: Icons.person,
              name: snapshot.data![index].name,
              consultation: "Psychology consultation",
              date: "Tuesday, 15 August",
              hour: "14:00 - 15:00"),
          CustomSchedule(
              image: Icons.person,
              name: "Dr. Lokka",
              consultation: "Psychology consultation",
              date: "Tuesday, 15 August",
              hour: "14:00 - 15:00"),
        ]),*/

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
                    CustomSmallPlainButton(
                        icon: Icons.healing, onPressed: () {}),
                    const SizedBox(
                      width: 5.0,
                    ),
                    CustomSmallPlainButton(
                        icon: Icons.healing, onPressed: () {}),
                    const SizedBox(
                      width: 5.0,
                    ),
                    CustomSmallPlainButton(
                        icon: Icons.healing, onPressed: () {}),
                    const SizedBox(
                      width: 5.0,
                    ),
                    CustomSmallPlainButton(
                        icon: Icons.healing, onPressed: () {}),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    CustomSmallPlainButton(
                        icon: Icons.healing, onPressed: () {}),
                    const SizedBox(
                      width: 5.0,
                    ),
                    CustomSmallPlainButton(
                        icon: Icons.healing, onPressed: () {}),
                    const SizedBox(
                      width: 5.0,
                    ),
                    CustomSmallPlainButton(
                        icon: Icons.healing, onPressed: () {}),
                    const SizedBox(
                      width: 5.0,
                    ),
                    CustomSmallPlainButton(
                        icon: Icons.healing, onPressed: () {}),
                  ],
                ),
              ]),
            )
          ],
        )));
  }
}
