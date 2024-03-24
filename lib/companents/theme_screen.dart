import 'package:flutter/material.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change App Theme'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Set the theme to Light theme
                _setTheme(context, ThemeMode.light);
              },
              child: const Text('Light Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                // Set the theme to Dark theme
                _setTheme(context, ThemeMode.dark);
              },
              child: const Text('Dark Theme'),
            ),
          ],
        ),
      ),
    );
  }

  void _setTheme(BuildContext context, ThemeMode themeMode) {
    // Set the app's theme mode
    // You can use MaterialApp's theme property to set the theme mode directly
    final materialApp = MaterialApp(
      themeMode: themeMode,
      // Add your app's themes for light and dark mode
      theme: ThemeData.light(), // Replace with your light theme
      darkTheme: ThemeData.dark(), // Replace with your dark theme
      home: const Scaffold(), // Scaffold is required, but not used in this context
    );
    runApp(materialApp);

    // Navigate back to the previous screen (SettingsScreen)
    Navigator.pop(context);
  }
}
