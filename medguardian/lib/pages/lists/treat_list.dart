import 'package:flutter/material.dart';
import 'package:medguardian/provider/guardian.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:medguardian/widgets/Containers/medication_list.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/models/treatment.dart';
import 'dart:async';
import 'package:analog_clock/analog_clock.dart';

class MyTreatmentList extends StatelessWidget {
  final VoidCallback createTreat;

  const MyTreatmentList({super.key, required this.createTreat});

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
                    const SizedBox(width: 16), // Spacer
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
                                  style: const TextStyle(
                                      fontSize:
                                          16), // Adjust font size as needed
                                  softWrap: true, // Enable text wrapping
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

            // Medication Rows
            _buildMedicationRow('Morning Pirulas'),
            SizedBox(
              height: 200,
              child: FutureBuilder(
                future: treatment.getTreatmentsBetwenTime(morning,midDay),
                builder: (context, AsyncSnapshot<List<Treatment>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              MedicationItem(
                                time:
                                    "${snapshot.data![index].startDate.hour}:${snapshot.data![index].startDate.minute}",
                                name: snapshot.data![index].pirulaName,
                                icon: Icons.medication,
                                onMoreTap: () {
                                  print("Working");
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            _buildMedicationRow('Midday Pirulas'),
            SizedBox(
              height: 200,
              child: FutureBuilder(
                future: treatment.getTreatmentsBetwenTime(midDay,night),
                builder: (context, AsyncSnapshot<List<Treatment>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              MedicationItem(
                                time:
                                    "${snapshot.data![index].startDate.hour}:${snapshot.data![index].startDate.minute}",
                                name: snapshot.data![index].pirulaName,
                                icon: Icons.medication,
                                onMoreTap: () {
                                  print("Working");
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            _buildMedicationRow('Night Pirulas'),
            SizedBox(
              height: 200,
              child: FutureBuilder(
                future: treatment.getTreatmentsBetwenTime(night,morning),
                builder: (context, AsyncSnapshot<List<Treatment>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              MedicationItem(
                                time:
                                    "${snapshot.data![index].startDate.hour}:${snapshot.data![index].startDate.minute}",
                                name: snapshot.data![index].pirulaName,
                                icon: Icons.medication,
                                onMoreTap: () {
                                  print("Working");
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
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

  Widget _buildMedicationRow(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Divider(
            indent: 30,
            endIndent: 30,
          ),
        ],
      ),
    );
  }
}
