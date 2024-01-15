import 'package:flutter/material.dart';
import 'package:medguardian/pages/creation/med_create.dart';
import 'package:medguardian/pages/creation/treat_create.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MyCreateNexusPage extends StatefulWidget {
  const MyCreateNexusPage({super.key});

  @override
  State<MyCreateNexusPage> createState() => _MyCreateNexusPageState();
}

class _MyCreateNexusPageState extends State<MyCreateNexusPage> {
  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar(
            backgroundColor: actualTheme.colorScheme.primary,
            bottom: const TabBar(
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.medication,
                )),
                Tab(
                    icon: Icon(
                  Icons.healing,
                )),
              ],
              indicatorColor: Colors.green,
              labelColor: Color.fromARGB(255, 117, 190, 119),
              unselectedLabelColor: Color.fromARGB(255, 86, 114, 87),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            MyMedCreationPage(),
            MyTreatCreatPage(),
          ],
        ),
      ),
    );
  }
}
