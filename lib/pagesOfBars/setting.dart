import 'dart:io';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Settings> {
  bool isDarkMode =
      false; // Replace this with your app's actual dark mode state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                  // Add code to change the theme mode here, similar to what we did in the previous answers.
                });
              },
            ),
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                  // Add code to change the theme mode here, similar to what we did in the previous answers.
                });
              },
            ),
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                  // Add code to change the theme mode here, similar to what we did in the previous answers.
                });
              },
            ),
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                  // Add code to change the theme mode here, similar to what we did in the previous answers.
                });
              },
            ),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                  // Add code to change the theme mode here, similar to what we did in the previous answers.
                });
              },
            ),
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                  // Add code to change the theme mode here, similar to what we did in the previous answers.
                });
              },
            ),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('EXIT'),
              onTap: () => exit(exitCode)),
        ],
      ),
    );
  }
}
