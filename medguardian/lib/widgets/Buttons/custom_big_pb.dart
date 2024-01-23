import 'package:flutter/material.dart';

class CustomBigPlainButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomBigPlainButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Adjust the radius as needed
            ),
            fixedSize: const Size(150.0, 150.0)),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon),
            SizedBox(height: 5.0),
            Text(
              label,
              textAlign: TextAlign.center,
            )
          ]),
        ));
  }
}
