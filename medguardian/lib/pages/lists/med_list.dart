import 'package:flutter/material.dart';
import 'package:medguardian/widgets/Containers/custom_medicine_container.dart';
import 'package:medguardian/widgets/Extra/search_bar.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MyMedListPage extends StatelessWidget {
  final VoidCallback createMed;
  const MyMedListPage({super.key, required this.createMed});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomSearchBar(
                            controller: searchController,
                            onSubmitted: (query) {
                              print("Search submitted: $query");
                            }),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: actualTheme.colorScheme.onSurface,
                            foregroundColor: Colors.white,
                          ),
                          child: const Icon(Icons.filter_alt))
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const MedicineAccordion(
                      name: 'Medicine 1', type: 'Type A', pillCount: 10),
                  const MedicineAccordion(
                      name: 'Medicine 2', type: 'Type B', pillCount: 20),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createMed(),
        backgroundColor: actualTheme.colorScheme.onSurface,
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
