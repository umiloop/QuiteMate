import 'package:flutter/material.dart';
import 'package:flutter_application_1/companents/theme_screen.dart';
import 'package:flutter_application_1/dashboard_home.dart';
import 'package:flutter_application_1/home%20screens/tips.dart';
import 'package:flutter_application_1/login_page.dart'; // Import the login screen/ Import the theme screen
import 'package:google_nav_bar/google_nav_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedIndex = 2; // Default index for Settings tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.white,
        elevation: 0.0, // Remove shadow for a cleaner look (optional)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              ListTile(
                title: const Text('Notifications'),
                trailing: Switch(
                  value: true, // Adjust initial state for notifications
                  onChanged: (value) => setState(() => value = value),
                ),
              ),
              ListTile(
                title: const Text('Change App Theme'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to the ThemeScreen when the option is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThemeScreen()),
                  );
                },
              ),
              ListTile(
                title: const Text('About Us'),
                trailing: const Icon(Icons.info),
                onTap: () {
                  // Navigate to the AboutUsScreen when the option is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutUsScreen()),
                  );
                },
              ),
              ListTile(
                title: const Text('Logout'),
                trailing: const Icon(Icons.logout),
                onTap: () {
                  // Handle logout logic (e.g., confirm and navigate to login)
                  _showLogoutConfirmationDialog(); // Show a confirmation dialog
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: GNav(
          backgroundColor: Colors.white,
          color: Colors.black,
          activeColor: Colors.blueAccent.shade700,
          tabBackgroundColor: Colors.blueAccent.withOpacity(0.1),
          tabs: const [
            GButton(icon: Icons.dashboard, text: 'DashBoard'),
            GButton(icon: Icons.tips_and_updates, text: 'Tips'),
            GButton(icon: Icons.settings, text: 'Setting'), // Mark Settings as selected
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
            switch (index) {
              case 0:
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DashBoard()));
                break;
              case 1:
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TipsScreen()));
                break;
              case 2:
                // Already on Settings screen, do nothing
                break;
            }
          },
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Perform logout actions (e.g., clear authentication data)
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage())); // Navigate to the login screen
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.white,
        elevation: 0.0, // Remove shadow for a cleaner look (optional)
      ),
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/1_tIhkxDo974YvI3_O00OX_Q.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Dark overlay to reduce brightness
          Container(
            color: Colors.black.withOpacity(0.6), // Adjust opacity to change brightness
            width: double.infinity,
            height: double.infinity,
          ),
          // Content
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Us',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'We are a group of second-year university students working on this project as part of our computing course. Our aim is to create a useful and user-friendly app to provide tips and support for quitting smoking. We hope that our app can help people on their journey to a smoke-free life.',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
