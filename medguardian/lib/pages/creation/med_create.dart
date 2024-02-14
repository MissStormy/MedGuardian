import 'package:flutter/material.dart';
import 'package:medguardian/models/pirulas.dart';
import 'package:medguardian/widgets/Buttons/custom_big_pb.dart';
import 'package:medguardian/widgets/Buttons/custom_plain_button.dart';
import 'package:medguardian/widgets/Buttons/custom_symbol_pb.dart';
import 'package:medguardian/widgets/Text/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

//This page helps you create a new medication, it's like a wizard
class MyMedCreationPage extends StatefulWidget {
  final VoidCallback backToList;
  const MyMedCreationPage({super.key, required this.backToList});

  @override
  State<MyMedCreationPage> createState() => _MyMedCreationPageState();
}

class _MyMedCreationPageState extends State<MyMedCreationPage>
    with SingleTickerProviderStateMixin {
  //As it is a wizard, we decided to separate everything in steps to make it simpler
  //So here you have some tabs, controlled by this
  final PageController _pageController = PageController();
  final int _selectedIndex = 0;
  Pirula pirulaGlobal = Pirula();
  static const List<Tab> myTabs = [
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
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;

    return Scaffold(
        backgroundColor: actualTheme.colorScheme.surface,
        body: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: IgnorePointer(
                  ignoring: true,
                  child: AppBar(
                    backgroundColor: actualTheme.colorScheme.primary,
                    bottom: TabBar(
                      isScrollable: false,
                      tabs: myTabs,
                      controller: _tabController,
                      //Decoration and things for when it's active or not
                      indicatorColor: Colors.green,
                      labelColor: const Color.fromARGB(255, 117, 190, 119),
                      unselectedLabelColor:
                          const Color.fromARGB(255, 86, 114, 87),
                    ),
                  ),
                )),
            body: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                FirstPage(
                    givePirulaNext: (Pirula pirula1) {
                      pirulaGlobal = pirula1;
                      _tabController.animateTo(1);
                    },
                    pirula: pirulaGlobal,
                    nextTab: () {
                      _tabController.animateTo(1);
                    }),
                SecondPage(
                    givePirulaBack: (Pirula pirula1) {
                      pirulaGlobal = pirula1;
                      _tabController.animateTo(0);
                    },
                    givePirulaNext: (Pirula pirula1) {
                      pirulaGlobal = pirula1;
                      _tabController.animateTo(2);
                    },
                    pirula: pirulaGlobal,
                    nextTab: () {
                      _tabController.animateTo(2);
                    }),
                ThirdPage(
                    givePirulaBack: (Pirula pirula1) {
                      pirulaGlobal = pirula1;
                      _tabController.animateTo(1);
                    },
                    givePirulaNext: (Pirula pirula1) {
                      pirulaGlobal = pirula1;
                      _tabController.animateTo(3);
                    },
                    pirula: pirulaGlobal,
                    nextTab: () {
                      _tabController.animateTo(3);
                    }),
                FourthPage(
                    givePirulaBack: (Pirula pirula1) {
                      pirulaGlobal = pirula1;
                      _tabController.animateTo(2);
                    },
                    pirula: pirulaGlobal,
                    backToList: () {
                      widget.backToList();
                    })
              ],
            ),
          ),
        ));
  }
}

//The pages are here so I wouldn't go crazy trying to find them
// FIRST PAGE ##################################################################
class FirstPage extends StatefulWidget {
  final ValueSetter<Pirula> givePirulaNext;
  final Pirula pirula;
  final VoidCallback nextTab;
  const FirstPage(
      {super.key,
      required this.givePirulaNext,
      required this.pirula,
      required this.nextTab});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final brandController = TextEditingController();
  final doseController = TextEditingController();
  final typeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    brandController.dispose();
    doseController.dispose();
    typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    nameController.text = widget.pirula.name;
    brandController.text = widget.pirula.brand;
    doseController.text = widget.pirula.dose;
    typeController.text = widget.pirula.type;

