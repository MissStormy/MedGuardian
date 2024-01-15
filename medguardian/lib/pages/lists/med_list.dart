import 'package:flutter/material.dart';
import 'package:medguardian/widgets/custom_medicine_container.dart';

class MyMedListPage extends StatelessWidget {
  const MyMedListPage({Key? key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
