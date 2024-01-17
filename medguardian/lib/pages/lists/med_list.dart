import 'package:flutter/material.dart';
import 'package:medguardian/pages/creation/med_create.dart';
import 'package:medguardian/widgets/custom_medicine_container.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MyMedListPage extends StatelessWidget {
  const MyMedListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomMedicine(
              title: "Ibuprofeno",
              text: "Prueba 1",
              hour: "20:00",
              icon: Icons.medication,
            ),
            Divider(),
            CustomMedicine(
              title: "Ibuprofeno",
              text: "Prueba 1",
              hour: "20:00",
              icon: Icons.medication,
            ),
            Divider(),
            CustomMedicine(
              title: "Ibuprofeno",
              text: "Prueba 1",
              hour: "20:00",
              icon: Icons.medication,
            ),
            Divider(),
            CustomMedicine(
              title: "Ibuprofeno",
              text: "Prueba 1",
              hour: "20:00",
              icon: Icons.medication,
            ),
            Divider(),
            CustomMedicine(
              title: "Ibuprofeno",
              text: "Prueba 1",
              hour: "20:00",
              icon: Icons.medication,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyMedCreationPage()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: actualTheme.colorScheme.onSurface,
        elevation: 10,
        shape: CircleBorder(),
      ),
    );
  }
}
