import 'package:flutter/material.dart';
import 'package:medguardian/widgets/custom_date_picker.dart';
import 'package:medguardian/widgets/custom_dropdown.dart';
import 'package:medguardian/widgets/custom_time_picker.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MyTreatCreatPage extends StatefulWidget {
  const MyTreatCreatPage({Key? key}) : super(key: key);

  @override
  _MyTreatCreatPageState createState() => _MyTreatCreatPageState();
}

class _MyTreatCreatPageState extends State<MyTreatCreatPage> {
  String selectedMedicine = 'Ibuprofeno';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 7));
  TimeOfDay timeBetweenDoses = TimeOfDay.now();
  String selectedTreatmentType = 'With Food';

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDropdown(
                label: 'Medicine',
                items: ['Ibuprofeno', 'Amoxicilina', 'Pirula'],
                value: selectedMedicine,
                onChanged: (value) {
                  setState(() {
                    selectedMedicine = value.toString();
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Start Date'),
                      CustomDatePicker(
                        selectedDate: startDate,
                        onDateChanged: (date) {
                          setState(() {
                            startDate = date;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('End Date'),
                      CustomDatePicker(
                        selectedDate: endDate,
                        onDateChanged: (date) {
                          setState(() {
                            endDate = date;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomTimePicker(
                label: 'Time Between Doses',
                selectedTime: timeBetweenDoses,
                onTimeChanged: (time) {
                  setState(() {
                    timeBetweenDoses = time;
                  });
                },
              ),
              SizedBox(height: 20),
              CustomDropdown(
                label: 'Treatment Type',
                items: ['With Food', 'Without Food', 'With Another Pill'],
                value: selectedTreatmentType,
                onChanged: (value) {
                  setState(() {
                    selectedTreatmentType = value.toString();
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: actualTheme.colorScheme.onSurface),
                child: const Text('Add Treatment'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: actualTheme.colorScheme.onSecondary,
                ),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
