import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MedicationItem extends StatelessWidget {
  final String time;
  final String name;
  final IconData icon;
  final VoidCallback onMoreTap;

  const MedicationItem({
    super.key,
    required this.time,
    required this.name,
    required this.icon,
    required this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
          //border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(25.0),
          color: actualTheme.colorScheme.primary),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: actualTheme.colorScheme.secondary),
                        borderRadius: BorderRadius.circular(25)),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: actualTheme.colorScheme.background,
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.medication),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                decoration: BoxDecoration(
                    color: actualTheme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(25.0)),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: actualTheme.colorScheme.background,
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.border_color),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text('Edit'),
                    SizedBox(width: 5.0),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            color: actualTheme.colorScheme.background,
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            //margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                      decoration: BoxDecoration(
                          color: actualTheme.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: actualTheme.colorScheme.background,
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.medical_information),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text('Next dose'),
                          Divider()
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3.0),
                          decoration: BoxDecoration(
                              color: actualTheme.colorScheme.secondary,
                              borderRadius: BorderRadius.circular(25.0)),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: actualTheme.colorScheme.background,
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(Icons.schedule),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text('Hour'),
                              SizedBox(width: 5.0),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(time)
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3.0),
                          decoration: BoxDecoration(
                              color: actualTheme.colorScheme.secondary,
                              borderRadius: BorderRadius.circular(25.0)),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: actualTheme.colorScheme.background,
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(Icons.calendar_month),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text('Date'),
                              SizedBox(width: 5.0),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text('12/01')
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                decoration: BoxDecoration(
                    color: actualTheme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(25.0)),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: actualTheme.colorScheme.background,
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.medical_services),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text('See pill'),
                    SizedBox(width: 5.0),
                  ],
                ),
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
                    child: Icon(Icons.check),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
