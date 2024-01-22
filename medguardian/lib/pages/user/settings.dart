import 'package:flutter/material.dart';
import 'package:medguardian/widgets/custom_accordion.dart';
import 'package:medguardian/widgets/custom_dropdown.dart';
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
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(
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
                    border: Border.all(color: actualTheme.colorScheme.primary),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Dark mode",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Switch(
                        value: true,
                        onChanged: (bool value) {},
                        activeColor: actualTheme.colorScheme.onBackground,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: actualTheme.colorScheme.secondary,
                    border: Border.all(color: actualTheme.colorScheme.primary),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Notifications",
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
            child: Text(
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
                    border: Border.all(color: actualTheme.colorScheme.primary),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Doctors",
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
            child: Text(
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
                    title: "Help & Support", actualTheme: actualTheme),
                CustomAccordion(
                    title: "Terms & Policies", actualTheme: actualTheme),
                CustomAccordion(
                    title: "Report a problem", actualTheme: actualTheme),
                CustomAccordion(
                    title: "Guardian mode", actualTheme: actualTheme),
                CustomAccordion(title: "Log out", actualTheme: actualTheme),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
