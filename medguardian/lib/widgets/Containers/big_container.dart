import 'package:flutter/material.dart';

class BigContainer extends StatelessWidget {
  final String containerName;
  final List<Widget> content;

  const BigContainer({
    required this.containerName,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
         
            Text(
              containerName,
              style: const TextStyle(fontSize: 24),
            ),
          
          // Dynamic content using ListView.builder
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: content.length,
            itemBuilder: (context, index) {
              return content[index];
            },
          ),
        ],
      ),
    );
  }
}
