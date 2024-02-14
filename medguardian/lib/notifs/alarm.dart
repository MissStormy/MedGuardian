import 'package:flutter/material.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:provider/provider.dart';

class TreatmentAlarmDialog extends StatelessWidget {
  final String medicationName;

  const TreatmentAlarmDialog({
    super.key,
    required this.medicationName,
  });

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return AlertDialog(
      title: const Text('Time to take medication'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.medication),
          const SizedBox(height: 16),
          Text(medicationName),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: actualTheme.colorScheme.onSurface,
            foregroundColor: actualTheme.colorScheme.onError,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Done'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: actualTheme.colorScheme.onSurface,
            foregroundColor: actualTheme.colorScheme.onError,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Remind later'),
        ),
      ],
    );
  }
}

void showTreatmentAlarmDialog(BuildContext context, String medicationName) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return TreatmentAlarmDialog(
        medicationName: medicationName,
      );
    },
  );
}
