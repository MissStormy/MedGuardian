import 'package:flutter/material.dart';
import 'package:medguardian/provider/guardian.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:medguardian/widgets/Containers/custom_doctor_card.dart';
import 'package:medguardian/widgets/Extra/search_bar.dart';
import 'package:provider/provider.dart';

class DoctorsList extends StatefulWidget {
  const DoctorsList({Key? key}) : super(key: key);

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  final TextEditingController searchController = TextEditingController();
  bool showAllNearbyDoctors = false;
  bool showAllRecommendedDoctors = false;

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    final guardianModeProvider = Provider.of<GuardianModeProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomSearchBar(
                          controller: searchController,
                          onSubmitted: (query) {
                            print("Search submitted: $query");
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: actualTheme.colorScheme.onSurface,
                          foregroundColor: Colors.white,
                        ),
                        child: const Icon(Icons.filter_alt),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Doctor Nearby'),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showAllNearbyDoctors = !showAllNearbyDoctors;
                            });
                          },
                          child: Text(
                            showAllNearbyDoctors ? 'Hide All' : 'Show All',
                            style: TextStyle(
                              color: actualTheme.colorScheme.onError,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                    child: Column(
                      children: [
                        CustomDoctorCard(
                          image: Icons.person,
                          name: 'Dr. Frankestein',
                          consultation: 'Necromancy',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        if (showAllNearbyDoctors)
                          CustomDoctorCard(
                            image: Icons.person,
                            name: 'Dr. Acula',
                            consultation: 'Blood tasting',
                          ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recommended'),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showAllRecommendedDoctors =
                                  !showAllRecommendedDoctors;
                            });
                          },
                          child: Text(
                            showAllRecommendedDoctors ? 'Hide All' : 'Show All',
                            style: TextStyle(
                              color: actualTheme.colorScheme.onError,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                    child: Column(
                      children: [
                        CustomDoctorCard(
                          image: Icons.person,
                          name: 'Dr. Frankestein',
                          consultation: 'Necromancy',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        if (showAllRecommendedDoctors)
                          CustomDoctorCard(
                            image: Icons.person,
                            name: 'Dr. Acula',
                            consultation: 'Blood tasting',
                          ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
