import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/authenticationRepository/authenticationRepository.dart';
import 'package:musicapp/features/introduce.dart';
import 'package:musicapp/firebase_options.dart';
import 'consts/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(authenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
