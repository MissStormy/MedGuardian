import 'package:flutter/material.dart';
import 'package:medguardian/widgets/Containers/custom_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

//Just like med_create.dart, this one creates treatments through a wizard

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

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String selectedValue = 'Ibuprofeno';

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Pirulas info',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 5.0),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomDropdown(
                    label: 'Medicine',
                    items: ['Ibuprofeno', 'Plutonic drug'],
                    value: selectedValue,
                    onChanged: (newValue) {
                      // Update the selected value using setState
                      setState(() {
                        selectedValue = newValue ?? '';
                      });
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Pirula information',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(children: [
                        Text(
                          selectedValue,
                          style: TextStyle(fontSize: 20),
                        ),
                        //Here comes the rest of the Pirula's information
                      ]))
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: actualTheme.colorScheme.onSurface,
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Pirulas info',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 5.0),
            Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                padding: const EdgeInsets.all(16.0),
                child: Column(children: []))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: actualTheme.colorScheme.onSurface,
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Pirulas info',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 5.0),
            Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                padding: const EdgeInsets.all(16.0),
                child: Column(children: []))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: actualTheme.colorScheme.onSurface,
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Pirulas info',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 5.0),
            Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                padding: const EdgeInsets.all(16.0),
                child: Column(children: []))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: actualTheme.colorScheme.onSurface,
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(Icons.done, color: Colors.white),
      ),
    );
  }
}
