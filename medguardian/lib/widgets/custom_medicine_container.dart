import 'package:flutter/material.dart';

class CustomMedicine extends StatefulWidget {
  final String title;
  final String text;
  final String hour;
  final IconData icon;

  const CustomMedicine({
    required this.title,
    required this.text,
    required this.hour,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  _CustomMedicineState createState() => _CustomMedicineState();
}

class _CustomMedicineState extends State<CustomMedicine> {
  bool isExpanded = false;
  bool isLowPillsAlertEnabled = false;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 7));

  @override
  Widget build(BuildContext context) {
    final actualTheme = Theme.of(context);

    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          this.isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: Icon(widget.icon,
                        color: actualTheme.colorScheme.background),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.text,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        widget.hour,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: actualTheme.colorScheme.error,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            );
          },
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Activate Low Pills Alert:'),
                    Switch(
                      value: isLowPillsAlertEnabled,
                      onChanged: (value) {
                        setState(() {
                          isLowPillsAlertEnabled = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('Start Date:'),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: startDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );

                        if (pickedDate != null && pickedDate != startDate) {
                          setState(() {
                            startDate = pickedDate;
                          });
                        }
                      },
                      child: Text(
                        "${startDate.toLocal()}".split(' ')[0],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('End Date:'),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: endDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );

                        if (pickedDate != null && pickedDate != endDate) {
                          setState(() {
                            endDate = pickedDate;
                          });
                        }
                      },
                      child: Text(
                        "${endDate.toLocal()}".split(' ')[0],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}
