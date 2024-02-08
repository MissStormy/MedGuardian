import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final List<String> items;
  String? value;
  final void Function(String?) onChanged;

  CustomDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
  });
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  void initState() {
    super.initState();
    List<DropdownMenuItem<String>> itemmap = widget.items.map((item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontSize: 16),
        ),
      );
    }).toList();
    widget.value = itemmap.first.value;
  }

  @override
  Widget build(BuildContext context) {
    final String label = widget.label;
    final List<String> items = widget.items;
    String? value = widget.value;
    final void Function(String?) onChanged = widget.onChanged;

    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
                color: actualTheme.colorScheme.background, width: 2.0),
          ),
          child: DropdownButton<String>(
            value: value,
            onChanged: onChanged,
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(
                color: actualTheme.colorScheme.onError,
                fontFamily: "Quicksand",
                fontSize: 25),
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 16),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
