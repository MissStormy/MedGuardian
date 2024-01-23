import 'package:flutter/material.dart';
import 'package:medguardian/widgets/custom_date_picker.dart';
import 'package:medguardian/widgets/custom_dropdown.dart';
import 'package:medguardian/widgets/custom_time_picker.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MyTreatCreatPage extends StatefulWidget {
  const MyTreatCreatPage({super.key});

  @override
  _MyTreatCreatPageState createState() => _MyTreatCreatPageState();
}

class _MyTreatCreatPageState extends State<MyTreatCreatPage> {
  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
        body: DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            backgroundColor: actualTheme.colorScheme.primary,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Pirulas',
                ),
                Tab(
                  text: 'Time',
                ),
                Tab(
                  text: 'Alarm',
                ),
                Tab(
                  text: 'Finish',
                ),
              ],
              indicatorColor: Colors.green,
              labelColor: Color.fromARGB(255, 117, 190, 119),
              unselectedLabelColor: Color.fromARGB(255, 86, 114, 87),
            ),
          ),
        ),
        body: const TabBarView(
          children: [FirstPage(), SecondPage(), ThirdPage(), FourthPage()],
        ),
      ),
    ));
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Add widgets for the first page
          const Text('First Page'),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Add widgets for the second page
          const Text('Second Page'),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Previous'),
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Add widgets for the first page
          const Text('Third Page'),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Add widgets for the second page
          const Text('Fourth Page'),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Previous'),
          ),
        ],
      ),
    );
  }
}
