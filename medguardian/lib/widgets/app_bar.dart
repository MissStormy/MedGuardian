import 'package:flutter/material.dart';
import 'package:medguardian/pages/profile_page.dart';
import 'package:medguardian/pages/settings_page.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {

  //final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 89, 190, 194),
      //Left side of the appbar
      leading: IconButton(
        icon: const Icon(Icons.account_circle),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyProfilePage()));
        },
      ),
      //Center: Title and image logo
      title: const Row(
        children: [
          //Here goes the logo
          Icon(Icons.medication),
          //Title of the app
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "MedGuardian",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MySettingsPage()));
            },
            icon: const Icon(Icons.settings))
      ],
    );
  }
}
