import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  const CustomTextfield({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).colorScheme.error
                : Colors.green;
            return TextStyle(color: color, letterSpacing: 1.3);
          },
        ),
      ),
    );
  }
}
