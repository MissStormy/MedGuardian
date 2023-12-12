import 'package:flutter/material.dart';

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
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          // Icon on the left
          Icon(icon),
          SizedBox(height: 10),
          // Pill name and text in a column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pill name (title)
              Text(
                title,
                style: TextStyle(fontSize: 20),
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
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          
          // Three dots for more (you can replace this with your icon)
          const Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
