import 'package:flutter/material.dart';

class CustomSmallPlainButton extends StatelessWidget {
  
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomSmallPlainButton(
      {super.key,
      
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
            fixedSize: const Size(50.0, 50.0)),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon),
            
          ]),
        ));
  }
}
