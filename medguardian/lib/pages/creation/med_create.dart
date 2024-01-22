import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MyMedCreationPage extends StatefulWidget {
  const MyMedCreationPage({super.key});

  @override
  State<MyMedCreationPage> createState() => _MyMedCreationPageState();
}

class _MyMedCreationPageState extends State<MyMedCreationPage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;

    return Scaffold(
        body: DefaultTabController(
      length: 4,
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
                Tab(
                    icon: Icon(
                  Icons.healing,
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
        body: TabBarView(
          children: [FirstPage(), SecondPage(), ThirdPage(), FourthPage()],
        ),
      ),
    ));
  }

  // Add this method to handle page navigation
  void _navigateToPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Add widgets for the first page
          Text('First Page'),
          ElevatedButton(
            onPressed: () {},
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Add widgets for the second page
          Text('Second Page'),
          ElevatedButton(
            onPressed: () {},
            child: Text('Previous'),
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Add widgets for the first page
          Text('Third Page'),
          ElevatedButton(
            onPressed: () {},
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Add widgets for the second page
          Text('Fourth Page'),
          ElevatedButton(
            onPressed: () {},
            child: Text('Previous'),
          ),
        ],
      ),
    );
  }
}
