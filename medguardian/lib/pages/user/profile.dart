import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/MSD_pfp.png',
                      width: 190.0,
                      height: 190.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 230.0,
                  height: 230.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/border_pfp.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              'User Name',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'User with privileges',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            Divider(thickness: 1.0, color: Colors.grey),
            SizedBox(height: 10.0),
            _buildSectionTitle(context, 'Personal Information', 'Edit'),
            _buildPersonalInformationFields(),
            Divider(thickness: 1.0, color: Colors.grey),
            SizedBox(height: 20.0),
            _buildSectionTitle(context, 'Utilities', null),
            _buildUtilities(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
      BuildContext context, String title, String? buttonText) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (buttonText != null)
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: actualTheme.colorScheme.onSurface),
              child: Text(buttonText),
            ),
        ],
      ),
    );
  }

  Widget _buildPersonalInformationFields() {
    return Column(
      children: [
        _buildInfoRow(Icons.email, 'Email', 'example@email.com'),
        _buildInfoRow(Icons.phone, 'Phone', '+1 123-456-7890'),
        _buildInfoRow(Icons.lock, 'Password', '********', isPassword: true),
        _buildInfoRow(Icons.location_on, 'Location', '123 Main St'),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8.0),
          Text(label),
          SizedBox(width: 8.0),
          Expanded(
            child: isPassword
                ? TextFormField(
                    obscureText: true,
                    initialValue: value,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: 'Enter $label',
                    ),
                  )
                : Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildUtilities() {
    return Column(
      children: [
        _buildInfoRow(Icons.person, '', 'Activate guardian mode?'),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: Text('Activate'),
        ),
        _buildInfoRow(Icons.logout, 'Log Out', ''),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: Text('Log Out'),
        ),
      ],
    );
  }
}
