import 'package:flutter/material.dart';

class ScheduleContainer extends StatelessWidget {
  final List<Widget> content;
  const ScheduleContainer({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: content.length,
          itemBuilder: (context, index) {
            return content[index];
          },
        ),
      ]),
    );
  }
}
