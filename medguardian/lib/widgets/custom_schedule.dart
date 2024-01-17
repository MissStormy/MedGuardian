import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class CustomSchedule extends StatelessWidget {
  // Image  Dr. Name
  // Image  Type of consultation    VideocallIcon
  //
  //  CalIcon Date                HourIcon  Hour

  //Image Icon (placeholder)
  final IconData image;
  final String name;
  final String consultation;
  final String date;
  final String hour;

  const CustomSchedule(
      {required this.image,
      required this.name,
      required this.consultation,
      required this.date,
      required this.hour});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: Icon(image),
              ),
              Column(
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    consultation,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              ElevatedButton(onPressed: null, child: Icon(Icons.video_call))
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_month),
                Text(date),
                SizedBox(
                  width: 5.0,
                ),
                Icon(Icons.schedule),
                Text(hour)
              ],
            ),
          )
        ],
      ),
    );
  }
}
