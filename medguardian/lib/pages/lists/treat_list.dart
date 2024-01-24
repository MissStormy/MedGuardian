import 'package:flutter/material.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:medguardian/widgets/Containers/medication_list.dart';
import 'package:provider/provider.dart';

//Here you can find the list of treatments which have been created

class MyTreatmentList extends StatelessWidget {
  //Wanna play ping-pong? VoidCallback sends a signal to the bottomnavbar, which then ricochets through the nexus
  //back to the selected index to change the body!! Interesting right? :)
  final VoidCallback createTreat;
  const MyTreatmentList({super.key, required this.createTreat});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //With this you can create a whole bunch of the same thing
            //TODO: Fix it so they are different
            _buildMedicationRow('Morning Pirulas'),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        MedicationItem(
                          time: '12:00',
                          name: 'Ibuprofeno',
                          icon: Icons.medication,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            _buildMedicationRow('Midday Pirulas'),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        MedicationItem(
                          time: '12:00',
                          name: 'Ibuprofeno',
                          icon: Icons.medication,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            _buildMedicationRow('Night Pirulas'),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        MedicationItem(
                          time: '12:00',
                          name: 'Ibuprofeno',
                          icon: Icons.medication,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createTreat(),
        backgroundColor: actualTheme.colorScheme.onSurface,
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
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
