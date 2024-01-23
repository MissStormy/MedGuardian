import 'package:flutter/material.dart';
import 'package:medguardian/nexus.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:provider/provider.dart';

class MyLoginInPage extends StatelessWidget {
  const MyLoginInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      appBar: AppBar(
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
      ),
      backgroundColor: actualTheme.colorScheme.secondary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title "Sign In"
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // TextFields for username and password
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(
                      fontFamily:
                          'Quicksand', 
                      fontSize: 25, 
                    ),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                      fontFamily:
                          'Quicksand', 
                      fontSize: 25, 
                    ),
                  
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () {
                      // Toggle password visibility
                    },
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Checkbox "Remind me"
              Row(
                children: [
                  Checkbox(
                    value: false, // Set the initial value accordingly
                    onChanged: (value) {
                      // Handle checkbox state change
                    },
                  ),
                  const Text('Remind me'),
                ],
              ),

              const SizedBox(height: 16),

              // Button "Sign In"
              ElevatedButton(
                onPressed: () {
                  _navigateToNexusPage(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: actualTheme.colorScheme.onSurface, // Set the background color
                  foregroundColor: Colors.white, // Set the text color
                ),
                child: const Text('Sign In',
                style: TextStyle(
                      fontFamily:
                          'Quicksand', 
                      fontSize: 25, 
                    ),),
              ),

              const SizedBox(height: 16),

              // Link to the sign-up page
              GestureDetector(
                onTap: () {
                  
                },
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _navigateToNexusPage(BuildContext context) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const MyNexusPage(),
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
