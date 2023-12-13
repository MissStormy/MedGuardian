import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:medguardian/widgets/app_bar.dart';
import 'package:medguardian/widgets/bottom_nav_bar.dart';

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
      //###################### AppBar ##########################
      appBar: const CustomAppBar(),

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
                        shape: CircleBorder(),
                        padding: const EdgeInsets.all(12.0),
                      ),
                      child: Icon(Icons.camera),
                    ),
                  ),
                  // Question Mark Icon Button (Top Right)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: const EdgeInsets.all(8.0),
                      ),
                      child: Icon(Icons.help),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Pill name',
                  hintStyle: TextStyle(fontSize: 24.0),
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
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
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Box count'),
                        TextField(),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Box Photo'),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                      Text('Date of expiry'),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Select Date'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add Medicine'),
              ),
              SizedBox(height: 10.0),
              OutlinedButton(
                onPressed: () {},
                child: Text('Cancel'),
              ),
            ],
          ),
        ),
      ),

      //###################### BottomNavBar ##########################
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
