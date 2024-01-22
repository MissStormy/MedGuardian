import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class CustomAccordion extends StatelessWidget {
  final String title;
  final ThemeData actualTheme;

  const CustomAccordion({required this.title, required this.actualTheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: actualTheme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Quicksand'),
                ),
              ],
            ),
          ),
          children: [
            
          ],
        ),
      ),
    );
  }
}
