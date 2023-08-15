import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/pagesOfBars/feedBack.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Settings> {
  bool isDarkMode = false;

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
                  Get.changeThemeMode(
                      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                  isDarkMode = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Feedback'),
            trailing: Icon(Icons.message_outlined),
            onTap: () {
              Get.to(() => FeedbackPage());
            },
          ),
          ListTile(
            title: Text('Logout'),
          ),
          Divider(thickness: 1),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('EXIT'),
              onTap: () => exit(exitCode)),
        ],
      ),
    );
  }
}
