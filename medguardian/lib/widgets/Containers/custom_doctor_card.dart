import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class CustomDoctorCard extends StatelessWidget {
  // Image  Dr. Name
  // Image  Type of consultation    VideocallIcon
  //
  //  CalIcon Date                HourIcon  Hour

  //Image Icon (placeholder)
  final IconData image;
  final String name;
  final String consultation;

  const CustomDoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.consultation,
  });

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Container(
      //margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
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
                children: [
                  Text(
                    name,
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
                width: 10.0,
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
