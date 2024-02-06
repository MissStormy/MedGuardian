import 'package:flutter/material.dart';
import 'package:medguardian/provider/guardian.dart';
import 'package:medguardian/widgets/Containers/custom_accordion.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({super.key});

  @override
  State<MySettingsPage> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  String selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    final guardianModeProvider = Provider.of<GuardianModeProvider>(context);

    return Scaffold(
        backgroundColor: actualTheme.colorScheme.surface,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Global",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              //Global settings:
              //  ✦ Theme          ✦ Others
              //  ✦ Notifications  ✦
              //  ✦ Language       ✦
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: actualTheme.colorScheme.secondary,
                        border:
                            Border.all(color: actualTheme.colorScheme.primary),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Dark mode",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Switch(
                            value: Provider.of<ThemeLoader>(context).darkTheme,
                            onChanged: (bool value) {
                              if (value) {
                                Provider.of<ThemeLoader>(context, listen: false)
                                    .darkTheme = true;
                              } else {
                                Provider.of<ThemeLoader>(context, listen: false)
                                    .lightTheme = true;
                              }
                            },
                            activeColor: actualTheme.colorScheme.onBackground,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: actualTheme.colorScheme.secondary,
                        border:
                            Border.all(color: actualTheme.colorScheme.primary),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Notifications",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Switch(
                            value: true,
                            onChanged: (bool value) {},
                            activeColor: actualTheme.colorScheme.onBackground,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Miscellanea settings
              // ✦ Doctor images
              // ✦
              // ✦
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Miscellanea",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: actualTheme.colorScheme.secondary,
                        border:
                            Border.all(color: actualTheme.colorScheme.primary),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Doctors",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Switch(
                            value: true,
                            onChanged: (bool value) {},
                            activeColor: actualTheme.colorScheme.onBackground,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Support settings
              // ✦ Help & Support    ✦ Log out
              // ✦ Terms & Policies  ✦ Guardian mode
              // ✦ Report a problem  ✦
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Support",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomAccordion(
                      title: "Help & Support",
                      actualTheme: actualTheme,
                    ),
                    CustomAccordion(
                      title: "Terms & Policies",
                      actualTheme: actualTheme,
                    ),
                    CustomAccordion(
                      title: "Report a problem",
                      actualTheme: actualTheme,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: actualTheme.colorScheme.secondary,
                        border:
                            Border.all(color: actualTheme.colorScheme.primary),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: SwitchListTile(
                        title: Text(
                          "Guardian mode",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: actualTheme.colorScheme.onBackground,
                          ),
                        ),
                        value: guardianModeProvider.guardianModeEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            guardianModeProvider.toggleGuardianMode();
                          });
                        },
                        activeColor: actualTheme.colorScheme.primary,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                    CustomAccordion(
                      title: "Log out",
                      actualTheme: actualTheme,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
