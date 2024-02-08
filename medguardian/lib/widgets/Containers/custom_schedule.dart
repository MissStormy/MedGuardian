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
      {super.key,
      required this.image,
      required this.name,
      required this.consultation,
      required this.date,
      required this.hour});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Container(
      //margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: Icon(image),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. $name',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    consultation,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 15),
                  )
                ],
              ),
              const SizedBox(
                width: 30.0,
              ),
              Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: actualTheme.colorScheme.secondary),
                    borderRadius: BorderRadius.circular(25)),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: actualTheme.colorScheme.background,
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.video_call),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_month),
                const SizedBox(
                  width: 10.0,
                ),
                Text(date),
                const SizedBox(
                  width: 30.0,
                ),
                const Icon(Icons.schedule),
                const SizedBox(
                  width: 10.0,
                ),
                Text(hour)
              ],
            ),
          )
        ],
      ),
    );
  }
}
