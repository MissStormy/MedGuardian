import 'package:flutter/material.dart';

class BigContainer extends StatelessWidget {
  final String containerName;
  final List<Widget> content;

  const BigContainer({
    required this.containerName,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
         
            Text(
              containerName,
              style: TextStyle(fontSize: 24),
            ),
          
          // Dynamic content using ListView.builder
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
