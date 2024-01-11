import 'package:flutter/material.dart';
import 'package:medguardian/nexus.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:medguardian/widgets/medication_list.dart';
import 'package:provider/provider.dart';

class MyTreatmentList extends StatelessWidget {
  const MyTreatmentList({super.key});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200, // Adjust the height of each row as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Adjust the number of rows as needed
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        MedicationItem(
                          time: '12:00',
                          name: 'Ibuprofeno',
                          icon: Icons.medication,
                          
                        ),
                        // Add more MedicationItem widgets for other medications
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 200, // Adjust the height of each row as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Adjust the number of rows as needed
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        MedicationItem(
                          time: '12:00',
                          name: 'Ibuprofeno',
                          icon: Icons.medication,
                          
                        ),
                        // Add more MedicationItem widgets for other medications
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 200, // Adjust the height of each row as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Adjust the number of rows as needed
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        MedicationItem(
                          time: '12:00',
                          name: 'Ibuprofeno',
                          icon: Icons.medication,
                          
                        ),
                        // Add more MedicationItem widgets for other medications
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 200, // Adjust the height of each row as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Adjust the number of rows as needed
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        MedicationItem(
                          time: '12:00',
                          name: 'Ibuprofeno',
                          icon: Icons.medication,
                          
                        ),
                        // Add more MedicationItem widgets for other medications
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}