import 'package:flutter/material.dart';
import 'package:medguardian/widgets/Containers/custom_dropdown.dart';
import 'package:medguardian/widgets/Extra/custom_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';
//Just like med_create.dart, this one creates treatments through a wizard


class MyTreatCreatPage extends StatefulWidget {
  const MyTreatCreatPage({super.key});

  @override
  _MyTreatCreatPageState createState() => _MyTreatCreatPageState();
}

class _MyTreatCreatPageState extends State<MyTreatCreatPage> {
  int _currentStep = 0;
  String selectedValue = 'Ibuprofeno';
  DateTime _selectedDate = DateTime.now();
  String _selectedFrequency = '';
  TimeOfDay _selectedTime = const TimeOfDay(hour: 0, minute: 0);

  final TextEditingController _customFrequencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      backgroundColor: actualTheme.colorScheme.surface,
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            _currentStep < 5 ? _currentStep += 1 : null;
          });
        },
        onStepCancel: () {
          setState(() {
            _currentStep > 0 ? _currentStep -= 1 : null;
          });
        },
        steps: [
          Step(
            title: Text('Choose the medication', style: TextStyle(
              color: actualTheme.colorScheme.onError
            ),),
            content: CustomDropdown(
              label: 'Pirula name',
              items: const ['Ibuprofeno', 'Amoxicilina', 'Plutonic drug'],
              value: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue ?? '';
                });
              },
            ),
          ),
          Step(
            title: Text('Start date', style: TextStyle(
              color: actualTheme.colorScheme.onError
            )),
            content: CustomDatePicker(
              selectedDate: _selectedDate,
              onDateChanged: (DateTime pickedDate) {
                setState(() {
                  _selectedDate = pickedDate;
                });
              },
            ),
          ),
          Step(
            title:  Text('End date', style: TextStyle(
              color: actualTheme.colorScheme.onError
            )),
            content: CustomDatePicker(
              selectedDate: _selectedDate,
              onDateChanged: (DateTime pickedDate) {
                setState(() {
                  _selectedDate = pickedDate;
                });
              },
            ),
          ),
          Step(
            title: Text('Select Frequency', style: TextStyle(
              color: actualTheme.colorScheme.onError
            )),
            content: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedFrequency = 'hourly';
                        });
                      },
                      child: const Text('Hourly'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedFrequency = 'daily';
                        });
                      },
                      child: const Text('Daily'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedFrequency = 'custom';
                        });
                      },
                      child: const Text('Custom'),
                    ),
                  ],
                ),
                if (_selectedFrequency == 'custom')
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextFormField(
                      controller: _customFrequencyController,
                      decoration: const InputDecoration(
                        labelText: 'Custom Frequency',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                if (_selectedFrequency == 'daily')
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          setState(() {
                            _selectedTime = pickedTime;
                          });
                        }
                      },
                      child:
                          Text('Select Time: ${_selectedTime.format(context)}'),
                    ),
                  ),
              ],
            ),
          ),
          Step(
              title: Text('Confirmation', style: TextStyle(
              color: actualTheme.colorScheme.onError
            )),
              content: ElevatedButton(
                  onPressed: () {}, child: const Text('Save treatment')))
        ],
      ),
    );
  }
}
