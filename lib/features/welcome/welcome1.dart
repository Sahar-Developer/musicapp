import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/consts/colors.dart';
import 'package:musicapp/consts/images.dart';
import '../../controllers/splashController.dart';

class WelcomeOne extends StatelessWidget {
  WelcomeOne({super.key});

  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    splashController.startAnimation();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColor.dbgDarkColor, AppColor.dslideColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Stack(
          children: [
            Obx(
              () => AnimatedPositioned(
                top: splashController.animate.value ? 0 : -30,
                right: splashController.animate.value ? 0 : -30,
                duration: Duration(milliseconds: 1000),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 1800),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Opacity(
                    opacity: 0.6,
                    child: Image(
                      image: AssetImage(back),
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                  bottom: splashController.animate.value ? 200 : -230,
                  left: splashController.animate.value ? 20 : -50,
                  duration: Duration(milliseconds: 1500),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 2000),
                    opacity: splashController.animate.value ? 1 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome to our Application!',
                            style: GoogleFonts.montserrat(
                              fontSize: 24,
                              color: AppColor.lslideColor,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text('We hope you have a great time!!',
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: AppColor.lbuttonColor,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),
                  )),
            ),
            Obx(
              () => AnimatedPositioned(
                  top: splashController.animate.value ? 80 : -130,
                  // left: 20,
                  // bottom: 240,
                  duration: Duration(milliseconds: 1600),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 2000),
                    opacity: splashController.animate.value ? 1 : 0,
                    child: Container(
                      width: 412,
                      height: 412,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(66, 71, 70, 70),
                            offset: Offset(2, 10),
                            blurRadius: double.infinity,
                            spreadRadius:
                                0.1, // The amount the box should be inflated prior to applying the blur
                            blurStyle: BlurStyle.solid)
                      ]),
                      child: Opacity(
                        opacity: 0.7,
                        child: Image(
                          // alignment: Alignment.center,
                          image: AssetImage(
                            welcome1,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
