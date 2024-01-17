import 'package:flutter/material.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:provider/provider.dart';

class MedicationItem extends StatelessWidget {
  final String time;
  final String name;
  final IconData icon;

  MedicationItem({required this.time, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          // Medication icon positioned outside the main box
          Positioned(
            top: 8,
            left: 8,
            child: Icon(icon, size: 24.0),
          ),
          SizedBox(width: 32.0),
          // Main content with title and button
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Medication time
              Text(time),
              SizedBox(height: 8.0),
              // Medication name
              Text(
                name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              // More button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: actualTheme.colorScheme.onSurface,
                  foregroundColor: Colors.white,
                ), // Set the text color,
                child: Text('More'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
