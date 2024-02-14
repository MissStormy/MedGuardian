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
                    padding: const EdgeInsets.all(3.0),
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
                        padding: const EdgeInsets.all(10.0),
                        child: const Icon(Icons.medication),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        brand,
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
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
                        padding: const EdgeInsets.all(10.0),
                        child: const Icon(Icons.border_color),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Text('Edit'),
                    const SizedBox(width: 5.0),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Divider(),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
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
                              padding: const EdgeInsets.all(10.0),
                              child: const Icon(Icons.medical_information),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          const Text('Type'),
                          const SizedBox(width: 5.0),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Text(type)
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
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
                              padding: const EdgeInsets.all(10.0),
                              child: const Icon(Icons.discount),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          const Text('Quantity'),
                          const SizedBox(width: 5.0),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Text('$pillCount')
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
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
                        padding: const EdgeInsets.all(10.0),
                        child: const Icon(Icons.medical_services),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Text('Create treatment'),
                    const SizedBox(width: 5.0),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(3.0),
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
                    padding: const EdgeInsets.all(10.0),
                    child: const Icon(Icons.camera),
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
