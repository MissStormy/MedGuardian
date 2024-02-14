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
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 10,
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
          Divider(
            color: actualTheme.colorScheme.background,
          ),
          const SizedBox(
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
                          const Text('Next dose'),
                          const Divider()
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
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
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Icon(Icons.schedule),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              const Text('Hour'),
                              const SizedBox(width: 5.0),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(time)
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
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
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Icon(Icons.calendar_month),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              const Text('Date'),
                              const SizedBox(width: 5.0),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Text('12/01')
                      ],
                    ),
                  ],
                )
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
                    const Text('See pill'),
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
                  onTap: () => onMoreTap(),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: actualTheme.colorScheme.background,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Icon(Icons.check),
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
