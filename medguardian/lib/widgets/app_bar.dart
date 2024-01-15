import 'package:flutter/material.dart';
import 'package:medguardian/pages/settings_page.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return AppBar(
      backgroundColor: actualTheme.colorScheme.secondary,
      //Left side of the appbar
      leading: IconButton(
        icon: const Icon(Icons.account_circle),
        onPressed: () {
          
        },
      ),
      //Center: Title and image logo
      title: Row(
        children: [
          const Spacer(), // Spacer to center the logo
          Image.asset(
            'assets/logo.png',
            width: 60.0,
          ),
          const Spacer(), // Spacer to center the logo
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MySettingsPage()));
            },
            icon: const Icon(Icons.settings))
      ],
    );
  }
}
