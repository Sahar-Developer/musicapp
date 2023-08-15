import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/pagesOfBars/favoritePage.dart';
import 'package:musicapp/pagesOfBars/feedBack.dart';
import 'package:musicapp/pagesOfBars/homePage.dart';
import 'package:musicapp/pagesOfBars/recentlyPlayed.dart';
import 'package:musicapp/pagesOfBars/setting.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Sahar'),
            accountEmail: Text('sahareyvazzade80@gmail.com'),
            currentAccountPicture: CircleAvatar(
                child: ClipOval(
              child: Image.asset(
                'assets/sahar.jpg',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            )),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/icon.png'), fit: BoxFit.cover),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.favorite),
              title: Text("Favorites"),
              onTap: () {
                Get.to(() => FavoritePage());
              }),
          ListTile(
              leading: const Icon(Icons.music_note),
              title: Text('All Songs'),
              onTap: () {
                Get.to(() => HomePage(data: const []));
              }),
          ListTile(
              leading: const Icon(Icons.timer),
              title: Text('Recently Played'),
              onTap: () {
                Get.to(() => RecentlyPlayedPage());
              }),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text('Masseges'),
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => Get.to(Settings()),
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: Text('Feedback'),
            onTap: () {
              Get.to(() => FeedbackPage());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => exit(exitCode),
          ),
        ],
      ),
    );
  }
}
