import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class CustomSmallPlainButton extends StatelessWidget {
  
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomSmallPlainButton(
      {super.key,
      
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
            fixedSize: const Size(50.0, 50.0)),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon),
            
          ]),
        ));
  }
}
