import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/consts/colors.dart';
import 'package:musicapp/consts/images.dart';
import 'package:musicapp/views/home.dart';
import '../../controllers/splashController.dart';
import '../login.dart';
import '../signUp/signup.dart';

class WelcomeThree extends StatelessWidget {
  WelcomeThree({super.key});
  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    splashController.startAnimation;
    final size = MediaQuery.of(context).size;

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
              () => Positioned(
                top: splashController.animate.value ? -50 : 0,
                right: splashController.animate.value ? -100 : 0,
                bottom: splashController.animate.value ? -50 : 0,
                left: splashController.animate.value ? -100 : 0,
                child: Opacity(
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
            //the text of LET'S START...((FIRST SENARIO...))
            // Obx(
            //   () => Positioned(
            //       bottom: splashController.animate.value
            //           ? size.height * 0.35
            //           : -230,
            //       left:
            //           splashController.animate.value ? size.width * 0.30 : -50,
            //       child: Opacity(
            //         opacity: splashController.animate.value ? 1 : 0,
            //         child: Text("Let's START...",
            //             style: GoogleFonts.montserrat(
            //               fontSize: 26,
            //               color: AppColor.lslideColor,
            //               fontWeight: FontWeight.w500,
            //             )),
            //       )),
            // ),

            //IMAGE KAR
            Obx(
              () => Positioned(
                  top: splashController.animate.value
                      ? size.height * 0.055
                      : -10,
                  left: splashController.animate.value ? size.width * 0.01 : 0,
                  right: splashController.animate.value ? size.width * 0.01 : 0,
                  child: Opacity(
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

            //BUTTOMS of LOGIN AND SIGNUP((First Senario...))
            Obx(() => Positioned(
                  left: size.height * 0.05,
                  right: size.height * 0.05,
                  bottom: size.height * 0.2,
                  child: Opacity(
                      opacity: splashController.animate.value ? 1 : 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OutlinedButton(
                              child: Text(
                                "LogIn".toUpperCase(),
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 28,
                                    color: AppColor.lwhiteColor),
                              ),
                              onPressed: () {
                                Get.to(() => LoginPage());
                              }),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => AppColor.lwhiteColor),
                                shadowColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.black45),
                              ),
                              onPressed: () {
                                Get.to(() => SignupPage());
                              },
                              child: Text(
                                "SignUp".toUpperCase(),
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 28,
                                    color: AppColor.dwhiteColor),
                              ))
                        ],
                      )),
                )),

            //BUTTON OF GOING TO THE HOME ROUTE((SECOND SENARIO...))
            Obx(() => Positioned(
                bottom: size.height * 0.28,
                left: size.width * 0.1,
                right: size.width * 0.1,
                child: Opacity(
                    opacity: splashController.animate.value ? 1 : 0,
                    child: SizedBox(
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => Home());
                          },
                          child: Text(
                            "LET'S START",
                            style: GoogleFonts.montserrat(
                                color: AppColor.dwhiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                    ))))
          ],
        ),
      ),
    );
  }
}
