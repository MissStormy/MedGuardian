import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MyMedCreationPage extends StatefulWidget {
  const MyMedCreationPage({super.key});

  @override
  State<MyMedCreationPage> createState() => _MyMedCreationPageState();
}

class _MyMedCreationPageState extends State<MyMedCreationPage> {
  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      
      //###################### Body ##########################
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  // Camera Icon Button (Centered)
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(12.0),
                      ),
                      child: const Icon(Icons.camera),
                    ),
                  ),
                  // Question Mark Icon Button (Top Right)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(8.0),
                      ),
                      child: const Icon(Icons.help),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Pill name',
                  hintStyle: TextStyle(fontSize: 24.0),
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dose'),
                        TextField(),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Type'),
                        TextField(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Box count'),
                        TextField(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Box Photo'),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Activate low pills alert'),
                      Switch(
                        value: true, // Change this to the actual value
                        onChanged: null,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Date of expiry'),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Select Date'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add Medicine'),
              ),
              const SizedBox(height: 10.0),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),

      
    );
  }
}
