import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';
class CustomPlainButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomPlainButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            foregroundColor: actualTheme.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0),
            ),
            fixedSize: const Size(90.0, 90.0)),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon),
            const SizedBox(height: 5.0),
            Text(
              label,
              textAlign: TextAlign.center,
            )
          ]),
        ));
  }
}
