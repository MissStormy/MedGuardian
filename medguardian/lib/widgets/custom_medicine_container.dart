import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MedicineAccordion extends StatelessWidget {
  final String name;
  final String type;
  final int pillCount;

  const MedicineAccordion(
      {super.key, required this.name, required this.type, required this.pillCount});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: actualTheme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ExpansionTile(
          title: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Replace the Icon with your desired pill icon
                    const Icon(Icons.local_hospital, color: Colors.white),
                    const SizedBox(width: 8.0), // Adjust spacing as needed
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Quicksand'),
                        ),
                        Text(
                          type,
                          style: const TextStyle(
                              color: Colors.white, fontFamily: 'Quicksand'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.medication, color: Colors.white),
                      const SizedBox(width: 8.0),
                      Text(
                        'Pill Count: $pillCount',
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'Quicksand'),
                      ),
                    ],
                  ),
                ),
                Center(
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    actualTheme.colorScheme.background,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                fixedSize: const Size(100.0, 100.0),
                                foregroundColor: Colors.white,
                              ),
                              child: const Center(
                                child: Icon(Icons.monitor_heart),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    actualTheme.colorScheme.background,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                fixedSize: const Size(100.0, 100.0),
                                foregroundColor: Colors.white,
                              ),
                              child: const Center(
                                child: Icon(Icons.monitor_heart),
                              ),
                            ),
                          ],
                        ))),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0),
                  padding: const EdgeInsets.all(16.0),
                  
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  actualTheme.colorScheme.background,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text("Modify")),
                            const SizedBox(width: 10.0,),
                            ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  actualTheme.colorScheme.background,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text("Erase"))
                      ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
