import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MedicineAccordion extends StatelessWidget {
  final String name;
  final String brand;
  final String type;
  final int pillCount;

  const MedicineAccordion(
      {super.key,
      required this.name,
      required this.type,
      required this.pillCount,
      required this.brand});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
                      Text(
                        brand,
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )
                ],
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
          Divider(),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                          Text('Type'),
                          SizedBox(width: 5.0),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(type)
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
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
                              child: Icon(Icons.discount),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text('Quantity'),
                          SizedBox(width: 5.0),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text('$pillCount')
                  ],
                ),
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
                    Text('Create treatment'),
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
                    child: Icon(Icons.camera),
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