    return Scaffold(
      backgroundColor: actualTheme.colorScheme.surface,
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
                  CustomTextfield(
                      label: 'Pirula name',
                      myController:
                          nameController), //Go to widgets/Text to know more
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextfield(
                      label: 'Brand', myController: brandController),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Flexible(
                          flex: 2,
                          child: CustomTextfield(
                              label: 'Dose', myController: doseController)),
                      const SizedBox(width: 8),
                      Flexible(
                          flex: 3,
                          child: CustomTextfield(
                              label: 'Type', myController: typeController)),
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
                          startsActive: widget.pirula.withFood,
                          onPressed: () {
                            widget.pirula.withFood = !widget.pirula.withFood;
                          }),
                      const SizedBox(
                        width: 10.0,
                      ),
                      CustomPlainButton(
                          //Go to widgets/Buttons to know more
                          label: 'Belly empty',
                          icon: Icons.no_food,
                          startsActive: widget.pirula.withoutFood,
                          onPressed: () {
                            widget.pirula.withoutFood =
                                !widget.pirula.withoutFood;
                          }),
                      const SizedBox(
                        width: 10.0,
                      ),
                      CustomPlainButton(
                          label: 'Other pill',
                          icon: Icons.medication,
                          startsActive: widget.pirula.withOtherPirula,
                          onPressed: () {
                            widget.pirula.withOtherPirula =
                                !widget.pirula.withOtherPirula;
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
        onPressed: () {
          widget.pirula.name = nameController.text;
          widget.pirula.brand = brandController.text;
          widget.pirula.dose = doseController.text;
          widget.pirula.type = typeController.text;
          widget.givePirulaNext(widget.pirula);
          // widget.nextTab;
        },
        backgroundColor: actualTheme.colorScheme.onSurface,
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
    );
  }
}

// SECOND PAGE #################################################################
class SecondPage extends StatelessWidget {
  final ValueSetter<Pirula> givePirulaBack;
  final ValueSetter<Pirula> givePirulaNext;
  final Pirula pirula;
  final VoidCallback nextTab;
  const SecondPage(
      {super.key,
      required this.givePirulaBack,
      required this.pirula,
      required this.nextTab,
      required this.givePirulaNext});

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
                        CustomSymbolPlainButton(
                            label: 'Medical prescription',
                            icon: Icons.radio_button_unchecked,
                            onPressed: null),
                        SizedBox(
                          width: 3.0,
                        ),
                        CustomSymbolPlainButton(
                            label: 'Estupefaciente',
                            icon: Icons.circle,
                            onPressed: null),
                        SizedBox(
                          width: 3.0,
                        ),
                        CustomSymbolPlainButton(
                            label: 'Psicotropico',
                            icon: Icons.motion_photos_off,
                            onPressed: null)
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSymbolPlainButton(
                            label: 'Conduccion desaconsejada',
                            icon: Icons.directions_car_filled_outlined,
                            onPressed: null),
                        SizedBox(
                          width: 3.0,
                        ),
                        CustomSymbolPlainButton(
                            label: 'Fotosensibilidad',
                            icon: Icons.light_mode,
                            onPressed: null),
                        SizedBox(
                          width: 3.0,
                        ),
                        CustomSymbolPlainButton(
                            label: 'Radioactivo',
                            icon: Icons.support,
                            onPressed: null)
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSymbolPlainButton(
                            label: 'Gas comburente',
                            icon: Icons.local_fire_department,
                            onPressed: null),
                        SizedBox(
                          width: 3.0,
                        ),
                        CustomSymbolPlainButton(
                            label: 'Gas inflamable',
                            icon: Icons.whatshot,
                            onPressed: null),
                        SizedBox(
                          width: 3.0,
                        ),
                        CustomSymbolPlainButton(
                            label: 'Autorizado AEMPS',
                            icon: Icons.health_and_safety,
                            onPressed: null)
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: 30,
            bottom: 20,
            child: FloatingActionButton(
              heroTag: 'floatingNext',
              onPressed: () {
                givePirulaNext(pirula);
              },
              backgroundColor: actualTheme.colorScheme.onSurface,
              elevation: 10,
              shape: const CircleBorder(),
              child: const Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ),
          Positioned(
            left: 30,
            bottom: 20,
            child: FloatingActionButton(
              heroTag: 'floatingBack',
              onPressed: () {
                givePirulaBack(pirula);
              },
              backgroundColor: actualTheme.colorScheme.onSurface,
              elevation: 10,
              shape: const CircleBorder(),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     givePirulaNext(pirula);
      //   },
      //   backgroundColor: actualTheme.colorScheme.onSurface,
      //   elevation: 10,
      //   shape: const CircleBorder(),
      //   child: const Icon(Icons.arrow_forward, color: Colors.white),
      // ),
    );
  }
}

