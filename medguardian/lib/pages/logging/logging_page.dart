import 'package:flutter/material.dart';
import 'package:medguardian/pages/logging/log_sign_in.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:provider/provider.dart';

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/loginBG.jpg',
            fit: BoxFit.cover,
          ),
          // Logo in the middle
          Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/logo.png',
                height: 150,
                width: 150,
              ),
            ),
          ),
          // Buttons at the bottom
          Positioned(
            left: 16,
            right: 16,
            bottom: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to login page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyLoginInPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: actualTheme
                        .colorScheme.onSurface, // Set the background color
                    foregroundColor: Colors.white, // Set the text color
                  ),
                  child: const Text('Login',
                  style: TextStyle(
                      fontFamily:
                          'Quicksand', 
                      fontSize: 25, 
                    ),),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to sign-up page
                    _navigateToSignInPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: actualTheme
                        .colorScheme.onSurface, // Set the background color
                    foregroundColor: Colors.white, // Set the text color
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily:
                          'Quicksand', 
                      fontSize: 25, 
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _navigateToSignInPage(BuildContext context) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const MyLoginInPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    ),
  );
}
