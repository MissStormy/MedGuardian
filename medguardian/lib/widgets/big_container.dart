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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                containerName,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 189,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: content,
          ),
        ),
      ],
    );
  }
}
