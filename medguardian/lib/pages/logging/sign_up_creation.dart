import 'package:flutter/material.dart';
import 'package:medguardian/widgets/Text/custom_textfield.dart';

class SignUpCreation extends StatefulWidget {
  const SignUpCreation({super.key});

  @override
  State<SignUpCreation> createState() => _SignUpCreationState();
}

class _SignUpCreationState extends State<SignUpCreation> {
  int _currentStep = 0;
  TextEditingController _customFrequencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              title: const Text('Personal info'),
              content: Column(
                children: [
                  CustomTextfield(label: 'Name'),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextfield(label: 'Surname')
                ],
              )),
          Step(
              title: const Text('Password'),
              content: CustomTextfield(label: 'Password')),
          Step(
              title: const Text('Personal situation'),
              content: Column(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('It is for me')),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text('I am in charge of someone'))
                ],
              ))
          //And from here, you get the info and create a new user
        ]));
  }
}
