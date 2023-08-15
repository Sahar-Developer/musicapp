import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/consts/colors.dart';
import 'package:musicapp/consts/images.dart';
import '../../controllers/splashController.dart';

class WelcomeTwo extends StatelessWidget {
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
            gradient: LinearGradient(
                colors: [Colors.blue, const Color.fromARGB(209, 233, 30, 98)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: Stack(
          children: [
            Obx(
              () => Positioned(
                top: splashController.animate.value ? -150 : 0,
                right: splashController.animate.value ? -200 : 0,
                bottom: splashController.animate.value ? -300 : 0,
                left: splashController.animate.value ? -200 : 0,
                child: Opacity(
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Opacity(
                    opacity: 0.8,
                    child: Image(
                      image: AssetImage(back4),
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Positioned(
                  bottom: splashController.animate.value ? 200 : -230,
                  left: splashController.animate.value ? 40 : -50,
                  child: Opacity(
                    opacity: splashController.animate.value ? 1 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enjoy being UNLIMITED!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: 24,
                              color: AppColor.lslideColor,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Listen to music any time any place...',
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
              () => Positioned(
                  child: Opacity(
                opacity: splashController.animate.value ? 1 : 0,
                child: Container(
                  width: size.width,
                  height: size.height / 1.5,
                  child: Opacity(
                    opacity: 0.65,
                    child: Image(
                      image: AssetImage(
                        welcome2,
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
