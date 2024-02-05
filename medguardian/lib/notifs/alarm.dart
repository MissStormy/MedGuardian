import 'package:flutter/material.dart';

class TreatmentAlarmDialog extends StatelessWidget {
  final String medicationName;
  final String imagePath;

  const TreatmentAlarmDialog({
    super.key,
    required this.medicationName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Time to take medication'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Text('Medication: $medicationName'),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Handle "Done" button tap
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Done'),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle "Remind later" button tap
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Remind later'),
        ),
      ],
    );
  }
}

// Usage:
// Call this method when you want to show the alarm dialog
void showTreatmentAlarmDialog(
    BuildContext context, String medicationName, String imagePath) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return TreatmentAlarmDialog(
        medicationName: medicationName,
        imagePath: imagePath,
      );
    },
  );
}