// THIRD PAGE ##################################################################
class ThirdPage extends StatelessWidget {
  final ValueSetter<Pirula> givePirulaBack;
  final ValueSetter<Pirula> givePirulaNext;
  final Pirula pirula;
  final VoidCallback nextTab;
  const ThirdPage(
      {super.key,
      required this.givePirulaBack,
      required this.pirula,
      required this.nextTab,
      required this.givePirulaNext});

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: 30,
            bottom: 20,
            child: FloatingActionButton(
              heroTag: 'floatingNext',
              onPressed: () {
                givePirulaNext(pirula);
              },
              backgroundColor: actualTheme.colorScheme.onSurface,
              elevation: 10,
              shape: const CircleBorder(),
              child: const Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ),
          Positioned(
            left: 30,
            bottom: 20,
            child: FloatingActionButton(
              heroTag: 'floatingBack',
              onPressed: () {
                givePirulaBack(pirula);
              },
              backgroundColor: actualTheme.colorScheme.onSurface,
              elevation: 10,
              shape: const CircleBorder(),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

// FOURTH PAGE #################################################################
class FourthPage extends StatelessWidget {
  final ValueSetter<Pirula> givePirulaBack;
  final Pirula pirula;
  final VoidCallback backToList;
  const FourthPage(
      {super.key,
      required this.givePirulaBack,
      required this.pirula,
      required this.backToList});

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
                            child: Text(
                              pirula.name,
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
                            child: Text(
                              pirula.brand,
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
                            child: Text(
                              pirula.dose,
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
                            child: Text(
                              pirula.type,
                              textAlign: TextAlign.center,
                            ),
                          )), //PLACEHOLDER: CHANGE IBUPROFENO WITH DATA FROM PIRULAS INFO
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const Flexible(
                          flex: 2,
                          child: Text(
                            'Symbols',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(width: 13),
                      Flexible(
                          flex: 3,
                          child: CustomPlainButton(
                            label: 'With food',
                            icon: Icons.lunch_dining,
                            startsActive: pirula.withFood,
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
                            startsActive: false,
                            onPressed: null,
                          )),
                      SizedBox(width: 25),
                      Flexible(
                          flex: 3,
                          child: CustomPlainButton(
                            label: 'Box',
                            icon: Icons.archive,
                            startsActive: false,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: 30,
            bottom: 20,
            child: FloatingActionButton(
              heroTag: 'floatingNext',
              onPressed: () {
                pirula.savePirula(pirula);
                backToList();
              },
              backgroundColor: actualTheme.colorScheme.onSurface,
              elevation: 10,
              shape: const CircleBorder(),
              child: const Icon(Icons.done, color: Colors.white),
            ),
          ),
          Positioned(
            left: 30,
            bottom: 20,
            child: FloatingActionButton(
              heroTag: 'floatingBack',
              onPressed: () {
                givePirulaBack(pirula);
              },
              backgroundColor: actualTheme.colorScheme.onSurface,
              elevation: 10,
              shape: const CircleBorder(),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     givePirulaBack(pirula);
      //   },
      //   backgroundColor: actualTheme.colorScheme.onSurface,
      //   elevation: 10,
      //   shape: const CircleBorder(),
      //   child: const Icon(Icons.done, color: Colors.white),
      // ),
    );
  }
}
