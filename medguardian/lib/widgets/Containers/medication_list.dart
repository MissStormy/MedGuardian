import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';
class MedicationItem extends StatelessWidget {
  final String time;
  final String name;
  final IconData icon;
  final VoidCallback onMoreTap;

  const MedicationItem({
    super.key,
    required this.time,
    required this.name,
    required this.icon,
    required this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return InkWell(
      onTap: onMoreTap, 
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: actualTheme.colorScheme.secondary, 
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: actualTheme.colorScheme.primary,
            width: 2
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.blue,
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 1),
            TextButton(
              onPressed: () {
                onMoreTap();
              },
              child: const Text('More'),
            ),
          ],
        ),
      ),
    );
  }
}
