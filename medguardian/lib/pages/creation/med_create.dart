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
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            backgroundColor: actualTheme.colorScheme.primary,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Pirulas',
                ),
                Tab(
                  text: 'Symbols',
                ),
                Tab(
                  text: 'Box',
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
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 5.0),
          const Text(
            'Pirulas info',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 5.0),
          Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child:  Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Pirula name',
                      hintStyle: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 25,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Brand',
                      hintStyle: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Dose',
                            hintStyle: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        flex: 3,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type',
                            hintStyle: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ],
                
              )),
              
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: actualTheme.colorScheme.onSurface,
              foregroundColor: Colors.white,
            ),
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
          SizedBox(height: 5.0),
          const Text(
            'Symbols',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 5.0),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Next'),
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
          SizedBox(height: 5.0),
          const Text(
            'Box info',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 5.0),
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
      child: Column(children: [
        SizedBox(height: 5.0),
        const Text(
          'Review',
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(height: 5.0),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Previous'),
        ),
        Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                
              ],
            )),
      ]),
    );
  }
}
