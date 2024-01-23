import 'package:flutter/material.dart';
import 'package:medguardian/pages/creation/med_create.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MyCreateMedNexusPage extends StatefulWidget {
  const MyCreateMedNexusPage({super.key});

  @override
  State<MyCreateMedNexusPage> createState() => _MyCreateMedNexusPageState();
}

class _MyCreateMedNexusPageState extends State<MyCreateMedNexusPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [const MyCreateMedNexusPage(), const FirstPage()];
  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Here I have to return somehow the value of index = 7 to change from the nexus
          setState(() {
            _selectedIndex = 2;
          });
        },
        backgroundColor: actualTheme.colorScheme.onSurface,
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _navigateToScreen(String route) {
    Navigator.pushNamed(context, route);
  }
}
