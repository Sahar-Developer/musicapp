import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:musicapp/pagesOfBars/searchPage.dart';
import 'package:musicapp/pagesOfBars/setting.dart';
// import '../consts/colors.dart';
import '../controllers/NavBar.dart';
import '../pagesOfBars/homePage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> pages = [
    HomePage(
      data: [],
    ),
    const SearchPage(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      bottomNavigationBar: GNav(
        // backgroundColor: bgDarkColor,
        // color: whiteColor,
        // activeColor: slideColor,
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      // backgroundColor: bgColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // Call the function to switch the theme mode
              Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
            },
            icon: Icon(
              Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
              size: 25,
            ),
          ),
        ],
        title: Row(children: [
          Text(
            "My",
            // style: TextStyle(color: AppColor.lslideColor),
            // style: ourStyle(family: bold, size: 22, color: whiteColor),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Music",
              // style: TextStyle(color: AppColor.dslideColor),
              // style: ourStyle(family: bold, size: 22, color: slideColor),
            ),
          ),
        ]),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
    );
  }
}
