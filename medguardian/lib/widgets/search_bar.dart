import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onSubmitted;

  CustomSearchBar({required this.controller, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search...',
          icon: Icon(Icons.search),
          border: InputBorder.none,
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
