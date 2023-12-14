import 'package:flutter/material.dart';
import 'package:medguardian/pages/alarms_page.dart';
import 'package:medguardian/pages/creation/med_create.dart';
import 'package:medguardian/pages/home/home.dart';
import 'package:medguardian/pages/list_page.dart';
import 'package:medguardian/pages/location/map.dart';
import 'package:medguardian/widgets/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class CustomBtmAppBar extends StatelessWidget {
  const CustomBtmAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;

    return Scaffold(
      appBar: CustomAppBar(),
      body: MyHomePage(),
      bottomNavigationBar: BottomAppBar(
        color: actualTheme.colorScheme.secondary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.medication),
              color: Colors.white,
            ),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(
                  right: 25), // Adjust the horizontal padding
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.place),
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.list),
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.alarm),
              color: Colors.white,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.home, color: Colors.white),
        backgroundColor: actualTheme.colorScheme.primary,
        elevation: 5,
        shape: CircleBorder(), // Set the shape to CircleBorder
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}