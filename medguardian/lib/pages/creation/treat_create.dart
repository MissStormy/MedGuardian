import 'package:flutter/material.dart';
import 'package:medguardian/widgets/Containers/custom_dropdown.dart';
import 'package:medguardian/widgets/Extra/custom_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:medguardian/models/treatment.dart';
import 'package:medguardian/models/pirulas.dart';

//Just like med_create.dart, this one creates treatments through a wizard

class MyTreatCreatPage extends StatefulWidget {
  final VoidCallback backToList;
  const MyTreatCreatPage({super.key, required this.backToList});

  @override
  _MyTreatCreatPageState createState() => _MyTreatCreatPageState();
}

class _MyTreatCreatPageState extends State<MyTreatCreatPage> {
  int _currentStep = 0;
  String? selectedValue;
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  String _selectedFrequency = '';
  TimeOfDay _selectedTime = const TimeOfDay(hour: 0, minute: 0);
  Treatment treatment = Treatment();
  Pirula pirula = Pirula();

  final TextEditingController _customFrequencyController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      backgroundColor: actualTheme.colorScheme.surface,
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          //In this wizard, we have chosen a stepper to do the process
          //In each step, we save the data
          setState(() {
            bool nextStep = false;
            switch (_currentStep) {
              case 0:
                if (selectedValue != null) {
                  nextStep = true;
                  treatment.pirulaName = selectedValue ?? '';
                }
                break;
              case 1:
                nextStep = true;
                treatment.startDate = _startDate;
                break;
              case 2:
                if (_endDate.isAfter(_startDate)) {
                  nextStep = true;
                  treatment.endDate = _endDate;
                }
                break;
              case 3:
                if (_selectedFrequency == 'hourly') {
                  treatment.frecuency = 1;
                  nextStep = true;
                } else if (_selectedFrequency == 'daily') {
                  treatment.frecuency = 24;
                  treatment.firstDose = DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      _selectedTime.hour,
                      _selectedTime.minute);
                  nextStep = true;
                } else if (_selectedFrequency == 'custom') {
                  treatment.frecuency =
                      int.tryParse(_customFrequencyController.text) ?? 24;
                  nextStep = true;
                }
                break;
              case 4:
                nextStep = true;
                break;
            }
            if (nextStep) _currentStep < 5 ? _currentStep += 1 : null;
          });
        },
        onStepCancel: () {
          setState(() {
            _currentStep > 0 ? _currentStep -= 1 : null;
          });
        },
        steps: [
          Step(
              title: Text(
                'Choose the medication',
                style: TextStyle(color: actualTheme.colorScheme.onError),
              ),
              //With this dropdown, we display all the pirulas that are in the DB
              content: FutureBuilder(
                future: pirula.getPirulas(),
                builder: (context, AsyncSnapshot<List<Pirula>> snapshot) {
                  if (snapshot.hasData) {
                    return CustomDropdown(
                      label: 'Pirula name',
                      items: List.generate(snapshot.data!.length,
                          (index) => snapshot.data![index].name),
                      value: selectedValue,
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue = newValue ?? '';
                        });
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
          Step(
            //We pick the date when the treatment starts
            title: Text('Start date',
                style: TextStyle(color: actualTheme.colorScheme.onError)),
            content: CustomDatePicker(
              selectedDate: _startDate,
              onDateChanged: (DateTime pickedDate) {
                setState(() {
                  _startDate = pickedDate;
                });
              },
            ),
          ),
          Step(
            //We pick the date when the treatment ends
            title: Text('End date',
                style: TextStyle(color: actualTheme.colorScheme.onError)),
            content: CustomDatePicker(
              selectedDate: _endDate,
              onDateChanged: (DateTime pickedDate) {
                setState(() {
                  _endDate = pickedDate;
                });
              },
            ),
          ),
          // We pick the frequency, if it's daily, we pick the hour
          //If it's custom, we pick the frequency between doses
          Step(
            title: Text('Select Frequency',
                style: TextStyle(color: actualTheme.colorScheme.onError)),
            content: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: actualTheme.colorScheme.onSurface,
                        foregroundColor: actualTheme.colorScheme.onError,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedFrequency = 'daily';
                        });
                      },
                      child: const Text('Daily'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: actualTheme.colorScheme.onSurface,
                        foregroundColor: actualTheme.colorScheme.onError,
                      ),
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
                        labelText: 'Hours betwen doses',
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
                      child: Text(
                        'Select Time: ${_selectedTime.format(context)}',
                        style:
                            TextStyle(color: actualTheme.colorScheme.onError),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Step(
              //When we touch save, we will go back to the list
              title: Text('Confirmation',
                  style: TextStyle(color: actualTheme.colorScheme.onError)),
              content: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: actualTheme.colorScheme.onSurface,
                    foregroundColor: actualTheme.colorScheme.onError,
                  ),
                  onPressed: () {
                    treatment.saveTreatment(treatment);
                    widget.backToList();
                  },
                  child: Text('Save treatment',
                      style:
                          TextStyle(color: actualTheme.colorScheme.onError))))
        ],
      ),
    );
  }
}
