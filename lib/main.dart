import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/features/introduce.dart';
import 'consts/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroduceScreen(),
      title: 'My Music',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.light,
      defaultTransition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
    );
  }
}
