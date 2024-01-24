import 'package:flutter/material.dart';
import 'package:medguardian/widgets/Buttons/custom_big_pb.dart';
import 'package:medguardian/widgets/Buttons/custom_plain_button.dart';
import 'package:medguardian/widgets/Text/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

//This page helps you create a new medication, it's like a wizard
class MyMedCreationPage extends StatefulWidget {
  const MyMedCreationPage({super.key});

  @override
  State<MyMedCreationPage> createState() => _MyMedCreationPageState();
}

class _MyMedCreationPageState extends State<MyMedCreationPage> {
  //As it is a wizard, we decided to separate everything in steps to make it simpler
  //So here you have some tabs, controlled by this 
  final PageController _pageController = PageController();
  final int _selectedIndex = 0;

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
              ],//Decoration and things for when it's active or not
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
//The pages are here so I wouldn't go crazy trying to find them
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

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
                  const CustomTextfield(label: 'Pirula name'), //Go to widgets/Text to know more
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CustomTextfield(label: 'Brand'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Row(
                    children: [
                      Flexible(flex: 2, child: CustomTextfield(label: 'Dose')),
                      SizedBox(width: 8),
                      Flexible(flex: 3, child: CustomTextfield(label: 'Type')),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'How do you have to take it?',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPlainButton(
                          label: 'With food',
                          icon: Icons.lunch_dining,
                          onPressed: () { //TODO: Placeholder, for now it shows a message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Awesome Snackbar!'),
                                action: SnackBarAction(
                                  label: 'Action',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          }),
                      const SizedBox(
                        width: 10.0,
                      ),
                      CustomPlainButton( //Go to widgets/Buttons to know more
                          label: 'Belly empty',
                          icon: Icons.no_food,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Awesome Snackbar!'),
                                action: SnackBarAction(
                                  label: 'Action',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          }),
                      const SizedBox(
                        width: 10.0,
                      ),
                      CustomPlainButton(
                          label: 'Other pill',
                          icon: Icons.medication,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Awesome Snackbar!'),
                                action: SnackBarAction(
                                  label: 'Action',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          })
                    ],
                  )
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5.0),
            const Text(
              'Symbols',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 5.0),
            Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                padding: const EdgeInsets.all(16.0),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPlainButton(
                            label: 'Fridge',
                            icon: Icons.ac_unit,
                            onPressed: null),
                        SizedBox(
                          width: 10.0,
                        ),
                        CustomPlainButton(
                            label: 'Fridge',
                            icon: Icons.ac_unit,
                            onPressed: null),
                        SizedBox(
                          width: 10.0,
                        ),
                        CustomPlainButton(
                            label: 'Fridge',
                            icon: Icons.ac_unit,
                            onPressed: null)
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPlainButton(
                            label: 'Fridge',
                            icon: Icons.ac_unit,
                            onPressed: null),
                        SizedBox(
                          width: 10.0,
                        ),
                        CustomPlainButton(
                            label: 'Fridge',
                            icon: Icons.ac_unit,
                            onPressed: null),
                        SizedBox(
                          width: 10.0,
                        ),
                        CustomPlainButton(
                            label: 'Fridge',
                            icon: Icons.ac_unit,
                            onPressed: null)
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPlainButton(
                            label: 'Fridge',
                            icon: Icons.ac_unit,
                            onPressed: null),
                        SizedBox(
                          width: 10.0,
                        ),
                        CustomPlainButton(
                            label: 'Fridge',
                            icon: Icons.ac_unit,
                            onPressed: null),
                        SizedBox(
                          width: 10.0,
                        ),
                        CustomPlainButton(
                            label: 'Fridge',
                            icon: Icons.ac_unit,
                            onPressed: null)
                      ],
                    )
                  ],
                ))
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
            const SizedBox(height: 5.0),
            const Text(
              'Images',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 5.0),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const CustomBigPlainButton(
                          label: 'Pirula image',
                          icon: Icons.medication,
                          onPressed: null),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                            'Insert an image of the pill, this will help you find it easier'),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    children: [
                      const CustomBigPlainButton(
                          label: 'Box image',
                          icon: Icons.archive,
                          onPressed: null),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                            'Insert an image of the box, this will help you find it easier'),
                      ))
                    ],
                  )
                ],
              ),
            )
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
            const SizedBox(height: 5.0),
            const Text(
              'Review',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 5.0),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Flexible(
                          flex: 2,
                          child: Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(width: 27),
                      Flexible(
                          flex: 8,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Text(
                              'Ibuprofeno',
                              textAlign: TextAlign.center,
                            ),
                          )), //PLACEHOLDER: CHANGE IBUPROFENO WITH DATA FROM PIRULAS INFO
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      const Flexible(
                          flex: 2,
                          child: Text(
                            'Brand',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(width: 26),
                      Flexible(
                          flex: 7,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Text(
                              'ACME',
                              textAlign: TextAlign.center,
                            ),
                          )), //PLACEHOLDER: CHANGE IBUPROFENO WITH DATA FROM PIRULAS INFO
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      const Flexible(
                          flex: 2,
                          child: Text(
                            'Dose',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(width: 37),
                      Flexible(
                          flex: 8,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Text(
                              'ACME',
                              textAlign: TextAlign.center,
                            ),
                          )), //PLACEHOLDER: CHANGE IBUPROFENO WITH DATA FROM PIRULAS INFO
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      const Flexible(
                          flex: 2,
                          child: Text(
                            'Type',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(width: 37),
                      Flexible(
                          flex: 8,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Text(
                              'ACME',
                              textAlign: TextAlign.center,
                            ),
                          )), //PLACEHOLDER: CHANGE IBUPROFENO WITH DATA FROM PIRULAS INFO
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Row(
                    children: [
                      Flexible(
                          flex: 2,
                          child: Text(
                            'Symbols',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(width: 13),
                      Flexible(
                          flex: 3,
                          child: CustomPlainButton(
                            label: 'With food',
                            icon: Icons.lunch_dining,
                            onPressed: null,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Row(
                    children: [
                      Flexible(
                          flex: 3,
                          child: Text(
                            'Images',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(width: 25),
                      Flexible(
                          flex: 3,
                          child: CustomPlainButton(
                            label: 'Pill',
                            icon: Icons.medication,
                            onPressed: null,
                          )),
                      SizedBox(width: 25),
                      Flexible(
                          flex: 3,
                          child: CustomPlainButton(
                            label: 'Box',
                            icon: Icons.archive,
                            onPressed: null,
                          ))
                    ],
                  )
                ],
              ),
            )
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
