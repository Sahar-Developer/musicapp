import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/pagesOfBars/favoritePage.dart';
import 'package:musicapp/pagesOfBars/homePage.dart';
import 'package:musicapp/pagesOfBars/recentlyPlayed.dart';
import 'package:musicapp/pagesOfBars/setting.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: bgDarkColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Sahar',
              // style: ourStyle(family: bold, size: 16),
            ),
            accountEmail: Text(
              'sahareyvazzade80@gmail.com',
              // style: ourStyle(family: regular, size: 12)
            ),
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
              // color: bgDarkColor,
              image: DecorationImage(
                  image: AssetImage('assets/trianglify-lowres.png'),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
              leading: const Icon(
                Icons.favorite,
                // color: whiteColor,
              ),
              title: Text(
                "Favorites",
                // style: ourStyle(color: whiteColor),
              ),
              onTap: () {
                Get.to(() => FavoritePage());
              }),
          ListTile(
              leading: const Icon(
                Icons.music_note,
                // color: whiteColor,
              ),
              title: Text(
                'All Songs',
                // style: ourStyle(color: whiteColor),
              ),
              onTap: () {
                Get.to(() => HomePage(
                      data: const [],
                    ));
              }),
          ListTile(
              leading: const Icon(
                Icons.timer,
                // color: whiteColor,
              ),
              title: Text(
                'Recently Played',
                // style: ourStyle(color: whiteColor),
              ),
              onTap: () {
                Get.to(() => RecentlyPlayedPage());
              }),
          ListTile(
            leading: const Icon(
              Icons.notifications,
              // color: whiteColor,
            ),
            title: Text(
              'Masseges',
              // style: ourStyle(color: whiteColor),
            ),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(
              Icons.download_outlined,
              // color: whiteColor,
            ),
            title: Text(
              'Downloads',
              // style: ourStyle(color: whiteColor),
            ),
            onTap: () => null,
          ),
          const Divider(
              // color: bgColor,
              ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              // color: whiteColor,
            ),
            title: Text(
              'Settings',
              // style: ourStyle(color: whiteColor),
            ),
            onTap: () => Get.to(Settings()),
          ),
          ListTile(
            leading: const Icon(
              Icons.feedback,
              // color: whiteColor,
            ),
            title: Text(
              'Feedback',
              // style: ourStyle(color: whiteColor),
            ),
            onTap: () => null,
          ),
          const Divider(
              // color: bgColor,
              ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              // color: whiteColor,
            ),
            title: Text(
              'Exit',
              // style: ourStyle(color: whiteColor),
            ),
            onTap: () => exit(exitCode),
          ),
        ],
      ),
    );
  }
}
