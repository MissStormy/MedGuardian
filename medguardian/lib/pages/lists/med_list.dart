import 'package:flutter/material.dart';
import 'package:medguardian/pages/creation/create_med_nexus.dart';
import 'package:medguardian/pages/creation/med_create.dart';
import 'package:medguardian/widgets/custom_medicine_container.dart';
import 'package:medguardian/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

/*class MyMedListPage extends StatefulWidget {
  final VoidCallback createMed;
  MyMedListPage({required this.createMed});

  @override
  State<MyMedListPage> createState() => _MyMedListPageState();
}

class _MyMedListPageState extends State<MyMedListPage> {
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
                      SizedBox(
                        width: 8.0,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: actualTheme.colorScheme.onSurface,
                            foregroundColor: Colors.white,
                          ),
                          child: Icon(Icons.filter_alt))
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  MedicineAccordion(
                      name: 'Medicine 1', type: 'Type A', pillCount: 10),
                  MedicineAccordion(
                      name: 'Medicine 2', type: 'Type B', pillCount: 20),
                  ElevatedButton(
                      onPressed: () => createMed(),
                      child: Text("CREA UN MEDICAMENTO"))
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Here I have to return somehow the value of index = 7 to change from the nexus
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Awesome Snackbar!'),
              action: SnackBarAction(
                label: 'Action',
                onPressed: () {
                  // Code to execute.
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: actualTheme.colorScheme.onSurface,
        elevation: 10,
        shape: CircleBorder(),
      ),
    );
  }

  void _navigateToScreen(String route) {
    Navigator.pushNamed(context, route);
  }
}*/
class MyMedListPage extends StatelessWidget {
  final VoidCallback createMed;
  MyMedListPage({required this.createMed});

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
                      SizedBox(
                        width: 8.0,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: actualTheme.colorScheme.onSurface,
                            foregroundColor: Colors.white,
                          ),
                          child: Icon(Icons.filter_alt))
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  MedicineAccordion(
                      name: 'Medicine 1', type: 'Type A', pillCount: 10),
                  MedicineAccordion(
                      name: 'Medicine 2', type: 'Type B', pillCount: 20),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createMed(),
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: actualTheme.colorScheme.onSurface,
        elevation: 10,
        shape: CircleBorder(),
      ),
    );
  }
}
