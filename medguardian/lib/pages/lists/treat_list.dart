import 'package:flutter/material.dart';
import 'package:medguardian/provider/guardian.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:medguardian/widgets/Containers/custom_medication_list.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/models/treatment.dart';
import 'dart:async';
import 'package:analog_clock/analog_clock.dart';

//In this page, display a list of the treatments

class MyTreatmentList extends StatelessWidget {
  final VoidCallback createTreat;
  final ValueSetter<String> showAlarm;

  const MyTreatmentList(
      {super.key, required this.createTreat, required this.showAlarm});

  @override
  Widget build(BuildContext context) {
    final Treatment treatment = Treatment();
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    final guardianModeProvider = Provider.of<GuardianModeProvider>(context);
    final DateTime morning = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0);
    final DateTime midDay = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 12);
    final DateTime night = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 18);

    Future<String> getNextPill() async {
      // Logic to retrieve the next pill info from the database
      // Replace this with your actual database query
      await Future.delayed(
          const Duration(seconds: 1)); // Simulating async operation
      return "Ibuprofen at 9:00 AM"; // Example next pill information
    }

    return Scaffold(
      backgroundColor: actualTheme.colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Clock Container
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: actualTheme.colorScheme.surface,
                  border: Border.all(color: actualTheme.colorScheme.primary),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: actualTheme.colorScheme.primary),
                      ),
                      //This is a widget from the internet
                      child: AnalogClock(
                        decoration: const BoxDecoration(
                            color: Colors.transparent, shape: BoxShape.circle),
                        width: 150.0,
                        isLive: true,
                        hourHandColor: actualTheme.colorScheme.onSurface,
                        minuteHandColor: actualTheme.colorScheme.onSurface,
                        showSecondHand: false,
                        numberColor: actualTheme.colorScheme.onSurface,
                        showNumbers: true,
                        showAllNumbers: false,
                        textScaleFactor: 1.4,
                        showTicks: false,
                        showDigitalClock: false,
                        datetime: DateTime.now(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Next Pill Information
                    Flexible(
                      child: FutureBuilder<String>(
                        future: getNextPill(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          } else {
                            String nextPill =
                                snapshot.data ?? "No pills scheduled";
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Hello there, Nyachan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24, // Adjust font size as needed
                                  ),
                                ),
                                const SizedBox(
                                    height: 8), // Adjust spacing as needed
                                Text(
                                  "Next pill: $nextPill",
                                  style: const TextStyle(fontSize: 16),
                                  softWrap: true,
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            //TREATMENTS LIST
            const Text(
              'Calendar',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10.0,
            ),
            //See /widgets/container/custom_medication_list.dart
            FutureBuilder(
                future: treatment.getTreatments(),
                builder: (context, AsyncSnapshot<List<Treatment>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return MedicationItem(
                          name: snapshot.data![index].pirulaName,
                          time: '12:00',
                          icon: Icons.medication,
                          onMoreTap: () =>
                              showAlarm(snapshot.data![index].pirulaName),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      //When you touch the button, display the treatment creation page
      floatingActionButton: !guardianModeProvider.guardianModeEnabled
          ? FloatingActionButton(
              onPressed: () => createTreat(),
              backgroundColor: actualTheme.colorScheme.onSurface,
              elevation: 10,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }
}
