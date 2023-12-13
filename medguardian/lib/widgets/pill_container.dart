import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class PirulasContainer extends StatelessWidget {
  final String title;
  final String text;
  final String hour;
  final IconData icon;

  const PirulasContainer({
    required this.title,
    required this.text,
    required this.hour,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          // CircleAvatar surrounding the icon
          CircleAvatar(
            child: Icon(icon, color: actualTheme.colorScheme.background),

            radius: 20, // Adjust the radius as needed
          ),

          // Padding between circle and text
          const SizedBox(width: 15),
          // Pill name and text in a column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pill name (title)
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              // Pill text
              Text(
                text,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),

          // Additional text to the right
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                hour,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: actualTheme.colorScheme.error),
              ),
            ),
          ),
          SizedBox(height: 5),
          // Three dots for more (you can replace this with your icon)
          const Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
