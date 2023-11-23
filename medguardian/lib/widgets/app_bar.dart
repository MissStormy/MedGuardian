import 'package:flutter/material.dart';
import 'package:medguardian/pages/profile_page.dart';
import 'package:medguardian/pages/settings_page.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 89, 190, 194),
      //Left side of the appbar
      leading: IconButton(
        icon: Icon(Icons.account_circle),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyProfilePage()));
        },
      ),
      //Center: Title and image logo
      title: Row(
        children: [
          //Here goes the logo
          Icon(Icons.medication),
          //Title of the app
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  MaterialPageRoute(builder: (context) => MySettingsPage()));
            },
            icon: Icon(Icons.settings))
      ],
    );
  }
}
