import 'package:flutter/material.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:provider/provider.dart';

//This alarm widget will display a dialog over the app to remind
//the user about the medication that they have to take

class TreatmentAlarmDialog extends StatelessWidget {
  final String medicationName;

  const TreatmentAlarmDialog({
    super.key,
    required this.medicationName,
  });

  @override
  Widget build(BuildContext context) {
    //Theme provider
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    //We design the dialog
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
            //This should send an "okay" to the treatments list
            //so the treatment is marked as "Taken"
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Done'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: actualTheme.colorScheme.onSurface,
            foregroundColor: actualTheme.colorScheme.onError,
          ),
          //This should send a "wait" to the treatments list
          //so the treatment is marked as "Take later"
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Remind later'),
        ),
      ],
    );
  }
}

//REMEMBER IF YOU DON'T PUT THIS, THE DIALOG DOESN'T APPEAR
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
