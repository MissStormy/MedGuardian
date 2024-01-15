import 'package:flutter/material.dart';
import 'package:medguardian/pages/creation/treat_create.dart';
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
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
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
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
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
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
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
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
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
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyTreatCreatPage()));
          },
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: actualTheme.colorScheme.onSurface,
          elevation: 10,
          shape: CircleBorder(),
        ));
  }
}
