import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/consts/colors.dart';
import 'package:musicapp/consts/images.dart';
import 'package:musicapp/features/login.dart';
import 'package:musicapp/features/signup.dart';
import '../../controllers/splashController.dart';

class WelcomeThree extends StatelessWidget {
  WelcomeThree({super.key});
  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    splashController.startAnimation;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromARGB(255, 67, 156, 70),
          Color.fromARGB(232, 34, 175, 197)
        ], begin: Alignment.topLeft, end: Alignment.centerRight)),
        child: Stack(
          children: [
            //png backgroung
            Obx(
              () => AnimatedPositioned(
                top: splashController.animate.value ? -100 : 0,
                right: splashController.animate.value ? -100 : 0,
                bottom: splashController.animate.value ? -50 : 0,
                left: splashController.animate.value ? -100 : 0,
                duration: Duration(milliseconds: 1600),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 1800),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Opacity(
                    opacity: 0.6,
                    child: Image(
                      image: AssetImage(back3),
                    ),
                  ),
                ),
              ),
            ),
            //the text of LET'S START...
            Obx(
              () => AnimatedPositioned(
                  bottom: splashController.animate.value ? 200 : -230,
                  left: splashController.animate.value ? 130 : -50,
                  duration: Duration(milliseconds: 1600),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 2000),
                    opacity: splashController.animate.value ? 1 : 0,
                    child: Text("Let's START...",
                        style: GoogleFonts.montserrat(
                          fontSize: 26,
                          color: AppColor.lslideColor,
                          fontWeight: FontWeight.w500,
                        )),
                  )),
            ),
            //IMAGE KAR
            Obx(
              () => AnimatedPositioned(
                  top: splashController.animate.value ? 50 : -130,
                  left: splashController.animate.value ? -20 : 0,
                  duration: Duration(milliseconds: 1600),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 2000),
                    opacity: splashController.animate.value ? 1 : 0,
                    child: Container(
                      width: 450,
                      height: 450,
                      child: Opacity(
                        opacity: 0.8,
                        child: Image(
                          image: AssetImage(
                            welcome3,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            //BUTTOMS of LOGIN AND SIGNUP
            Obx(() => Positioned(
                  left: 50,
                  bottom: 100,
                  child: AnimatedOpacity(
                      duration: Duration(milliseconds: 2000),
                      opacity: splashController.animate.value ? 1 : 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                Get.to(() => LoginPage());
                              },
                              // => Get.to(LoginPage()),
                              child: Text(
                                "LogIn".toUpperCase(),
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 46, 46, 46)),
                              )),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.blueAccent.shade200),
                                shadowColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.black38),
                              ),
                              onPressed: () {
                                Get.to(() => SignupPage());
                              },
                              child: Text(
                                "SignUp".toUpperCase(),
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30,
                                    color: Colors.black87),
                              ))
                        ],
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
