import 'package:flutter/material.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:provider/provider.dart';

class MedicationItem extends StatelessWidget {
  final String time;
  final String name;
  final IconData icon;
  final VoidCallback onMoreTap;

  const MedicationItem({
    Key? key,
    required this.time,
    required this.name,
    required this.icon,
    required this.onMoreTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onMoreTap, // Use InkWell instead of GestureDetector
      child: Container(
        width: 150,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 67, 109, 69), // Set background color
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.blue,
            ),
            SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              name,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 1),
            TextButton(
              onPressed: () {
                onMoreTap();
              },
              child: Text('More'),
            ),
          ],
        ),
      ),
    );
  }
}
