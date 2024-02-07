import 'package:flutter/material.dart';
import 'package:medguardian/models/pirulas.dart';
import 'package:medguardian/widgets/Containers/custom_medicine_container.dart';
import 'package:medguardian/widgets/Extra/search_bar.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:medguardian/provider/guardian.dart';

class MyMedListPage extends StatelessWidget {
  final VoidCallback createMed;
  const MyMedListPage({super.key, required this.createMed});

  @override
  Widget build(BuildContext context) {
    final Pirula pirula = Pirula();
    final TextEditingController searchController = TextEditingController();
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    final guardianModeProvider = Provider.of<GuardianModeProvider>(context);
    return Scaffold(
      backgroundColor: actualTheme.colorScheme.surface,
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
                  // const MedicineAccordion(
                  //     name: 'Medicine 1', type: 'Type A', pillCount: 10),
                  // const MedicineAccordion(
                  //     name: 'Medicine 2', type: 'Type B', pillCount: 20),
                  FutureBuilder(
                      future: pirula.getPirulas(),
                      builder: (context, AsyncSnapshot<List<Pirula>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return MedicineAccordion(
                                  name: snapshot.data![index].name,
                                  type: snapshot.data![index].type,
                                  pillCount:
                                      snapshot.data![index].currentQuantity);
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: !guardianModeProvider.guardianModeEnabled
          ? FloatingActionButton(
              onPressed: () => createMed(),
              backgroundColor: actualTheme.colorScheme.onSurface,
              elevation: 10,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }
}
