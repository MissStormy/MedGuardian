import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class CustomTimePicker extends StatelessWidget {
  final String label;
  final TimeOfDay selectedTime;
  final void Function(TimeOfDay) onTimeChanged;

  CustomTimePicker({
    required this.label,
    required this.selectedTime,
    required this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        ElevatedButton(
          onPressed: () async {
            final pickedTime = await showTimePicker(
              context: context,
              initialTime: selectedTime,
            );

            if (pickedTime != null && pickedTime != selectedTime) {
              onTimeChanged(pickedTime);
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: actualTheme.colorScheme.onSurface),
          child: Text(
            "${selectedTime.format(context)}",
          ),
        ),
      ],
    );
  }
}
